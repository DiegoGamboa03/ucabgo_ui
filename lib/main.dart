import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/pages/login_page.dart';
import '/pages/trip_page.dart';
import '/pages/register_page.dart';
import 'package:ucabgo_ui/providers/markers_provider.dart';
import 'package:ucabgo_ui/providers/polygons_provider.dart';
import 'package:ucabgo_ui/providers/users_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Markers()),
        ChangeNotifierProvider(create: (_) => Polygons()),
        ChangeNotifierProvider(create: (_) => Users()),
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
      theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Color.fromARGB(255, 21, 102, 170)),
      routes: {
        '/': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/tripPage': (context) => const TripPage(),
      },
    );
  }
}
