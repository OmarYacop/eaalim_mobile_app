import 'package:flutter_bloc/flutter_bloc.dart';

import 'chat_event.dart';
import 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(const ChatState(isSearching: false, searchText: '')) {
    on<SearchEvent>(_onSearching);
    on<UpdateSearchEvent>(_updateSearchText);
  }

  void _onSearching(SearchEvent event, Emitter<ChatState> emit) {
    emit(state.copyWith(isSearching: event.isSearching));
  }

  void _updateSearchText(UpdateSearchEvent event, Emitter<ChatState> emit) {
    emit(state.copyWith(searchText: event.searchText));
  }
}
