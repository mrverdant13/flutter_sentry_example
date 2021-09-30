import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CScreen extends StatelessWidget {
  const CScreen({
    Key? key,
    required this.httpClient,
  }) : super(key: key);

  final http.Client httpClient;

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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: _throwPureDartException,
                      child: const Text('Throw pure Dart exception'),
                    ),
                    ElevatedButton(
                      onPressed: _throwHttpException,
                      child: const Text('Throw HTTP exception'),
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

  Future<void> _throwHttpException() => httpClient.get(
        Uri.parse('http://this.uri.does.not.exist'),
      );

  static const routeName = '/c';
}
