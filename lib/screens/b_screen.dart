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
              Text(
                'B Screen',
                style: Theme.of(context).textTheme.headline1,
                textAlign: TextAlign.center,
              ),
              ElevatedButton(
                onPressed: () =>
                    Navigator.of(context).pushNamed(CScreen.routeName),
                child: const Text('Go to `C Screen`'),
              ),
            ],
          ),
        ),
      );

  static const routeName = '/b';
}
