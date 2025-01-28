
import '../local/pick_image_from_local.dart';
import '../remote/upload_image_api.dart';
import '/shared/models/upload_file_params.dart';

import '/shared/models/upload_file_response.dart';

import '../../domain/repositories/upload_image_repository.dart';

class UploadImageRepositoryImpl extends UploadImageRepository {
  final UploadImageApi _api;
  final PickImageFromLocal _imageFromLocal;

  UploadImageRepositoryImpl(this._api, this._imageFromLocal);

  @override
  Future deleteImage(id) {
    return _api.deleteImage(id);
  }

  @override
  Future<UploadFileResponse> uploadImage(UploadFileParams params) async{
    try {
      final path = await _imageFromLocal.pickImage();
      return _api.uploadImage(params.copyWith(path: path));
    } catch (e) {
      rethrow;
    }
  }

}