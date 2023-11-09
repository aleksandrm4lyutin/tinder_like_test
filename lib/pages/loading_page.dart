import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

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

          const Center(
            child: CircularProgressIndicator(color: Colors.white54,),
          ),
        ],
      ),
    );
  }
}
