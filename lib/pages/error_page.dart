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
      backgroundColor: Colors.grey,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: RadialGradient(
                    radius: 1.5,
                    colors: [
                      Colors.black.withOpacity(0),
                      Colors.black,
                    ]
                )
            ),
          ),

          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  error,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.red, fontSize: 18),
                ),
                const SizedBox(height: 28),
                TextButton(
                  onPressed: () {
                    callback();
                  },
                  child: const Text(
                    'Try again',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 28, color: Colors.white54),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}