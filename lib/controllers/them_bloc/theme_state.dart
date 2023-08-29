part of 'theme_bloc.dart';

class ThemeState {
  const ThemeState({required this.appBrightness});

  final bool appBrightness;



  ThemeState copyWith({
    bool? appBrightness,
  }) {
    return ThemeState(
      appBrightness: appBrightness ?? this.appBrightness,
    );
  }
}
