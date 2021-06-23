import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:plante/base/result.dart';
import 'package:plante/logging/analytics.dart';
import 'package:plante/outside/backend/backend.dart';
import 'package:plante/outside/backend/backend_error.dart';
import 'package:plante/outside/identity/google_authorizer.dart';
import 'package:plante/outside/identity/google_user.dart';
import 'package:plante/model/user_params.dart';
import 'package:plante/ui/first_screen/external_auth_page.dart';

import '../../fake_analytics.dart';
import '../../widget_tester_extension.dart';
import 'external_auth_page_test.mocks.dart';

@GenerateMocks([GoogleAuthorizer, Backend])
void main() {
  late FakeAnalytics analytics;
  late MockGoogleAuthorizer googleAuthorizer;
  late MockBackend backend;

  setUp(() async {
    await GetIt.I.reset();
    googleAuthorizer = MockGoogleAuthorizer();
    GetIt.I.registerSingleton<GoogleAuthorizer>(googleAuthorizer);
    backend = MockBackend();
    GetIt.I.registerSingleton<Backend>(backend);
    analytics = FakeAnalytics();
    GetIt.I.registerSingleton<Analytics>(analytics);
  });

  testWidgets('Successful Google Sign in', (WidgetTester tester) async {
    final googleUser = GoogleUser('bob', 'bob@bo.net', '123', DateTime.now());
    when(googleAuthorizer.auth()).thenAnswer((_) async => googleUser);
    when(backend.loginOrRegister(any)).thenAnswer((_) async => Ok(UserParams()));

    expect(analytics.allEvents(), equals([]));

    UserParams? obtainedParams;
    await tester.superPump(
        ExternalAuthPage((params) async {
          obtainedParams = params;
          return true;
        }));

    await tester.tap(find.text('Google'));

    // We expect the Google name to be sent to the server
    final expectedParams = UserParams((e) => e.name = 'bob');
    expect(obtainedParams, equals(expectedParams));

    expect(analytics.allEvents().length, equals(2));
    expect(analytics.wasEventSent('google_auth_start'), isTrue);
    expect(analytics.wasEventSent('google_auth_success'), isTrue);
  });

  testWidgets('Not successful Google Sign in', (WidgetTester tester) async {
    when(googleAuthorizer.auth()).thenAnswer((_) async => null);

    UserParams? obtainedResult;
    await tester.superPump(
        ExternalAuthPage((params) async {
          obtainedResult = params;
          return true;
        }));

    await tester.tap(find.text('Google'));
    expect(obtainedResult, equals(null));

    expect(analytics.allEvents().length, equals(2));
    expect(analytics.wasEventSent('google_auth_start'), isTrue);
    expect(analytics.wasEventSent('google_auth_google_error'), isTrue);
  });

  testWidgets('Not successful backend sign in', (WidgetTester tester) async {
    final googleUser = GoogleUser('bob', 'bob@bo.net', '123', DateTime.now());
    when(googleAuthorizer.auth()).thenAnswer((_) async => googleUser);
    when(backend.loginOrRegister(any)).thenAnswer((_) async =>
        Err(BackendError.other()));

    expect(analytics.allEvents(), equals([]));

    UserParams? obtainedResult;
    await tester.superPump(
        ExternalAuthPage((params) async {
          obtainedResult = params;
          return true;
        }));

    await tester.tap(find.text('Google'));
    expect(obtainedResult, equals(null));

    expect(analytics.allEvents().length, equals(2));
    expect(analytics.wasEventSent('google_auth_start'), isTrue);
    expect(analytics.wasEventSent('google_auth_backend_error'), isTrue);
  });
}
