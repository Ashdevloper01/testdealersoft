import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:system_task_dealersoft/controllers/task_controller.dart';
import 'package:system_task_dealersoft/screens/tabbar_controller.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TaskController(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dealersoft',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}
