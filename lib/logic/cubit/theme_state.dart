part of 'theme_cubit.dart';

class ThemeState {
  final ThemeMode themeMode;

  ThemeState({required this.themeMode});

  @override
  String toString() => 'ThemeState(themeMode: $themeMode)';

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'themeMode': themeMode.name,
    };
  }

  factory ThemeState.fromMap(Map<String, dynamic> map) {
    return ThemeState(
      themeMode: ThemeMode.values.firstWhere(
        (element) => element.name.toString() == map['themeMode'],
      ),
    );
  }
}
