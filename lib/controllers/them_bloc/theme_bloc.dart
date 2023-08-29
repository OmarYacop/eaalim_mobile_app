import 'package:flutter_bloc/flutter_bloc.dart';

import 'theme_event.dart';

part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(const ThemeState(appBrightness: true)) {
    on<BrightnessEvent>(_onChangedThemeBrightness);
  }

  void _onChangedThemeBrightness(BrightnessEvent event, Emitter emit) {
    emit(state.copyWith(appBrightness: event.appBrightness));
  }
}
