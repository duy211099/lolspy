import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lolspy/src/config/custom_router.dart';
import 'package:lolspy/src/repositories/repositories.dart';
import 'package:lolspy/src/screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<ChampionRepository>(
          create: (context) => ChampionRepository(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: CustomRouter.onGenerateRoute,
        initialRoute: HomeScreen.routeName,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
        ),
      ),
    );
  }
}
