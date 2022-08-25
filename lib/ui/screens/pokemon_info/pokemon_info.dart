import 'package:flutter/material.dart';

class PokemonInfo extends StatefulWidget {
  const PokemonInfo({Key? key}) : super(key: key);

  @override
  State<PokemonInfo> createState() => _PokemonInfoState();
}

class _PokemonInfoState extends State<PokemonInfo> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('pokemon info screen'));
  }
}
