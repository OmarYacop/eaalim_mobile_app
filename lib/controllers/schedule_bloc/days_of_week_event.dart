abstract class DaysEvent {
  const DaysEvent();
}

class SelectDayEvent extends DaysEvent {
  final String day;
  const SelectDayEvent(this.day);
}

class LoadEvent{
  final bool isLoading;
  const LoadEvent({required this.isLoading});
}
