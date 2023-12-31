import 'package:app003/Firstproject/page/first.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

void main() { 
  Intl.defaultLocale = 'th';
  initializeDateFormatting();
  runApp(const MyApp());
  }
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) => const MaterialApp(
    home: FirstPage(),
  );
}