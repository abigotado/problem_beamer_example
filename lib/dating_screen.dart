import 'package:beamer/beamer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DatingScreen extends StatelessWidget {
  const DatingScreen({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Beamer.of(context)
                .beamToNamed('/restaurants', replaceCurrent: true);
          },
          icon: const Icon(Icons.ac_unit),
        ),
        title: const Text('Dating'),
      ),
      body: const Text('Dating'),
    );
  }
}
