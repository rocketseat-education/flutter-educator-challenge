import 'package:dio/dio.dart';

import 'package:rocketseat_educator_ps/data/remote/model/fact.dart';

const dogApi =
    'https://dog-facts-api.herokuapp.com/api/v1/resources/dogs?number=50';

class DogRDS {
  const DogRDS({required Dio client}) : _client = client;

  final Dio _client;

  Future<List<Fact>> fetchFactsList() async {
    final response = await _client.get(dogApi);

    final dogFactsList = response.data
        .map<Fact>(
          (json) => Fact(
            label: json['fact'],
          ),
        )
        .toList();

    return dogFactsList;
  }
}
