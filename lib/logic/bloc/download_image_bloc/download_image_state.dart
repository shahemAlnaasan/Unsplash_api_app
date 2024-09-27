part of 'download_image_bloc.dart';

sealed class DownloadImageState extends Equatable {
  const DownloadImageState();

  @override
  List<Object> get props => [];
}

class ImageDownloadInitial extends DownloadImageState {}

class ImageDownloadInProgress extends DownloadImageState {}

class ImageDownloadSuccess extends DownloadImageState {
  final String message;
  const ImageDownloadSuccess(this.message);

  @override
  List<Object> get props => [message];
}

class ImageDownloadFailed extends DownloadImageState {
  final String errorMessage;
  const ImageDownloadFailed(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
