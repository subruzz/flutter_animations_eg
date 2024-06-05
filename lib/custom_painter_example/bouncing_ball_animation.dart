import 'package:flutter/material.dart';

class BouncingBallAnimation extends StatefulWidget {
  const BouncingBallAnimation({super.key});

  @override
  State<BouncingBallAnimation> createState() => _BouncingBallAnimationState();
}

class _BouncingBallAnimationState extends State<BouncingBallAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> anim;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    anim = Tween<Offset>(
      begin: const Offset(-1, 0),
      end: const Offset(0, 1),
    ).animate(controller);
    //add listener only listen to value of the animation
    //to listen to the controller status we need to user the below thing
    controller.addStatusListener(
      (status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      },
    );
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            AnimatedBuilder(
              animation: controller,
              builder: (context, child) {
                return CustomPaint(
                  size: Size(MediaQuery.of(context).size.width,
                      MediaQuery.of(context).size.height - 100),
                  painter: BouningBallPainter(animValue: anim.value),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class BouningBallPainter extends CustomPainter {
  final Offset animValue;
  BouningBallPainter({required this.animValue});
  @override
  void paint(Canvas canvas, Size size) {
    // Calculate the x position based on animation value and screen width
    final x = (animValue.dx + 1) * size.width / 2;

    // Calculate the y position based on animation value and screen height
    final y = (1 - animValue.dy) *
        size.height /
        2; // Since animValue.dy goes from 1 to -1

    canvas.drawCircle(Offset(x, y), 20, Paint()..color = Colors.blue);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
