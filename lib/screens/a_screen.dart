import 'package:flutter/material.dart';
import 'package:sentry_example/screens/b_screen.dart';

class AScreen extends StatelessWidget {
  const AScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('A Screen'),
        ),
        body: SizedBox.expand(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Text(
                'A Screen',
                style: Theme.of(context).textTheme.headline2,
                textAlign: TextAlign.center,
              ),
              Expanded(
                child: Center(
                  child: ElevatedButton(
                    onPressed: () =>
                        Navigator.of(context).pushNamed(BScreen.routeName),
                    child: const Text('Go to `B Screen`'),
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  static const routeName = '/a';
}
