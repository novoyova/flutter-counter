import 'package:flutter/material.dart';
import 'package:flutter_counter/core/exceptions/route_exception.dart';
import 'package:flutter_counter/presentation/screens/counter_screen/counter_screen.dart';

class AppRouter {
  const AppRouter._();

  static const String counter = 'counter';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case counter:
        return MaterialPageRoute(
          builder: (_) => const CounterScreen(),
        );
      default:
        throw const RouteException('Route not found');
    }
  }
}
