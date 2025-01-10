import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/profile_bloc.dart';

class BuildChip extends StatelessWidget{
  const BuildChip( {  // yaxshilab qarab yozib chiqih kerak
    super.key, required this.label,
});

  final String label;


  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label),
      backgroundColor: Colors.blue.shade50,
      labelStyle: const TextStyle(color: Colors.blue),

    );
  }
}