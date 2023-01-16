import 'package:flutter/material.dart';

import 'ui/pages/home.dart';

void main() {
  runApp(const StalkingBoxes());
}

class StalkingBoxes extends StatelessWidget {
  const StalkingBoxes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}
