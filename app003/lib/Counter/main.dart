import 'package:flutter/material.dart';
import 'counter_view.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme(
          primary: Colors.orange,
          secondary: Colors.amber,
          background: Colors.white,
          surface: Colors.white,
          brightness: Brightness.light,
          error: Colors.red[900]!,
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onBackground: Colors.black,
          onSurface: Colors.black,
          onError: Colors.white,
        ),
      ),
      home: const CounterView(),
    );
  }
}
