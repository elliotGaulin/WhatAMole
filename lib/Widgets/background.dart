import "package:flutter/material.dart";
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class Background extends StatelessWidget {
  const Background({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Créer le pattern de background
    return const Image(
      image: Svg('images/backgroundPattern.svg',
          size: Size.square(40), color: Color.fromARGB(255, 9, 39, 59)),
      repeat: ImageRepeat.repeat,
      width: double.infinity,
      height: double.infinity,
    );
  }
}