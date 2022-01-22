import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lolspy/src/models/champion_model.dart';
import 'package:lolspy/src/models/models.dart';
import 'package:lolspy/src/repositories/repositories.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final ChampionRepository _championRepository;

  HomeCubit({required ChampionRepository championRepository})
      : _championRepository = championRepository,
        super(HomeState.initial());

  Future<void> loadChampions() async {
    try {
      final champions = await _championRepository.getChampions();
      emit(state.copyWith(champions: champions));
    } on Failure catch (err) {
      emit(state.copyWith(failure: err));
    }
  }
}
