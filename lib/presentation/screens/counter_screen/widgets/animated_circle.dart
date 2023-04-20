import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AnimatedCircle extends StatelessWidget {
  final bool animate;

  const AnimatedCircle({
    super.key,
    this.animate = true,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70.0.w,
      height: 40.0.h,
      child: FlareActor(
        'assets/flares/circle.flr',
        animation: animate ? 'Alarm' : null,
        color: Theme.of(context).colorScheme.secondary,
      ),
    );
  }
}
