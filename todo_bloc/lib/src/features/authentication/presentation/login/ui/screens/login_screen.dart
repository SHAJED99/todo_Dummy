import 'package:flutter/material.dart';
import 'package:todo_bloc/src/services/dev_tools/dev_scaffold.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return DevScaffold(
      child: Scaffold(),
    );
  }
}
