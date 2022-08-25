import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/configs/images.dart';
import 'package:pokedex/states/pokemon/pokemon_event.dart';
import 'package:pokedex/states/pokemon/pokemon_state.dart';

import '../../../states/pokemon/pokemon_bloc.dart';
import '../../../states/pokemon/pokemon_selector.dart';
import '../../widgets/main_app_bar.dart';
import '../../widgets/pokeball_background.dart';

part 'sections/fab_menu.dart';
part 'sections/pokemon_grid.dart';

class PokedexScreen extends StatefulWidget {
  const PokedexScreen({Key? key}) : super(key: key);

  @override
  State<PokedexScreen> createState() => _PokedexScreenState();
}

class _PokedexScreenState extends State<PokedexScreen> {
  @override
  Widget build(BuildContext context) {
    return PokeballBackground(
      child: Stack(children: [
        // TODO:
        // _PokemonGrid(),
        // _FabMenu(),
      ]),
    );
  }
}
