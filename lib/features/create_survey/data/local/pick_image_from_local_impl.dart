 import 'package:image_picker/image_picker.dart';

import 'pick_image_from_local.dart';

class PickImageFromLocalImpl extends PickImageFromLocal {

  @override
  Future<String> pickImage() async{
    final result = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (result == null) throw Exception('An error occurred');
    if ((await result.length()) <= (5 * 1024 * 1024)) {
      return result.path;
    } else {
      throw Exception("The image must be lower than 5 MB");
    }
  }

}