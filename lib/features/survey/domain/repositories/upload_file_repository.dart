import '/shared/models/upload_file_params.dart';

import '/shared/models/upload_file_response.dart';

abstract class UploadFileRepository {
  Future<UploadFileResponse> uploadFile(UploadFileParams params);

  Future<UploadFileResponse> uploadFileTemporary(UploadFileParams params);

  Future deleteFile(dynamic id);
}