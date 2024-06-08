import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_bloc/components.dart';
import 'package:todo_bloc/src/features/splash_screen/presentation/ui/screens/splash_screen.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: kDebugMode,
      theme: theme(),
      darkTheme: theme(brightness: Brightness.dark),
      home: AnnotatedRegion<SystemUiOverlayStyle>(
        value: setSafeAreaColor(context),
        child: const SplashScreen(),
      ),
    );
  }
}
