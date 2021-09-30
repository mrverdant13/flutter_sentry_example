import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sentry_example/app.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

// Only default Sentry features.
Future<void> main() async => SentryFlutter.init(
      (options) => options..dsn = 'https://example@sentry.io/add-your-dsn-here',
      appRunner: () => runApp(
        MyApp(
          httpClient: http.Client(),
        ),
      ),
    );
