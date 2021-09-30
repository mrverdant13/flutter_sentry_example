import 'dart:async';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sentry_example/app.dart';

const _flutterSourceName = 'flutter';
const _dartSourceName = 'dart';

void main() {
  runZonedGuarded(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      FlutterError.onError = (details) {
        final e = details.exception;
        final st = details.stack;
        if (kDebugMode) {
          // Mode check for `presentError` is redundant.
          FlutterError.presentError(details);
          log(
            e.toString(),
            error: e,
            stackTrace: st,
            name: _flutterSourceName,
          );
        }

        if (kReleaseMode) {
          // Report error to server.
        }
      };

      final httpClient = http.Client();

      runApp(
        MyApp(
          httpClient: httpClient,
        ),
      );
    },
    (e, st) {
      if (kDebugMode) {
        log(
          e.toString(),
          error: e,
          stackTrace: st,
          name: _dartSourceName,
        );
      }
      if (kReleaseMode) {
        // Report error to server.
      }
    },
  );
}
