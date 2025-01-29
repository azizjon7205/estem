import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../styles/app_colors.dart';

showErrorMessage(String message){
  Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      gravity: ToastGravity.TOP,
      toastLength: Toast.LENGTH_LONG
  );

}

//
// void showErrorMessage({
//   required BuildContext context,
//   required String message,
// }) {
//   var snackBar = SnackBar(
//     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
//     content: Text(
//       message,
//       style: GoogleFonts.inter(
//           color: Colors.white,
//           fontSize: 16,
//           height: 20 / 16,
//           fontWeight: FontWeight.normal,
//       ),
//     ),
//     dismissDirection: DismissDirection.up,
//     behavior: SnackBarBehavior.floating,
//     backgroundColor: AppColors.red,
//     margin: EdgeInsets.only(
//       bottom: MediaQuery.of(context).size.height - (150),
//       left: 16,
//       right: 16,
//     ),
//   );
//   // ignore: use_build_context_synchronously
//   ScaffoldMessenger.of(context).showSnackBar(snackBar);
// }
