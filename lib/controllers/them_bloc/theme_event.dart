abstract class ThemeEvent {
  const ThemeEvent();
}

class BrightnessEvent extends ThemeEvent {
  final bool appBrightness;

  const BrightnessEvent(this.appBrightness);
}
