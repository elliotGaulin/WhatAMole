import "package:flutter/material.dart";

class MenuButton extends StatefulWidget {
  final Color color;

  final String text;
  final Color textColor;
  final bool bold;
  final Function? action;
  const MenuButton(
      {this.color = Colors.white, this.textColor = Colors.white, this.text = "", this.bold = false, this.action, super.key});

  @override
  State<MenuButton> createState() => _MenuButtonState();
}

class _MenuButtonState extends State<MenuButton> {
  static const double DEFAULT_MARGIN = 30;
  static const double ON_TAP_MARGIN = 0;
  static const double DEFAULT_HEIGHT = 15;
  static const double ON_TAP_HEIGHT = 20;

  Color mycolor = Colors.transparent;
  double mymargin = DEFAULT_MARGIN;
  double myheight = DEFAULT_HEIGHT;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTapDown: (details) {
          setState(() {
            mycolor = widget.color;
            mymargin = ON_TAP_MARGIN;
            myheight = ON_TAP_HEIGHT;
          });
        },
        onTapCancel: () {
          setState(() {
            mycolor = Colors.transparent;
            mymargin = DEFAULT_MARGIN;
            myheight = DEFAULT_HEIGHT;
          });
        },
        onTapUp: (details) {
          setState(() {
            mycolor = Colors.transparent;
            mymargin = DEFAULT_MARGIN;
            myheight = DEFAULT_HEIGHT;
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
                color: mycolor == Colors.transparent
                    ? widget.textColor
                    : Colors.black,
                fontWeight: widget.bold ? FontWeight.bold : FontWeight.normal),
          )),
        ),
      ),
    );
  }
}
