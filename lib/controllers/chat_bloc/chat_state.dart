class ChatState {
  const ChatState({required this.searchText, required this.isSearching});

  final bool isSearching;
  final String searchText;

  ChatState copyWith({bool? isSearching, String? searchText}) {
    return ChatState(
      isSearching: isSearching ?? this.isSearching,
      searchText: searchText ?? this.searchText,
    );
  }
}
