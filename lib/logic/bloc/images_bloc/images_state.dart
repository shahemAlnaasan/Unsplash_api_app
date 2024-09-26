part of 'images_bloc.dart';

enum ImagesStatus { loading, success, error }

class ImagesState extends Equatable {
  final ImagesStatus status;
  final List<ImageItems> images;
  final bool hasReachedMax;
  final String message;
  const ImagesState({
    this.status = ImagesStatus.loading,
    this.images = const [],
    this.message = "",
    this.hasReachedMax = false,
  });

  ImagesState copyWith({
    ImagesStatus? status,
    List<ImageItems>? images,
    bool? hasReachedMax,
    String? message,
  }) {
    return ImagesState(
      status: status ?? this.status,
      images: images ?? this.images,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      message: message ?? this.message,
    );
  }

  @override
  List<Object> get props => [status, images, hasReachedMax, message];
}
