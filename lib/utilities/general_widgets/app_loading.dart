import 'package:flutter/material.dart';

class AppLoading extends StatelessWidget {
  const AppLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image(
            image: AssetImage('assets/splash_screen.png'),
          ),
          CircularProgressIndicator(),
        ],
      ),
    );
  }
}
