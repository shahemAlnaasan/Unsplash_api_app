part of 'search_image_bloc.dart';

enum SearchImagesStatus { loading, success, error, inital }

class SearchImageState extends Equatable {
  final SearchImagesStatus status;
  final List<ImageItems> images;
  final bool hasReachedMax;
  final String message;
  const SearchImageState({
    this.status = SearchImagesStatus.inital,
    this.images = const [],
    this.message = "",
    this.hasReachedMax = false,
  });

  SearchImageState copyWith({
    SearchImagesStatus? status,
    List<ImageItems>? images,
    bool? hasReachedMax,
    String? message,
  }) {
    return SearchImageState(
      status: status ?? this.status,
      images: images ?? this.images,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      message: message ?? this.message,
    );
  }

  @override
  List<Object> get props => [status, images, hasReachedMax, message];
}
