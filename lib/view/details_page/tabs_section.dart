import 'package:flutter/material.dart';
import 'package:pokedex/view/details_page/about_widget.dart';
import 'package:pokedex/view/details_page/details_page.dart';
import 'package:pokedex/view/details_page/moves_widget.dart';
import 'package:pokemon/pokemon.dart';

class TabsSection extends StatelessWidget {
  final Pokemon pokemon;
  const TabsSection({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
      decoration: const BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(22.0),
          topRight: Radius.circular(22.0),
        ),
      ),
      child: DefaultTabController(
        length: 4,
        child: SizedBox(
          height: 300.0,
          child: Column(
            children: <Widget>[
              const TabBar(
                indicatorColor: Colors.white,
                labelPadding: EdgeInsets.zero,
                tabs: <Widget>[
                  Tab(
                    text: 'About',
                  ),
                  Tab(
                    text: 'Stats',
                  ),
                  Tab(
                    text: 'Evolutions',
                  ),
                  Tab(
                    text: 'Moves',
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: <Widget>[
                    AboutWidget(pokemon: pokemon, abilities: pokemon.abilities),
                    StatsWidget(statsList: pokemon.stats),
                    StatsWidget(statsList: pokemon.stats),
                    MovesWidget(moves: pokemon.moves),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}