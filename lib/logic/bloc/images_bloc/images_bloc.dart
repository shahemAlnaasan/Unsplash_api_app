import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:unsplash_api_app/data/models/image_model.dart';
import 'package:unsplash_api_app/data/repository/images_repo.dart';

part 'images_event.dart';
part 'images_state.dart';

class ImagesBloc extends Bloc<ImagesEvent, ImagesState> {
  ImagesBloc() : super(const ImagesState()) {
    final ImagesRepo imagesRepo = ImagesRepo();
    on<ImagesEvent>(
      (event, emit) async {
        if (event is GetImagesEvent) {
          try {
            if (state.status == ImagesStatus.loading) {
              final imagesList = await imagesRepo.getRandomImagesRepo();
              emit(state.copyWith(
                  status: ImagesStatus.success, images: imagesList));
            } else {
              final imagesList = await imagesRepo.getRandomImagesRepo();
              emit(
                state.copyWith(
                  status: ImagesStatus.success,
                  images: List.of(state.images)..addAll(imagesList),
                ),
              );
            }
          } catch (e) {
            emit(state.copyWith(status: ImagesStatus.error, message: "$e"));
          }
        }
      },
      transformer: droppable(),
    );
  }
}
