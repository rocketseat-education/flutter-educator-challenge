import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rocketseat_educator_ps/data/remote/data_source/cat_rds.dart';
import 'package:rocketseat_educator_ps/data/remote/data_source/dog_rds.dart';
import 'package:rocketseat_educator_ps/data/remote/model/animal.dart';
import 'package:rocketseat_educator_ps/data/remote/model/fact.dart';
import 'package:rocketseat_educator_ps/data/remote/repository/facts_repository.dart';
import 'package:rocketseat_educator_ps/presentation/common/animals_bottom_navigation_bar.dart';
import 'package:rocketseat_educator_ps/presentation/common/animals_facts_viewer.dart';
import 'package:rocketseat_educator_ps/presentation/common/animals_header.dart';
import 'package:rocketseat_educator_ps/presentation/common/background_gradient.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ValueNotifier<int> _notifier;
  late FactsRepository _repository;
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();

    _selectedIndex = 0;
    _notifier = ValueNotifier<int>(0);

    final client = Dio();

    final catRDS = CatRDS(client: client);
    final dogRDS = DogRDS(client: client);

    _repository = FactsRepository(catRDS: catRDS, dogRDS: dogRDS);
  }

  Widget _buildHeader() => AnimalsHeader(
        selectedAnimal: _selectedIndex.toAnimal(),
      );

  Widget _buildFooter() => AnimalsBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onTap: (newIndex) {
          setState(() {
            _selectedIndex = newIndex;
          });
        },
      );

  Widget _buildBody() => FutureBuilder<List<Fact>>(
      future: _repository.fetchFactsList(
        _selectedIndex.toAnimal(),
      ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final factsList = snapshot.data!;

          return ValueListenableBuilder<int>(
              valueListenable: _notifier,
              builder: (context, factIndex, _) {
                return AnimalsFactsViewer(
                  fact: factsList[factIndex],
                  onNextTap: () {
                    final randomIndex = Random().nextInt(50);

                    _notifier.value = randomIndex;
                  },
                );
              });
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: BackgroundGradient(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildHeader(),
              const SizedBox(height: 48),
              Expanded(
                child: _buildBody(),
              ),
              const SizedBox(height: 48),
              _buildFooter(),
            ],
          ),
        ),
      ),
    );
  }
}

extension SelectedAnimalByIndex on int {
  Animal toAnimal() {
    if (this == 0) {
      return Animal.cat;
    } else {
      return Animal.dog;
    }
  }
}
