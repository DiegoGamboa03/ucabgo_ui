import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ucabgo_ui/pages/login.dart';
import 'package:ucabgo_ui/pages/trip_page.dart';
import 'package:ucabgo_ui/providers/landmarks_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Markers()),
      ],
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
      initialRoute: '/',
      routes: {
        '/': (context) => const Login(),
        '/tripPage': (context) => const TripPage(),
      },
    );
  }
}
