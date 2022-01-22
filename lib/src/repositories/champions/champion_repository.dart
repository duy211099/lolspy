import 'dart:convert';

import 'package:lolspy/src/models/champion_model.dart';
import 'package:lolspy/src/models/models.dart';
import 'package:lolspy/src/repositories/champions/base_champion_repository.dart';
import 'package:lolspy/src/resources/paths.dart';
import 'package:lolspy/src/services/services.dart';

class ChampionRepository extends BaseChampionRepository {
  final BaseDio _dio;

  ChampionRepository() : _dio = BaseDio();

  @override
  Future<List<Champion>> getChampions() async {
    try {
      List<Champion> champions = [];
      final response = await _dio.get(Paths.champions);
      final data =
          response.data['data'].entries.map((entry) => entry.value).toList();
      if ([200, 201, 202, 203].contains(response.statusCode)) {
        for (dynamic champion in data) {
          champions.add(Champion.fromMap(champion));
        }
      }
      return champions;
    } on Exception catch (err) {
      throw Failure(message: err.toString());
    }
  }
}
