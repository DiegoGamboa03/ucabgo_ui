import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '/pages/login_page.dart';
import '/pages/trip_page.dart';
import '/pages/register_page.dart';
import '/pages/register_page_student.dart';
import '/pages/register_page_other.dart';
import '/pages/profile_page.dart';
import '/pages/edit_profile_page.dart';
import '/pages/forget_password_page.dart';
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
          textTheme: GoogleFonts.latoTextTheme(),
          brightness: Brightness.light,
          primaryColor: Color.fromARGB(255, 21, 102, 170)),
      routes: {
        '/': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/registerStudent': (context) => const RegisterStudentPage(),
        '/registerOther': (context) => const RegisterOtherPage(),
        '/tripPage': (context) => const TripPage(),
        '/profilePage': (context) => const ProfilePage(),
        '/editProfilePage': (context) => const EditProfilePage(),
        '/forgetPasswordPage': (context) => const ForgetPasswordPage(),
      },
    );
  }
}
