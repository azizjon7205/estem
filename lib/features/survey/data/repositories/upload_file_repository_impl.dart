import 'dart:io';

import '/shared/models/upload_file_params.dart';
import '/shared/models/upload_file_response.dart';
import '../../domain/repositories/upload_file_repository.dart';
import '../local/pick_file_from_local.dart';
import '../remote/upload_file_api.dart';

class UploadFileRepositoryImpl extends UploadFileRepository {
  final UploadFileApi _api;
  final PickFileFromLocal _fileFromLocal;

  UploadFileRepositoryImpl(this._api, this._fileFromLocal);

  @override
  Future deleteFile(id) {
    return _api.deleteFile(id);
  }

  @override
  Future<UploadFileResponse> uploadFile(UploadFileParams params) async {
    try {
      final path = await _fileFromLocal.pickFile();
      return _api.uploadFile(params.copyWith(path: path));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UploadFileResponse> uploadFileTemporary(
      UploadFileParams params) async {
    try {
      final path = await _fileFromLocal.pickFile();
      final file = File(path);
      String name = path.split('/').last;
      final size = file.lengthSync() / (1024 * 1024);

      return UploadFileResponse(
        url: path,
        name: name,
        size: size,
      );
    } catch (e) {
      rethrow;
    }
  }
}
