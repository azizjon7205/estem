 import 'dart:io';

import 'package:file_picker/file_picker.dart';

import 'pick_file_from_local.dart';

class PickFileFromLocalImpl extends PickFileFromLocal {

  @override
  Future<String> pickFile() async{
    final result = await FilePicker.platform.pickFiles();
    if (result == null) throw Exception('An error occurred');
    final file = File(result.files.single.path!);

    if ((file.lengthSync()) <= (50 * 1024 * 1024)) {
      return file.path;
    } else {
      throw Exception("The image must be lower than 50 MB");
    }
  }

}