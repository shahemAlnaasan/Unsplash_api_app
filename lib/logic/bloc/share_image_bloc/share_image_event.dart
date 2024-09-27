part of 'share_image_bloc.dart';

sealed class ShareImageEvent extends Equatable {
  const ShareImageEvent();

  @override
  List<Object> get props => [];
}

class StartShareImageEvent extends ShareImageEvent {
  final String imageUrl;

  const StartShareImageEvent({required this.imageUrl});

  @override
  List<Object> get props => [imageUrl];
}
