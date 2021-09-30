import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sentry_example/app.dart';

void main() => runApp(
      MyApp(
        httpClient: http.Client(),
      ),
    );
