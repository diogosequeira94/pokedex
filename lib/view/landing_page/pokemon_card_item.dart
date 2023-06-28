import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/cubit/generation/model/pokemon_basic_item.dart';
import 'package:pokedex/cubit/pokemon_details/pokemon_details_cubit.dart';
import 'package:pokedex/utils/extensions.dart';
import 'package:pokedex/view/pokemon_details_page.dart';

class PokemonCardItem extends StatelessWidget {
  final PokemonBasicItem pokeItem;
  const PokemonCardItem({Key? key, required this.pokeItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: const Key('landingPage_pokemonItemCard'),
      onTap: () {
        context.read<PokemonDetailsCubit>().fetchPokemonDetailsByName(pokeItem.name);
        print('TAPPED');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => BlocProvider.value(
              value: context.read<PokemonDetailsCubit>(),
              child: PokemonDetailsPage(pokemonName: pokeItem.name, pokemonIndex: pokeItem.number),
            ),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              key: const Key('pokeCard_sprite'),
              'assets/gen1/${pokeItem.name}.jpeg',
              fit: BoxFit.cover,
              width: 80.0,
              height: 80,
            ),
            const SizedBox(height: 4.0),
            Text(
              pokeItem.name.capitalize(),
              key: const Key('pokeCard_name'),
            ),
            Text(
              '#${pokeItem.number}',
              key: const Key('pokeCard_number'),
            ),
          ],
        ),
      ),
    );
  }
}
