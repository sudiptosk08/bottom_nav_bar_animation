import 'dart:math';

import 'package:flutter/material.dart';

bool toggle = false;

class FloatingActionBottom extends StatefulWidget {
  const FloatingActionBottom({Key? key});

  @override
  _FloatingActionBottomState createState() => _FloatingActionBottomState();
}

class _FloatingActionBottomState extends State<FloatingActionBottom>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
      reverseDuration: const Duration(milliseconds: 850),
    );
    _animation = CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
        reverseCurve: Curves.easeIn);
    _controller.addListener(() {
      setState(() {
        _animation;
      });
    });
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // Animation completed, update the _isExpanded variable
        setState(() {
          _isExpanded = true;
        });
      } else if (status == AnimationStatus.dismissed) {
        // Animation dismissed, update the _isExpanded variable
        setState(() {
          _isExpanded = false;
        });
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Transform.translate(
          offset: const Offset(0, 59.5),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 900),
            curve: Curves.fastEaseInToSlowEaseOut,

            height: toggle ? 185 : 0, // Adjust the desired height
            width: toggle ? 210 : 0, // Adjust the desired width

            child: Visibility(
              visible: toggle,
              replacement: AnimatedContainer(
                duration: const Duration(milliseconds: 900),
                curve: Curves.easeOut,
                height: 56,
                width: 56,
                decoration: BoxDecoration(
                  color: const Color(0xff7F7CD5),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(18)),
                  color: Color(0xff7F7CD5),
                ),
                child: _isExpanded == false
                    ? Center(
                        child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                "Mode check-in", // Replace with your content
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                ),
                              ),
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(13, 0, 0, 0),
                                    borderRadius: BorderRadius.circular(12)),
                                child: const Icon(
                                  Icons.emoji_emotions_outlined,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                "Voice note", // Replace with your content
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                ),
                              ),
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(13, 0, 0, 0),
                                    borderRadius: BorderRadius.circular(12)),
                                child: const Icon(
                                  Icons.voice_chat,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                "Add photo", // Replace with your content
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                ),
                              ),
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(13, 0, 0, 0),
                                    borderRadius: BorderRadius.circular(12)),
                                child: const Icon(
                                  Icons.image_outlined,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ],
                      ))
                    : Container(),
              ),
            ),
          ),
        ),
        Transform.translate(
            offset: const Offset(0, 32.2),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 900),
              curve: Curves.fastEaseInToSlowEaseOut,

              height: toggle ? 55 : 0, // Adjust the desired height
              width: toggle ? 91 : 0, // Adjust the desired width
              child: Visibility(
                visible: toggle,
                child: ClipPath(
                  clipper: BezierClipper(),
                  child: Container(
                    color: const Color(0xff7F7CD5),
                    width: 91,
                    height: 55,
                  ),
                ),
              ),
            )),
        AnimatedContainer(
          duration: const Duration(milliseconds: 900),
          curve: Curves.easeOut,
          height: 56,
          width: 56,
          decoration: BoxDecoration(
            color: const Color(0xff7F7CD5),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Transform.rotate(
            angle: _animation.value * pi * (3 / 4),
            child: IconButton(
                onPressed: () {
                  setState(() {
                    if (toggle) {
                      toggle = !toggle;
                      _controller.forward();
                    } else {
                      toggle = !toggle;
                      _controller.reverse();
                      // alignment = Alignment(0.0, 0.0);
                    }
                  });
                },
                icon: Icon(
                  Icons.close,
                  color: Colors.white,
                )),
          ),
        ),
        const SizedBox(
          height: 8.9,
        )
      ],
    );
  }
}

class BezierClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.5);

    path.quadraticBezierTo(size.width * 0.2, size.height * 0.5,
        size.width * 0.2, size.height * 0.75);

    // Mirrored path on the right side
    path.lineTo(size.width * 0.8, size.height * 0.75);
    path.quadraticBezierTo(
        size.width * 0.8, size.height * 0.5, size.width, size.height * 0.5);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
