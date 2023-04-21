import 'package:flutter/material.dart';
import 'package:flutter_counter/presentation/screens/counter_screen/widgets/animated_circle.dart';
import 'package:flutter_counter/presentation/screens/counter_screen/widgets/counter_slider.dart';
import 'package:flutter_counter/presentation/screens/counter_screen/widgets/counter_value.dart';
import 'package:flutter_counter/presentation/screens/counter_screen/widgets/neumorphism_theme_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 4.0.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                NeumorphismThemeButton(),
              ],
            ),
            Stack(
              alignment: Alignment.center,
              children: const [
                AnimatedCircle(
                  animate: true,
                ),
                CounterValue(),
              ],
            ),
            const Spacer(),
            const CounterSlider(),
            SizedBox(height: 8.0.h),
          ],
        ),
      ),
    );
  }
}
