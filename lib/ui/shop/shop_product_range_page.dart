import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:plante/base/base.dart';
import 'package:plante/l10n/strings.dart';
import 'package:plante/logging/log.dart';
import 'package:plante/model/product.dart';
import 'package:plante/model/shop.dart';
import 'package:plante/model/user_params_controller.dart';
import 'package:plante/outside/map/address_obtainer.dart';
import 'package:plante/outside/map/shops_manager.dart';
import 'package:plante/outside/map/shops_manager_types.dart';
import 'package:plante/ui/base/colors_plante.dart';
import 'package:plante/ui/base/components/address_widget.dart';
import 'package:plante/ui/base/components/animated_cross_fade_plante.dart';
import 'package:plante/ui/base/components/button_filled_plante.dart';
import 'package:plante/ui/base/components/check_button_plante.dart';
import 'package:plante/ui/base/components/fab_plante.dart';
import 'package:plante/ui/base/components/fading_edge_plante.dart';
import 'package:plante/ui/base/components/product_card.dart';
import 'package:plante/ui/base/page_state_plante.dart';
import 'package:plante/ui/base/snack_bar_utils.dart';
import 'package:plante/ui/base/text_styles.dart';
import 'package:plante/ui/base/ui_utils.dart';
import 'package:plante/ui/product/product_page_wrapper.dart';
import 'package:plante/ui/scan/barcode_scan_page.dart';
import 'package:plante/ui/shop/shop_product_range_page_model.dart';

class ShopProductRangePage extends StatefulWidget {
  final Shop shop;
  final VoidCallback? addressLoadFinishCallback;
  final _testingStorage = _TestingStorage();
  ShopProductRangePage._(
      {Key? key, required this.shop, this.addressLoadFinishCallback})
      : super(key: key);

  @visibleForTesting
  static ShopProductRangePage createForTesting(Shop shop,
      {VoidCallback? addressLoadFinishCallback}) {
    if (!isInTests()) {
      throw Exception('!isInTests()');
    }
    return ShopProductRangePage._(
        shop: shop, addressLoadFinishCallback: addressLoadFinishCallback);
  }

  static void show(
      {Key? key, required BuildContext context, required Shop shop}) {
    final args = [
      shop.toJson(),
    ];
    Navigator.restorablePush(context, _routeBuilder, arguments: args);
  }

  static Route<void> _routeBuilder(BuildContext context, Object? arguments) {
    return MaterialPageRoute<void>(builder: (BuildContext context) {
      Shop shop = Shop.empty;
      if (arguments != null) {
        final args = arguments as List<dynamic>;
        shop = Shop.fromJson(args[0] as Map<dynamic, dynamic>) ?? Shop.empty;
      }
      if (shop == Shop.empty) {
        Log.e('ShopProductRangePage is created with invalid arguments or '
            'without any. Args: $arguments');
      }
      return ShopProductRangePage._(shop: shop);
    });
  }

  @override
  _ShopProductRangePageState createState() => _ShopProductRangePageState();

  @visibleForTesting
  void forceContentReloadForTesting() {
    if (!isInTests()) {
      throw Exception('forceContentReloadForTesting called not in tests');
    }
    _testingStorage.forceReload!.call();
  }
}

class _TestingStorage {
  VoidCallback? forceReload;
}

class _ShopProductRangePageState extends PageStatePlante<ShopProductRangePage> {
  static const _LIST_GRADIENT_SIZE = 12.0;
  late final ShopProductRangePageModel _model;
  final _votedProducts = <String>[];

  _ShopProductRangePageState() : super('ShopProductRangePage');

