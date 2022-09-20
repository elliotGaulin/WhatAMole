import "package:flutter/material.dart";
import 'package:whack_a_mole/Widgets/outer_circle_wave.dart';

class AnimatedCircleButton extends StatefulWidget {
  final Color color;
  final Size size;
  final Function? action;

  const AnimatedCircleButton(
      {required this.size, this.color = Colors.white, this.action, super.key});
  @override
  State<AnimatedCircleButton> createState() => _AnimatedCircleButtonState();
}

class _AnimatedCircleButtonState extends State<AnimatedCircleButton> {
  double scale = 1;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTapDown: (details) {
          setState(() {
            scale = 1.5;
          });
        },
        onTapUp: (details) {
          setState(() {
            scale = 1;
          });
        },
        onTap: (() {
          widget.action?.call();
        }),
        child: AnimatedScale(
          scale: scale,
          duration: const Duration(milliseconds: 100),
          child: Stack(
            alignment: Alignment.center,
            children: [
              OuterCircleWave(
                size: widget.size,
                color: widget.color,
              ),
              OuterCircleWave(
                size: widget.size,
                color: widget.color,
                start: 0.5,
              ),
              AnimatedContainer(
                margin: EdgeInsets.all(widget.size.height*0.25),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: widget.color,
                        width:
                            widget.size.width * 0.5 - widget.size.width * 0.1)),
                duration: const Duration(seconds: 1),
                height: widget.size.height,
                width: widget.size.width,
              ),
            ],
          ),
        ));
  }
}
