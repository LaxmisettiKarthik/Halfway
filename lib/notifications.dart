import 'package:flutter/material.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
        appBar: AppBar(title: Text('Notifications')),
        body: Center(
          child: Text('Woohoo!!! No notifications...'),
        ));
  }
}
