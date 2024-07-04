import 'package:flutter/material.dart';

class LiquidButton extends StatefulWidget {
  @override
  _LiquidButtonState createState() => _LiquidButtonState();
}

class _LiquidButtonState extends State<LiquidButton>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10),
    )..repeat();
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController!,
        curve: Curves.linear,
      ),
    );
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Add your button tap logic here
      },
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: Colors.blue,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: -80,
              child: AnimatedBuilder(
                animation: _animation!,
                builder: (context, child) {
                  return Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(45),
                      color: Colors.black,
                    ),
                    transform: Matrix4.rotationZ(_animation!.value * 2 * 3.14),
                  );
                },
              ),
            ),
            Positioned(
              top: -80,
              child: AnimatedBuilder(
                animation: _animation!,
                builder: (context, child) {
                  return Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.black.withOpacity(0.5),
                    ),
                    transform: Matrix4.rotationZ(-_animation!.value * 2 * 3.14),
                  );
                },
              ),
            ),
            Text(
              'Button',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'Arial',
                letterSpacing: 8,
              ),
            ),
          ],
        ),
      ),
    );
  }
}