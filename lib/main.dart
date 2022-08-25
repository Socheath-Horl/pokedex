import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './pokedex_app.dart';
import './states/theme/theme_cubit.dart';
import './states/pokemon/pokemon_bloc.dart';
import './data/repositories/pokemon_repository.dart';
import './data/repositories/item_repository.dart';
import './routes.dart';
import './core/network.dart';
import './data/source/github/github_datasource.dart';
import './data/source/local/local_datasource.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await LocalDataSource.initialize();

  runApp(
    MultiRepositoryProvider(
      providers: [
        // Services
        RepositoryProvider<NetworkManager>(
          create: (context) => NetworkManager(),
        ),
        // Data sources
        RepositoryProvider<LocalDataSource>(
          create: (context) => LocalDataSource(),
        ),
        RepositoryProvider<GithubDataSource>(
          create: (context) => GithubDataSource(context.read<NetworkManager>()),
        ),
        // Repositories
        RepositoryProvider<PokemonRepository>(
          create: (context) => PokemonDefaultRepository(
            githubDataSource: context.read<GithubDataSource>(),
            localDataSource: context.read<LocalDataSource>(),
          ),
        ),
        RepositoryProvider<ItemRepository>(
          create: (context) => ItemDefaultRepository(
            githubDataSource: context.read<GithubDataSource>(),
            localDataSource: context.read<LocalDataSource>(),
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          // BloCs
          BlocProvider<PokemonBloc>(
            create: (context) => PokemonBloc(context.read<PokemonRepository>()),
          ),
          //TODO: Add BloCs

          // Theme Cubit
          BlocProvider<ThemeCubit>(
            create: (context) => ThemeCubit(),
          )
        ],
        child: const PokedexApp(),
      ),
    ),
  );
}
