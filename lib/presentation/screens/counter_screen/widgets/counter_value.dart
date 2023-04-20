import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter/logic/cubit/counter_cubit.dart';
import 'package:animate_do/animate_do.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CounterValue extends StatefulWidget {
  const CounterValue({
    super.key,
  });

  @override
  State<CounterValue> createState() => _CounterValueState();
}

class _CounterValueState extends State<CounterValue> {
  AnimationController? animationController;

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    animationController?.forward(from: 0.0);

    return ZoomIn(
      controller: (controller) {
        animationController = controller;
      },
      manualTrigger: true,
      duration: const Duration(milliseconds: 400),
      child: Text(
        context.select((CounterCubit counterCubit) =>
            counterCubit.state.counterValue.toString()),
        style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 40.0.sp,
            ),
      ),
    );
  }
}
