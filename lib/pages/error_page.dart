import 'package:flutter/material.dart';


class ErrorPage extends StatelessWidget {

  final String error;
  final Function callback;

  const ErrorPage({super.key,
    required this.callback,
    required this.error,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              error,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.red, fontSize: 20),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                callback();
              },
              child: const Text(
                'Try again',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}