import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/ui/screens/home/widgets/news_card.dart';

import '../../../configs/images.dart';
import '../../widgets/pokeball_background.dart';
import '../../../configs/colors.dart';
import '../../../domain/entities/category.dart';
import '../../../routes.dart';
import '../../../states/theme/theme_cubit.dart';
import '../../../data/source/categories.dart';
import '../../widgets/search_bar.dart';
import './widgets/category_card.dart';

part './sections/header_card_content.dart';
part './sections/pokemon_news.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  bool showTitle = false;

  @override
  void initState() {
    _scrollController.addListener(_onScroll);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;

    final offset = _scrollController.offset;
    final showTitle = offset > _HeaderCardContent.height - kToolbarHeight;

    // Prevent unneccesary rebuild
    if (this.showTitle == showTitle) return;

    setState(() {
      this.showTitle = showTitle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (_, __) => [
          SliverAppBar(
            expandedHeight: _HeaderCardContent.height,
            floating: true,
            pinned: true,
            elevation: 0,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30),
              ),
            ),
            backgroundColor: AppColors.red,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              centerTitle: true,
              title: Visibility(
                visible: showTitle,
                child: Text(
                  'Pokedex',
                  style: Theme.of(context)
                      .appBarTheme
                      .toolbarTextStyle!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              background: const _HeaderCardContent(),
            ),
          ),
        ],
        body: const _PokemonNews(),
      ),
    );
  }
}
