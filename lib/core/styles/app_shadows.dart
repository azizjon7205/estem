import 'package:flutter/material.dart';

class AppShadows {
  static final cardShadow = BoxShadow(
      color: const Color(0xff505588).withOpacity(0.15),
      blurRadius: 30,
      offset: const Offset(0, 8)
  );

  static final formShadow = BoxShadow(
      color: const Color(0xff505588).withValues(alpha: 0.06),
      blurRadius: 30,
      offset: const Offset(0, 8)
  );


}
