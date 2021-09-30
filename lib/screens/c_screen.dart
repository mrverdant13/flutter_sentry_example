import 'dart:developer';

import 'package:flutter/foundation.dart';
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
                      onPressed: _sendHttpRequest,
                      child: const Text('Send HTTP request to existing URI'),
                    ),
                    ElevatedButton(
                      onPressed: _throwHttpException,
                      child: const Text('Send HTTP request to nonexisting URI'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  Future<void> _sendHttpRequest() => httpClient
      .get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'))
      .then((value) => kDebugMode ? log(value.body, name: 'http') : null);

  Future<void> _throwHttpException() => httpClient.get(
        Uri.parse('http://this.uri.does.not.exist'),
      );

  static const routeName = '/c';
}
