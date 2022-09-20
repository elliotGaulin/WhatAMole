import "package:flutter/material.dart";

class OuterCircleWave extends StatefulWidget {
  final Color color;
  final Size size;
  final double start;

  const OuterCircleWave(
      {required this.size,
      this.color = Colors.white,
      this.start = 0,
      super.key});

  @override
  State<OuterCircleWave> createState() => _OuterCircleWaveState();
}

class _OuterCircleWaveState extends State<OuterCircleWave>
    with TickerProviderStateMixin {
  double scale = 1;
  double opacity = 1;

  late final AnimationController controller = AnimationController(
    duration: const Duration(seconds: 1, milliseconds: 500),
    vsync: this,
  )..forward(from: widget.start)
    ..addListener(() {
      double newOpacity = 1 - (controller.value*1.3);
      if(newOpacity < 0){
        newOpacity = 0;
      }
      setState(() {
        opacity = newOpacity;
      });
    })
    ..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.repeat();
      }
    });

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      child: Container(
        width: widget.size.width,
        height: widget.size.width,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border:
                Border.all(color: widget.color.withOpacity(opacity), width: 1.5)),
      ),
      builder: (BuildContext context, Widget? child) {
        return Transform.scale(
          scale: controller.value * 0.75 + 1,
          child: child,
        );
      },
    );
  }
}
