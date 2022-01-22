import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lolspy/src/repositories/repositories.dart';
import 'package:lolspy/src/screens/home/cubit/home_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = '/home';

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => BlocProvider(
              create: (context) => HomeCubit(
                  championRepository: context.read<ChampionRepository>())
                ..loadChampions(),
              child: const HomeScreen(),
            ),
        settings: const RouteSettings(name: routeName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              children: state.champions.map((e) => Text(e.name)).toList(),
            ),
          );
        },
      ),
    );
  }
}
