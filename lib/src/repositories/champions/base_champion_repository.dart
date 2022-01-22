import 'package:lolspy/src/models/champion_model.dart';

abstract class BaseChampionRepository {
  Future<List<Champion>> getChampions();
}
