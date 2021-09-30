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
              Text(
                'C Screen',
                style: Theme.of(context).textTheme.headline1,
                textAlign: TextAlign.center,
              ),
              const ErroredButton(),
            ],
          ),
        ),
      );

  static const routeName = '/c';
}

class ErroredButton extends StatefulWidget {
  const ErroredButton({Key? key}) : super(key: key);

  @override
  _ErroredButtonState createState() => _ErroredButtonState();
}

class _ErroredButtonState extends State<ErroredButton> {
  late final StateManager stateManager;

  @override
  void initState() {
    super.initState();
    stateManager = StateManager();
  }

  @override
  void dispose() {
    stateManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => ElevatedButton(
        onPressed: stateManager.throwException,
        child: const Text('Throw exception'),
      );
}

/// This could be an instance of any state management alternative.
class StateManager extends ChangeNotifier {
  void throwException() => throw Exception('This is a test exception.');
}
