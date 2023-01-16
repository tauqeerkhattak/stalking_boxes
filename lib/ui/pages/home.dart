import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stalking_boxes/ui/resources/box_colors.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final StreamController<Offset> _positionController = StreamController();
  Offset? _position;

  // Widget getBox(double size) {
  //   final newSize = size - 15;
  //   return Container(
  //     width: size,
  //     height: size,
  //     margin: const EdgeInsets.all(5),
  //     decoration: BoxDecoration(
  //       border: Border.all(color: Colors.black),
  //     ),
  //     child: newSize > 0 ? getBox(newSize) : null,
  //   );
  // }

  Widget _getBox({
    required double size,
    required int milliseconds,
    required Color color,
  }) {
    return AnimatedPositioned(
      duration: Duration(
        milliseconds: milliseconds,
      ),
      top: (_position?.dy ?? 0) - (size / 2),
      left: (_position?.dx ?? 0) - (size / 2),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          border: Border.all(
            color: color,
            width: 2,
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    _positionController.stream.listen((event) {
      _position = event;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: MouseRegion(
        cursor: SystemMouseCursors.none,
        onHover: (event) {
          _positionController.add(event.position);
        },
        child: Center(
          child: Stack(
            children: [
              ...List.generate(
                10,
                (index) {
                  final size =
                      MediaQuery.of(context).size.width * ((index + 1) / 40);
                  final duration = 800 * ((index * 1) / 10);
                  return _getBox(
                    size: size,
                    milliseconds: duration.toInt(),
                    color: BoxColors.boxColors.reversed.toList()[index],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
