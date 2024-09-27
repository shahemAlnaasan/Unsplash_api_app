part of 'download_image_bloc.dart';

sealed class DownloadImageEvent extends Equatable {
  const DownloadImageEvent();

  @override
  List<Object> get props => [];
}

class DownloadEvent extends DownloadImageEvent {
  final String imageUrl;

  const DownloadEvent({required this.imageUrl});

  @override
  List<Object> get props => [imageUrl];
}
