import 'dart:convert';

import 'package:dio/dio.dart';

import '/core/network/api_service.dart';
import '/shared/models/upload_file_params.dart';
import '/shared/models/upload_file_response.dart';
import 'upload_file_api.dart';

class UploadFileApiImpl extends UploadFileApi {
  final ApiService _network;

  UploadFileApiImpl(this._network);

  @override
  Future deleteFile(id) {
    return _network.post(
      'api/files/delete',
      queryParameters: {"id": id},
      tFromJson: (json) => json as String,
    );
  }

  @override
  Future<UploadFileResponse> uploadFile(UploadFileParams params) async {
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
