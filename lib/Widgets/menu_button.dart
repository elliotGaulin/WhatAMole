import 'dart:math';

import "package:flutter/material.dart";
//Bouton utilisé pour les menus
//Pas le code le plus propre. Un de mes premiers widget créé...
class MenuButton extends StatefulWidget {
  final Color color;

  final String text;
  final Color textColor;
  final Color onTapTextColor;
  final FontWeight fontWeight;
  final Function? action;
  const MenuButton(
      {this.color = Colors.white, this.textColor = Colors.white, this.onTapTextColor = Colors.black, this.text = "", this.fontWeight = FontWeight.normal, this.action, super.key});

  @override
  State<MenuButton> createState() => _MenuButtonState();
}
class _MenuButtonState extends State<MenuButton> {

  //Constantes pour les marges
  static const double defaultMargin = 30;
  static const double onTapMargin = 0;
  static const double defaultHeight = 15;
  static const double onTapHeight = 20;

  //variables utilisée dans le bouton
  Color mycolor = Colors.transparent;
  double mymargin = defaultMargin;
  double myheight = defaultHeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTapDown: (details) {
          setState(() {
            mycolor = widget.color;
            mymargin = onTapMargin;
            myheight = onTapHeight;
          });
        },
        onTapCancel: () {
          setState(() {
            mycolor = Colors.transparent;
            mymargin = defaultMargin;
            myheight = defaultHeight;
          });
        },
        onTapUp: (details) {
          setState(() {
            mycolor = Colors.transparent;
            mymargin = defaultMargin;
            myheight = defaultHeight;
          });
        },
        onTap: () {
          widget.action?.call();
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          decoration: BoxDecoration(
            border: Border.all(width: 1.5, color: widget.color),
            borderRadius: BorderRadius.circular(50),
            color: mycolor,
          ),
          width: double.infinity,
          padding: EdgeInsets.all(myheight),
          margin: EdgeInsets.only(left: mymargin, right: mymargin),
          child: Center(
              child: Text(
            widget.text.toUpperCase(),
            style: TextStyle(
                //Pour s'assurer d'avoir une couleur qui contraste avec la couleur pâle du bouton onPressed
                color: mycolor == Colors.transparent
                    ? widget.textColor
                    : widget.onTapTextColor,
                fontWeight: widget.fontWeight),
          )),
        ),
      ),
    );
  }
}
