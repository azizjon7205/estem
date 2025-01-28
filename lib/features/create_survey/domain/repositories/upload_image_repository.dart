import '/shared/models/upload_file_params.dart';

import '/shared/models/upload_file_response.dart';

abstract class UploadImageRepository {
  Future<UploadFileResponse> uploadImage(UploadFileParams params);

  Future deleteImage(dynamic id);
}