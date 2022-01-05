import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_pokedex_frontend/core/widgets/bordered_text.dart';

class PokemonType extends StatelessWidget {
  final Color? color;
  final String? text;

  const PokemonType({
    Key? key,
    this.color,
    this.text,
  }) : super(key: key);

  factory PokemonType.bug() =>
      const PokemonType(text: "Bug", color: Color(0xff3b9950));
  factory PokemonType.dark() =>
      const PokemonType(text: "Dark", color: Color(0xff5a5979));
  factory PokemonType.dragon() =>
      const PokemonType(text: "Dragon", color: Color(0xff61cad9));
  factory PokemonType.electric() =>
      const PokemonType(text: "Electric", color: Color(0xfffbfb71));
  factory PokemonType.fairy() =>
      const PokemonType(text: "Fairy", color: Color(0xffea1369));
  factory PokemonType.fighting() =>
      const PokemonType(text: "Fighting", color: Color(0xffEF6138));
  factory PokemonType.fire() =>
      const PokemonType(text: "Fire", color: Color(0xffFD4C5A));
  factory PokemonType.flying() =>
      const PokemonType(text: "Flying", color: Color(0xff93B2C7));
  factory PokemonType.ghost() =>
      const PokemonType(text: "Ghost", color: Color(0xff906790));
  factory PokemonType.grass() =>
      const PokemonType(text: "Grass", color: Color(0xff27CB4F));
  factory PokemonType.ground() =>
      const PokemonType(text: "Ground", color: Color(0xff6E491F));
  factory PokemonType.ice() =>
      const PokemonType(text: "Ice", color: Color(0xffD8F0FA));
  factory PokemonType.normal() =>
      const PokemonType(text: "Normal", color: Color(0xffCA98A7));
  factory PokemonType.poison() =>
      const PokemonType(text: "Poison", color: Color(0xff9B69D9));
  factory PokemonType.psychic() =>
      const PokemonType(text: "Psychic", color: Color(0xffF81C91));
  factory PokemonType.rock() =>
      const PokemonType(text: "Rock", color: Color(0xff8B3E21));
  factory PokemonType.steel() =>
      const PokemonType(text: "Steel", color: Color(0xff42BD94));
  factory PokemonType.water() =>
      const PokemonType(text: "Water", color: Color(0xff86A8FC));

  factory PokemonType.fromString(String type) {
    final typeLower = type.toLowerCase();

    switch (typeLower) {
      case "bug":
        return PokemonType.bug();
      case "dark":
        return PokemonType.dark();
      case "dragon":
        return PokemonType.dragon();
      case "electric":
        return PokemonType.electric();
      case "fairy":
        return PokemonType.fairy();
      case "fighting":
        return PokemonType.fighting();
      case "fire":
        return PokemonType.fire();
      case "flying":
        return PokemonType.flying();
      case "ghost":
        return PokemonType.ghost();
      case "grass":
        return PokemonType.grass();
      case "ground":
        return PokemonType.ground();
      case "ice":
        return PokemonType.ice();
      case "normal":
        return PokemonType.normal();
      case "poison":
        return PokemonType.poison();
      case "psychic":
        return PokemonType.psychic();
      case "rock":
        return PokemonType.rock();
      case "steel":
        return PokemonType.steel();
      case "water":
        return PokemonType.water();
      default:
        return const PokemonType(color: Colors.amber, text: "Unknown");
    }
  }

  @override
  Widget build(BuildContext context) {
    return BorderedText(
      text ?? "",
      borderColor: color,
      borderRadius: BorderRadius.circular(24),
    );
  }
}
