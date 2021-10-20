import 'package:rocketseat_educator_ps/data/remote/data_source/cat_rds.dart';
import 'package:rocketseat_educator_ps/data/remote/data_source/dog_rds.dart';
import 'package:rocketseat_educator_ps/data/remote/model/animal.dart';
import 'package:rocketseat_educator_ps/data/remote/model/fact.dart';

class FactsRepository {
  const FactsRepository({
    required CatRDS catRDS,
    required DogRDS dogRDS,
  })  : _catRDS = catRDS,
        _dogRDS = dogRDS;

  final CatRDS _catRDS;
  final DogRDS _dogRDS;

  Future<List<Fact>> fetchFactsList(Animal animal) async {
    List<Fact> factsList;

    if (animal == Animal.cat) {
      factsList = await _catRDS.fetchFactsList();
    } else {
      factsList = await _dogRDS.fetchFactsList();
    }

    return factsList;
  }
}
