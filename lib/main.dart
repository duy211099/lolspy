import 'package:flutter/material.dart';
import 'package:lolspy/src/config/custom_router.dart';
import 'package:lolspy/src/screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: CustomRouter.onGenerateRoute,
      initialRoute: SplashScreen.routeName,
      theme: ThemeData(
        fontFamily: 'AlegreyaSans',
        scaffoldBackgroundColor: Colors.white,
      ),
    );
  }
}
