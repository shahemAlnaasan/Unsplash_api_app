part of 'images_bloc.dart';

sealed class ImagesEvent extends Equatable {
  const ImagesEvent();

  @override
  List<Object> get props => [];
}

class GetImagesEvent extends ImagesEvent {}

class RefreshImagesEvent extends ImagesEvent {}
