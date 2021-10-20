import 'package:dio/dio.dart';

import 'package:rocketseat_educator_ps/data/remote/model/fact.dart';

const catApi = 'https://catfact.ninja/facts?limit=50';

class CatRDS {
  const CatRDS({required Dio client}) : _client = client;

  final Dio _client;

  Future<List<Fact>> fetchFactsList() async {
    final response = await _client.get(catApi);

    final data = response.data['data'];

    final catFactsList = data
        .map<Fact>(
          (json) => Fact(
            label: json['fact'],
          ),
        )
        .toList();

    return catFactsList;
  }
}
