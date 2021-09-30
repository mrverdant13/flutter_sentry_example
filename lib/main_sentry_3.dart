import 'dart:async';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sentry_example/app.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

const _dartSourceName = 'dart';

// Default Sentry features, logging and navigation observation for breadcrumbs.
Future<void> main() async => runZonedGuarded(
      () async {
        WidgetsFlutterBinding.ensureInitialized();
        await SentryFlutter.init(
          (options) =>
              // Only on release mode. Otherwise, assign an empty string.
              options..dsn = 'https://example@sentry.io/add-your-dsn-here',
          appRunner: () => runApp(
            MyApp(
              httpClient: http.Client(),
              navigatorObservers: [
                SentryNavigatorObserver(),
              ],
            ),
          ),
        );
      },
      (e, st) async {
        if (kDebugMode) {
          log(
            e.toString(),
            error: e,
            stackTrace: st,
            name: _dartSourceName,
          );
        }

        // if (kReleaseMode) // Only on release mode.
        {
          await Sentry.captureException(e, stackTrace: st);
        }
      },
    );
