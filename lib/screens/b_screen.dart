import 'package:flutter/material.dart';
import 'package:sentry_example/screens/c_screen.dart';

class BScreen extends StatelessWidget {
  const BScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('B Screen'),
        ),
        body: SizedBox.expand(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Text(
                'B Screen',
                style: Theme.of(context).textTheme.headline2,
                textAlign: TextAlign.center,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () =>
                          Navigator.of(context).pushNamed(CScreen.routeName),
                      child: const Text('Go to `C Screen`'),
                    ),
                    ElevatedButton(
                      onPressed: _throwFlutterException,
                      child: const Text('Throw Flutter exception'),
                    ),
                    ElevatedButton(
                      onPressed: _throwPureDartException,
                      child: const Text('Throw pure Dart exception'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  void _throwPureDartException() => Future<void>.error(
        Exception('This is a pure Dart exception.'),
        StackTrace.current,
      );

  void _throwFlutterException() => FlutterError.reportError(
        FlutterErrorDetails(
          exception: Exception('This is a Flutter exception'),
          stack: StackTrace.current,
        ),
      );

  static const routeName = '/b';
}
