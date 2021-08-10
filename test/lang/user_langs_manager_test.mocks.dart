// Mocks generated by Mockito 5.0.10 from annotations
// in plante/test/lang/user_langs_manager_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:plante/base/result.dart' as _i2;
import 'package:plante/lang/location_based_user_langs_manager.dart' as _i3;
import 'package:plante/lang/manual_user_langs_manager.dart' as _i6;
import 'package:plante/lang/user_langs_manager_error.dart' as _i8;
import 'package:plante/model/lang_code.dart' as _i5;
import 'package:plante/model/user_params.dart' as _i7;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: comment_references
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeResult<OK, ERR> extends _i1.Fake implements _i2.Result<OK, ERR> {}

/// A class which mocks [LocationBasedUserLangsManager].
///
/// See the documentation for Mockito's code generation for more information.
class MockLocationBasedUserLangsManager extends _i1.Mock
    implements _i3.LocationBasedUserLangsManager {
  MockLocationBasedUserLangsManager() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<void> get initFuture =>
      (super.noSuchMethod(Invocation.getter(#initFuture),
          returnValue: Future<void>.value()) as _i4.Future<void>);
  @override
  _i4.Future<List<_i5.LangCode>?> getUserLangs() =>
      (super.noSuchMethod(Invocation.method(#getUserLangs, []),
              returnValue: Future<List<_i5.LangCode>?>.value())
          as _i4.Future<List<_i5.LangCode>?>);
}

/// A class which mocks [ManualUserLangsManager].
///
/// See the documentation for Mockito's code generation for more information.
class MockManualUserLangsManager extends _i1.Mock
    implements _i6.ManualUserLangsManager {
  MockManualUserLangsManager() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<void> get initFuture =>
      (super.noSuchMethod(Invocation.getter(#initFuture),
          returnValue: Future<void>.value()) as _i4.Future<void>);
  @override
  void onUserParamsUpdate(_i7.UserParams? userParams) =>
      super.noSuchMethod(Invocation.method(#onUserParamsUpdate, [userParams]),
          returnValueForMissingStub: null);
  @override
  _i4.Future<List<_i5.LangCode>?> getUserLangs() =>
      (super.noSuchMethod(Invocation.method(#getUserLangs, []),
              returnValue: Future<List<_i5.LangCode>?>.value())
          as _i4.Future<List<_i5.LangCode>?>);
  @override
  _i4.Future<_i2.Result<_i7.UserParams, _i8.UserLangsManagerError>>
      setUserLangs(List<_i5.LangCode>? langs) => (super.noSuchMethod(
          Invocation.method(#setUserLangs, [langs]),
          returnValue: Future<
                  _i2.Result<_i7.UserParams, _i8.UserLangsManagerError>>.value(
              _FakeResult<_i7.UserParams, _i8.UserLangsManagerError>())) as _i4
          .Future<_i2.Result<_i7.UserParams, _i8.UserLangsManagerError>>);
}
