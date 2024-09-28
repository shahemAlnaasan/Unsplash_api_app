part of 'search_image_bloc.dart';

sealed class SearchImageEvent extends Equatable {
  const SearchImageEvent();

  @override
  List<Object> get props => [];
}

class StartSearchImageEvent extends SearchImageEvent {
  final String query;

  const StartSearchImageEvent({required this.query});

  @override
  List<Object> get props => [query];
}
