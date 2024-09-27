import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';

part 'share_image_event.dart';
part 'share_image_state.dart';

class ShareImageBloc extends Bloc<ShareImageEvent, ShareImageState> {
  final Dio dio = Dio();
  ShareImageBloc() : super(ShareImageInprogressState()) {
    on<ShareImageEvent>((event, emit) async {
      if (event is StartShareImageEvent) {
        try {
          if (await Permission.storage.request().isGranted) {
            Directory tempDir = await getTemporaryDirectory();
            String tempPath = tempDir.path;

            String filePath =
                '$tempPath/${DateTime.now().millisecondsSinceEpoch}.jpg';

            await dio.download(event.imageUrl, filePath);

            if (filePath.isNotEmpty) {
              Share.shareXFiles([XFile(filePath)],
                  text: 'Check out this cool image from Unsplash!');
              emit(const ShareImageSuccessState(message: ""));
            }
          } else {
            emit(const ShareImageFailedState(
                errorMessage:
                    "Storage permission is required to download images."));
          }
        } catch (e) {
          emit(ShareImageFailedState(errorMessage: "Error while sharing $e "));
        }
      }
    });
  }
}
