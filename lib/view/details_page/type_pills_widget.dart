import 'package:flutter/material.dart';
import 'package:pokemon/pokemon.dart';
import 'package:pokedex/utils/extensions.dart';

class TypePillsWidget extends StatelessWidget {
  final List<PokeTypes> types;
  const TypePillsWidget({Key? key, required this.types}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (final type in types)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Container(
              width: 90,
              decoration: BoxDecoration(
                color: _getPillColor(type.type!.name!),
                borderRadius: const BorderRadius.all(
                  Radius.circular(20.0),
                ),
              ),
              padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12.0),
              child: Center(
                  child: Text(
                type.type!.name!.capitalize(),
                style: const TextStyle(color: Colors.white),
              )),
            ),
          ),
      ],
    );
  }

  Color _getPillColor(String typeName) {
    switch (typeName) {
      case 'grass':
        return Colors.green;
      case 'water':
        return Colors.blueAccent;
      case 'ice':
        return Colors.blue;
      case 'fire':
        return Colors.red;
      case 'poison':
        return Colors.purple;
      case 'bug':
        return Colors.teal;
      case 'normal':
        return Colors.brown.shade100;
      case 'flying':
        return Colors.blueGrey;
      case 'psychic':
        return Colors.purpleAccent;
      case 'fighting':
        return Colors.brown;
      case 'fairy':
        return Colors.pinkAccent;
      case 'ground':
        return Colors.brown.shade700;
      case 'rock':
        return Colors.black45;
      case 'ghost':
        return Colors.indigo;
      case 'dragon':
        return Colors.redAccent.shade400;
    }
    return Colors.amber;
  }
}
