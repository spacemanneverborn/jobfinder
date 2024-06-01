import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'features/authentication/view/login_screen.dart';
import 'features/authentication/view/register_screen.dart';
import 'features/jobs/view/job_list_screen.dart';
import 'features/jobs/view/job_detail_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JobFinder',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        //'/home': (context) => JobListScreen(),
        //'/jobDetail': (context) => JobDetailScreen(),
      },
    );
  }
}