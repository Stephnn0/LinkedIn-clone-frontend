import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final String ownerId;

  const ProfileScreen({super.key, required this.ownerId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Center(
        child: Text(ownerId),
      ),
    );
  }
}
