abstract class ChatEvent {
  const ChatEvent();
}

class SearchEvent extends ChatEvent {
  final bool isSearching;
  const SearchEvent(this.isSearching);
}

class UpdateSearchEvent extends ChatEvent {
  final String searchText;
  const UpdateSearchEvent(this.searchText);
}
