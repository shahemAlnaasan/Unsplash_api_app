import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:unsplash_api_app/data/models/image_model.dart';
import 'package:unsplash_api_app/data/models/search_image_model.dart';
import 'package:unsplash_api_app/data/repository/search_image_repo.dart';

part 'search_image_event.dart';
part 'search_image_state.dart';

class SearchImageBloc extends Bloc<SearchImageEvent, SearchImageState> {
  SearchImageRepo searchImageRepo = SearchImageRepo();
  int page = 1;
  String currentQuery = "";

  SearchImageBloc() : super(const SearchImageState()) {
    on<SearchImageEvent>((event, emit) async {
      if (event is StartSearchImageEvent) {
        try {
          if (event.query != currentQuery) {
            page = 1;
            currentQuery = event.query;
            emit(
                state.copyWith(status: SearchImagesStatus.loading, images: []));
          }

          List<ImageItems> images =
              await searchImageRepo.getSearchImageRepo(event.query, page);

          if (page == 1) {
            emit(state.copyWith(
              status: SearchImagesStatus.success,
              images: images,
            ));
          } else {
            emit(state.copyWith(
              status: SearchImagesStatus.success,
              images: List.of(state.images)..addAll(images),
            ));
          }

          page++;
        } catch (e) {
          emit(state.copyWith(status: SearchImagesStatus.error));
        }
      }
    }, transformer: droppable());
  }
}