  @override
  void initState() {
    super.initState();
    final updateCallback = () {
      if (mounted) {
        setState(() {
          // Update!
        });
      }
    };
    _model = ShopProductRangePageModel(
        GetIt.I.get<ShopsManager>(),
        GetIt.I.get<UserParamsController>(),
        GetIt.I.get<AddressObtainer>(),
        widget.shop,
        updateCallback);
    initializeDateFormatting();

    widget._testingStorage.forceReload = _model.reload;
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget buildPage(BuildContext context) {
    Widget content;
    final errorWrapper = (Widget child) {
      return Padding(
          padding: const EdgeInsets.all(16), child: Center(child: child));
    };
    final errorText = (String text) =>
        Text(text, textAlign: TextAlign.center, style: TextStyles.normal);

    if (_model.loading) {
      content = const Center(child: CircularProgressIndicator());
    } else if (_model.loadedRangeRes.isErr) {
      if (_model.loadedRangeRes.unwrapErr() ==
          ShopsManagerError.NETWORK_ERROR) {
        content = errorWrapper(
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          errorText(context.strings.global_network_error),
          const SizedBox(height: 8),
          ButtonFilledPlante.withText(context.strings.global_try_again,
              onPressed: _model.reload)
        ]));
      } else {
        content = errorWrapper(
            errorText(context.strings.global_something_went_wrong));
      }
    } else if (_model.loadedProducts.isEmpty) {
      content = errorWrapper(errorText(
          context.strings.shop_product_range_page_this_shop_has_no_product));
    } else {
      final widgets =
          _model.loadedProducts.map((e) => _productToCard(e, context)).toList();
      widgets.insert(0, const SizedBox(height: _LIST_GRADIENT_SIZE));
      widgets.add(const SizedBox(height: _LIST_GRADIENT_SIZE));
      content = ListView(children: widgets);
    }
    return Scaffold(
      backgroundColor: ColorsPlante.lightGrey,
      body: SafeArea(
          child: Stack(children: [
        Column(children: [
          Padding(
            padding: const EdgeInsets.only(left: 24, right: 24, top: 44),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  textDirection: TextDirection.rtl,
                  children: [
                    FabPlante.closeBtnPopOnClick(
                        key: const Key('close_button')),
                    Expanded(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                          Text(widget.shop.name, style: TextStyles.headline1),
                          const SizedBox(height: 3),
                          AddressWidget.forShop(widget.shop, _model.address(),
                              loadCompletedCallback:
                                  widget.addressLoadFinishCallback),
                        ])),
                  ]),
            ]),
          ),
          const SizedBox(height: _LIST_GRADIENT_SIZE),
          Expanded(
              child: Stack(children: [
            content,
            const Positioned.fill(
                top: -2,
                child: FadingEdgePlante(
                    direction: FadingEdgeDirection.TOP_TO_BOTTOM,
                    size: _LIST_GRADIENT_SIZE,
                    color: ColorsPlante.lightGrey)),
            const Positioned.fill(
                bottom: -2,
                child: FadingEdgePlante(
                    direction: FadingEdgeDirection.BOTTOM_TO_TOP,
                    size: _LIST_GRADIENT_SIZE,
                    color: ColorsPlante.lightGrey)),
          ])),
          const SizedBox(height: _LIST_GRADIENT_SIZE),
          Padding(
              padding: const EdgeInsets.only(
                  left: 24, right: 24, top: 0, bottom: 21),
              child: SizedBox(
                  width: double.infinity,
                  child: ButtonFilledPlante.withText(
                      context.strings.shop_product_range_page_add_product,
                      onPressed: !_model.loading ? _onAddProductClick : null))),
        ]),
        Positioned.fill(
            child: AnimatedCrossFadePlante(
          crossFadeState: _model.performingBackendAction
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          firstChild: const SizedBox.shrink(),
          secondChild: Container(
            color: const Color(0x70FFFFFF),
            child: const Center(child: CircularProgressIndicator()),
          ),
        ))
      ])),
    );
  }

  Widget _productToCard(Product product, BuildContext context) {
    final dateStr = secsSinceEpochToStr(_model.lastSeenSecs(product), context);

    final cardExtraContent = Padding(
        padding: const EdgeInsets.only(left: 6, right: 6, bottom: 6),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(height: 18),
          Text(
              context
                  .strings.shop_product_range_page_have_you_seen_product_here,
              style: TextStyles.normal),
          const SizedBox(height: 12),
          Row(children: [
            Expanded(
                child: CheckButtonPlante(
              checked: false,
              text: context.strings.global_no,
              onChanged: (_) {
                _onProductPresenceVote(product, false);
              },
            )),
            const SizedBox(width: 13),
            Expanded(
                child: CheckButtonPlante(
              checked: false,
              text: context.strings.global_yes,
              onChanged: (_) {
                _onProductPresenceVote(product, true);
              },
            )),
          ])
        ]));

    return Padding(
        key: Key('product_${product.barcode}'),
        padding: const EdgeInsets.only(bottom: 8, left: 16, right: 16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ProductCard(
              product: product,
              hint:
                  '${context.strings.shop_product_range_page_product_last_seen_here}$dateStr',
              beholder: _model.user,
              extraContentBottom: _votedProducts.contains(product.barcode)
                  ? null
                  : cardExtraContent,
              onTap: () {
                _openProductPage(product);
              }),
        ]));
  }

  void _openProductPage(Product product) {
    ProductPageWrapper.show(context, product,
        productUpdatedCallback: _model.onProductUpdate);
  }

  void _onProductPresenceVote(Product product, bool positive) async {
    final title = positive
        ? context.strings.shop_product_range_page_you_sure_positive_vote
        : context.strings.shop_product_range_page_you_sure_negative_vote;
    await showYesNoDialog(context, title, () async {
      final result = await _model.productPresenceVote(product, positive);
      if (result.isOk) {
        showSnackBar(context.strings.global_done_thanks, context);
        setState(() {
          _votedProducts.add(product.barcode);
        });
      } else if (result.unwrapErr() == ShopsManagerError.NETWORK_ERROR) {
        showSnackBar(context.strings.global_network_error, context);
      } else {
        showSnackBar(context.strings.global_something_went_wrong, context);
      }
    });
  }

  void _onAddProductClick() async {
    await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                BarcodeScanPage(addProductToShop: widget.shop)));
  }
}
