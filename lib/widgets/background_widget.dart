import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tost_test_code/ui/common/app_colors.dart';

class BackgroundWidget extends StatelessWidget {
  final double? positionXFirst;
  final double? positionYFirst;
  final double? positionXSec;
  final double? positionYSec;
  final double? positionXThird;
  final double? positionYThird;

  const BackgroundWidget(
      {super.key,
      this.positionXFirst = 3,
      this.positionYFirst = -1.3,
      this.positionXSec = 0,
      this.positionYSec = 1.4,
      this.positionXThird = -3,
      this.positionYThird = 0});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const SizedBox.expand(
          child: DecoratedBox(decoration: BoxDecoration(color: Colors.white)),
        ),
        Align(
          alignment: AlignmentDirectional(positionXFirst!, positionYFirst!),
          child: const SizedBox.square(
            dimension: 320,
            child: DecoratedBox(
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: kcLemonGreen),
            ),
          ),
        ),
        Align(
          alignment: AlignmentDirectional(positionXSec!, positionYSec!),
          child: const SizedBox.square(
            dimension: 300,
            child: DecoratedBox(
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: kcLemonGreen),
            ),
          ),
        ),
        Align(
          alignment: AlignmentDirectional(positionXThird!, positionYThird!),
          child: const SizedBox.square(
            dimension: 260,
            child: DecoratedBox(
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: kcLemonGreen),
            ),
          ),
        ),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
          child: const DecoratedBox(
              decoration: BoxDecoration(color: Colors.transparent)),
        )
      ],
    );
  }
}
