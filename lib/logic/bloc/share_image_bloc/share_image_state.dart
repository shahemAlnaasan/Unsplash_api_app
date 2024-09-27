part of 'share_image_bloc.dart';

sealed class ShareImageState extends Equatable {
  const ShareImageState();

  @override
  List<Object> get props => [];
}

final class ShareImageInprogressState extends ShareImageState {}

class ShareImageSuccessState extends ShareImageState {
  final String message;

  const ShareImageSuccessState({required this.message});

  @override
  List<Object> get props => [message];
}

class ShareImageFailedState extends ShareImageState {
  final String errorMessage;

  const ShareImageFailedState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
