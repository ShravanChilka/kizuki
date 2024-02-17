import 'dart:developer';
import 'dart:io';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

abstract class RemoteImageDownloader {
  Future<void> download({required String imageUrl});
}

class FlutterImageDownloaderImpl implements RemoteImageDownloader {
  FlutterImageDownloaderImpl();

  @override
  Future<void> download({
    required String imageUrl,
  }) async {
    try {
      Directory? directory = await _getLocalDirectory();
      if (directory != null) {
        FlutterDownloader.enqueue(
          url: imageUrl,
          savedDir: directory.path,
          showNotification: true,
          openFileFromNotification: true,
          fileName: '${DateTime.now().microsecondsSinceEpoch}',
          saveInPublicStorage: true,
        );
      }
    } catch (e, s) {
      log('download', name: '$runtimeType', error: e, stackTrace: s);
    }
  }

  Future<Directory?> _getLocalDirectory() async {
    Directory? directory;
    if (Platform.isIOS) {
      directory = await path_provider.getApplicationDocumentsDirectory();
    } else if (Platform.isAndroid) {
      if (await path_provider.getExternalStorageDirectory() != null) {
        directory = (await path_provider.getExternalStorageDirectory())!;
      }
    }
    return directory;
  }
}
