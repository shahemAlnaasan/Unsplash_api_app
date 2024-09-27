import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:typed_data';

part 'download_image_event.dart';
part 'download_image_state.dart';

class DownloadImageBloc extends Bloc<DownloadImageEvent, DownloadImageState> {
  final Dio dio = Dio();

  DownloadImageBloc() : super(ImageDownloadInitial()) {
    on<DownloadImageEvent>(
      (event, emit) async {
        if (event is DownloadEvent) {
          emit(ImageDownloadInProgress());
          try {
            if (await Permission.storage.request().isGranted) {
              var response = await dio.get(
                event.imageUrl,
                options: Options(responseType: ResponseType.bytes),
              );

              final result = await ImageGallerySaver.saveImage(
                Uint8List.fromList(response.data),
                name: DateTime.now().millisecondsSinceEpoch.toString(),
              );

              if (result['isSuccess'] == true) {
                emit(const ImageDownloadSuccess("Image downloaded."));
              } else {
                emit(const ImageDownloadFailed("Failed to save image."));
              }
            } else {
              emit(const ImageDownloadFailed(
                  "Storage permission is required to download images."));
            }
          } catch (e) {
            emit(ImageDownloadFailed("Failed to download image: $e"));
          }
        }
      },
    );
  }
}
