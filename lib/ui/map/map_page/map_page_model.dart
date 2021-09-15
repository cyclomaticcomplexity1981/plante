import 'dart:async';
import 'dart:collection';
import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:plante/base/base.dart';
import 'package:plante/base/result.dart';
import 'package:plante/location/location_controller.dart';
import 'package:plante/model/coord.dart';
import 'package:plante/model/coords_bounds.dart';
import 'package:plante/model/product.dart';
import 'package:plante/model/shop.dart';
import 'package:plante/model/shop_type.dart';
import 'package:plante/outside/map/address_obtainer.dart';
import 'package:plante/outside/map/shops_manager.dart';
import 'package:plante/outside/map/shops_manager_types.dart';
import 'package:plante/ui/map/latest_camera_pos_storage.dart';

enum MapPageModelError {
  NETWORK_ERROR,
  OTHER,
}

class MapPageModel implements ShopsManagerListener {
  static const DEFAULT_USER_POS = LatLng(37.49777, -122.22195);

  final ArgCallback<Map<String, Shop>> _updateShopsCallback;
  final ArgCallback<MapPageModelError> _errorCallback;
  final VoidCallback _updateCallback;
  final VoidCallback _loadingChangeCallback;
  final LocationController _locationController;
  final ShopsManager _shopsManager;
  final AddressObtainer _addressObtainer;
  final LatestCameraPosStorage _latestCameraPosStorage;

  CoordsBounds? _latestViewPort;
  bool _networkOperationInProgress = false;

  Map<String, Shop> _shopsCache = {};

  MapPageModel(
      this._locationController,
      this._shopsManager,
      this._addressObtainer,
      this._latestCameraPosStorage,
      this._updateShopsCallback,
      this._errorCallback,
      this._updateCallback,
      this._loadingChangeCallback) {
    _shopsManager.addListener(this);
  }

  void dispose() {
    _shopsManager.removeListener(this);
  }

  bool get loading => _networkOperationInProgress;
  Map<String, Shop> get shopsCache => UnmodifiableMapView(_shopsCache);

  CameraPosition? initialCameraPosInstant() {
    var result = _latestCameraPosStorage.getCached();
    if (result != null) {
      return _pointToCameraPos(result);
    }
    result = _locationController.lastKnownPositionInstant();
    if (result != null) {
      return _pointToCameraPos(result);
    }
    return null;
  }

  Future<CameraPosition> initialCameraPos() async {
    var result = await _latestCameraPosStorage.get();
    if (result != null) {
      return _pointToCameraPos(result);
    }
    result = await _locationController.lastKnownPosition();
    if (result != null) {
      return _pointToCameraPos(result);
    }
    final _completer = Completer<CameraPosition>();
    _locationController.callWhenLastPositionKnown((pos) {
      _completer.complete(_pointToCameraPos(pos));
    });
    return _completer.future;
  }

  CameraPosition defaultUserPos() {
    return const CameraPosition(target: DEFAULT_USER_POS, zoom: 15);
  }

  CameraPosition _pointToCameraPos(Coord point) {
    return CameraPosition(target: point.toLatLng(), zoom: 15);
  }

  Future<CameraPosition?> currentUserPos() async {
    final result = await _locationController.currentPosition();
    if (result != null) {
      return _pointToCameraPos(result);
    }
  }

  Future<void> onCameraMoved(CoordsBounds viewBounds) async {
    _latestViewPort = viewBounds;
    unawaited(_latestCameraPosStorage.set(viewBounds.center));

    final result = await _networkOperation(() async {
      return await _shopsManager.fetchShops(viewBounds);
    });

    if (result.isOk) {
      _shopsCache = result.unwrap();
      _updateShopsCallback.call(result.unwrap());
    } else {
      _errorCallback.call(_convertShopsManagerError(result.unwrapErr()));
    }
    _updateCallback.call();
  }

  Future<T> _networkOperation<T>(Future<T> Function() operation) async {
    _networkOperationInProgress = true;
    _updateCallback.call();
    _loadingChangeCallback.call();
    try {
      return await operation.call();
    } finally {
      _networkOperationInProgress = false;
      _updateCallback.call();
      _loadingChangeCallback.call();
    }
  }

  Future<Result<None, ShopsManagerError>> putProductToShops(
      Product product, List<Shop> shops) async {
    return await _networkOperation(() async {
      return await _shopsManager.putProductToShops(product, shops);
    });
  }

  Future<Result<Shop, ShopsManagerError>> createShop(
      String name, ShopType type, Coord coord) async {
    return await _networkOperation(() async {
      return await _shopsManager.createShop(
        name: name,
        coord: coord,
        type: type,
      );
    });
  }

  FutureShortAddress addressOf(Shop shop) async {
    return await _addressObtainer.addressOfShop(shop);
  }

  @override
  void onLocalShopsChange() {
    /// Invalidating cache!
    if (_latestViewPort != null) {
      onCameraMoved(_latestViewPort!);
    }
  }

  void finishWith<T>(BuildContext context, T result) {
    Navigator.pop(context, result);
  }
}

MapPageModelError _convertShopsManagerError(ShopsManagerError error) {
  switch (error) {
    case ShopsManagerError.NETWORK_ERROR:
      return MapPageModelError.NETWORK_ERROR;
    case ShopsManagerError.OSM_SERVERS_ERROR:
      return MapPageModelError.OTHER;
    case ShopsManagerError.OTHER:
      return MapPageModelError.OTHER;
  }
}

extension _CoordExt on Coord {
  LatLng toLatLng() => LatLng(lat, lon);
}
