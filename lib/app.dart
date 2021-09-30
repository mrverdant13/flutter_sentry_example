import 'package:flutter/material.dart';
import 'package:sentry_example/screens/a_screen.dart';
import 'package:sentry_example/screens/b_screen.dart';
import 'package:sentry_example/screens/c_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Sentry Example',
        initialRoute: AScreen.routeName,
        routes: {
          AScreen.routeName: (context) => const AScreen(),
          BScreen.routeName: (context) => const BScreen(),
          CScreen.routeName: (context) => const CScreen(),
        },
      );
}
