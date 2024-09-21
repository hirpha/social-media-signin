import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:social_media_sign/home.dart';
import 'package:social_media_sign/profile.dart';
import 'package:social_media_sign/splash.dart';

import 'login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      initialRoute: WelcomeScreen.routeName,
      onGenerateRoute: (settings) {
        if (settings.name == WelcomeScreen.routeName) {
          return MaterialPageRoute(builder: (context) => WelcomeScreen());
        }
        if (settings.name == SignInScreen.routeName) {
          return MaterialPageRoute(builder: (context) => SignInScreen());
        }
        if (settings.name == HomeScreen.routeName) {
          return MaterialPageRoute(builder: (context) => HomeScreen());
        }
        if (settings.name == ProfileScreen.routeName) {
          return MaterialPageRoute(builder: (context) => ProfileScreen());
        }

        return MaterialPageRoute(
            builder: (context) => Scaffold(
                  appBar: AppBar(
                    title: Text(settings.name ?? ""),
                  ),
                  body: Container(
                    child: Text("helloo"),
                  ),
                ));
      },
    );
  }
}
