import '/shared/models/upload_file_params.dart';

import '/shared/models/upload_file_response.dart';

abstract class UploadFileApi {
  Future<UploadFileResponse> uploadFile(UploadFileParams params);

  Future deleteFile(dynamic id);
}