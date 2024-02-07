import 'dart:developer';
import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:http/http.dart';

abstract class RemoteImageDownloader {
  Future<void> download({required String imageUrl});
}

class RemoteImageDownloaderImpl implements RemoteImageDownloader {
  RemoteImageDownloaderImpl({
    required this.client,
  });

  final Client client;

  @override
  Future<void> download({
    required String imageUrl,
  }) async {
    try {
      log('called download');
      final response = await client.get(Uri.parse(imageUrl));
      final fileName = path.basename(imageUrl);
      final directory = await path_provider.getApplicationDocumentsDirectory();
      final filePath = path.join(directory.path, fileName);
      final file = File(filePath);
      await file.writeAsBytes(response.bodyBytes);
      log(file.path);
    } catch (e, s) {
      log('download', name: '$runtimeType', error: e, stackTrace: s);
    }
  }
}
