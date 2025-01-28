import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:estem/shared/models/upload_file_params.dart';

import '/core/network/api_service.dart';

import '/shared/models/upload_file_response.dart';
import 'upload_image_api.dart';

class UploadImageApiImpl extends UploadImageApi {
  final ApiService _network;

  UploadImageApiImpl(this._network);

  @override
  Future deleteImage(id) {
    return _network.post(
      'api/files/delete',
      queryParameters: {"id": id},
      tFromJson: (json) => json as String,
    );
  }

  @override
  Future<UploadFileResponse> uploadImage(UploadFileParams params) async {
    Map<String, dynamic> json = {
      'params': jsonEncode(params.toJson()),
    };
    final file = await MultipartFile.fromFile(params.path!);
    json['file'] = file;
    FormData formData = FormData.fromMap(json);

    return _network.post(
      'api/files/upload',
      data: formData,
      tFromJson: UploadFileResponse.fromJson,
    );
  }
}
