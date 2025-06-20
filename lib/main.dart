import 'package:flutter/material.dart';
import 'package:technews_flutter/pages/home.dart';
import 'package:technews_flutter/utils/colors.dart';

void main() => runApp( MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark, primaryColor: AppColors.primary,
      ),
      home: Home(),
    );
  }
}
