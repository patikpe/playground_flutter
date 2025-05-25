import 'package:flutter/material.dart';

class ScreenNotFound extends StatelessWidget {
  const ScreenNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(
          child: Column(
        children: [
          Text('This Screen is not ready or not found'),
        ],
      )),
    );
  }
}
