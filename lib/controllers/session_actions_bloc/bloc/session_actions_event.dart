part of 'session_actions_bloc.dart';

abstract class SessionActionsEvent {}

class UploadEvent  {
  List<String> filesPaths;
  UploadEvent(this.filesPaths);
}

class CancelEvent {
  int selectedOption;
  CancelEvent(this.selectedOption);
}

class SendEvent {
  bool isLoading;
  SendEvent(this.isLoading);
}
