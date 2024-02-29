import 'package:flutter/material.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        elevation: 0,
        leading: BackButton(color: Theme.of(context).colorScheme.secondary),
        title: Text(
          'Change Password',
          style: TextStyle(color: Theme.of(context).colorScheme.secondary),
        ),
      ),
    );
  }
}
