import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ucabgo_ui/pages/login.dart';
import 'package:ucabgo_ui/pages/trip_page.dart';
import 'package:ucabgo_ui/pages/register.dart';
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
      theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Color.fromARGB(255, 21, 102, 170),
          accentColor: Color.fromARGB(255, 174, 209, 238)),
      routes: {
        '/': (context) => const Login(),
        '/register': (context) => const Register(),
        '/tripPage': (context) => const TripPage(),
      },
    );
  }
}
