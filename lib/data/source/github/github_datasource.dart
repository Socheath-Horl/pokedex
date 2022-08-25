import 'dart:convert';

import 'package:pokedex/data/source/github/models/item.dart';

import '../../../core/network.dart';
import './models/pokemon.dart';

class GithubDataSource {
  final NetworkManager networkManager;

  GithubDataSource(this.networkManager);

  static const String itemsURL =
      'https://gist.githubusercontent.com/hungps/48f4355fb1a89ddaf47f56961dc8a245/raw/pokemon-items.json';

  static const String url =
      'https://gist.githubusercontent.com/hungps/0bfdd96d3ab9ee20c2e572e47c6834c7/raw/pokemons.json';

  Future<List<GithubPokemonModel>> getPokemons() async {
    final response = await networkManager.request(RequestMethod.get, url);

    final data = (json.decode(response.data) as List)
        .map((item) => GithubPokemonModel.fromJson(item))
        .toList();
    return data;
  }

  Future<List<GithubItemModel>> getItems() async {
    final response = await networkManager.request(RequestMethod.get, itemsURL);

    final data = (json.decode(response.data) as List)
        .map((item) => GithubItemModel.fromJson(item))
        .toList();

    return data;
  }
}
