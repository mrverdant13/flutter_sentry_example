import 'package:flutter/material.dart';

class CScreen extends StatelessWidget {
  const CScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('C Screen'),
        ),
        body: SizedBox.expand(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Text(
                'C Screen',
                style: Theme.of(context).textTheme.headline2,
                textAlign: TextAlign.center,
              ),
              Expanded(
                child: Center(
                  child: ElevatedButton(
                    onPressed: _throwPureDartException,
                    child: const Text('Throw pure Dart exception'),
                  ),
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

  static const routeName = '/c';
}
