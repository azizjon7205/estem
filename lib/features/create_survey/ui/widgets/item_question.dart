import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

import '../../domain/entities/question_entity.dart';
import '../bloc/create_bloc.dart';
import '../bloc/create_event.dart';
import '/core/styles/app_colors.dart';
import '/shared/widgets/app_text_field.dart';
import 'form_container.dart';

class ItemQuestion extends StatefulWidget {
  const ItemQuestion({super.key, required this.questionEntity, this.onTap, this.onDelete, this.onDuplicate});

  final QuestionEntity questionEntity;
  final VoidCallback? onTap;
  final VoidCallback? onDelete;
  final VoidCallback? onDuplicate;

  @override
  State<ItemQuestion> createState() => _ItemQuestionState();
}

class _ItemQuestionState extends State<ItemQuestion> {
  late final TextEditingController controller;
  Uint8List? _imageBytes;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
    _decodeImage();
  }

  @override
  void didUpdateWidget(covariant ItemQuestion oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Check if the image has changed
    if (widget.questionEntity.question.image != oldWidget.questionEntity.question.image) {
      _decodeImage();
    }
  }

  void _decodeImage() {
    if (widget.questionEntity.question.image != null) {
      setState(() {
        _imageBytes = base64Decode(widget.questionEntity.question.image!);
      });
    } else {
      setState(() {
        _imageBytes = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    controller.setText(widget.questionEntity.question.question);
    return GestureDetector(
      onTap: widget.onTap,
      child: FormContainer(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 8.0,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 16.0,
              children: [
                AppTextField(
                  controller: controller,
                  // value: widget.questionEntity.question.question,
                  errorText: widget.questionEntity.question.question.isEmpty
                      ? "question.form_error".tr()
                      : null,
                  isReadOnly: true,
                ),
                if (_imageBytes != null) ...[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.memory(
                      _imageBytes!,
                      height: 120,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  )
                ],
                if (widget.questionEntity.additionalLabel?.isEmpty != true)
                  Text(
                    widget.questionEntity.additionalLabel!,
                    style: GoogleFonts.inter(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  spacing: 6.0,
                  children: [
                    GestureDetector(
                      onTap: widget.onDuplicate,
                      child: Container(
                        width: 24,
                        height: 24,
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset('assets/icons/ic_copy.svg'),
                      ),
                    ),
                    GestureDetector(
                      onTap: widget.onDelete,
                      child: Container(
                        width: 24,
                        height: 24,
                        padding: const EdgeInsets.all(2),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child:
                            SvgPicture.asset('assets/icons/ic_delete_outlined.svg'),
                      ),
                    ),
                    Container(
                      color: AppColors.secondary,
                      height: 20,
                      width: 1,
                    ),
                    Text(
                      'create.required'.tr(),
                      style: GoogleFonts.inter(
                        color: const Color(0xFF29253C),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        height: 23 / 14,
                      ),
                    ),
                    SizedBox(
                      height: 27,
                      width: 40,
                      child: FittedBox(
                        child: Switch(
                          value: widget.questionEntity.question.isRequired,
                          onChanged: (value) {
                            context.read<CreateBloc>().add(
                                OnQuestionRequiredChanged(widget.questionEntity.id, value));
                          },
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
            if((widget.questionEntity.error ?? '').isNotEmpty)
              Text(widget.questionEntity.error!, style: GoogleFonts.inter(
                color: AppColors.red,
              ),)
          ],
        ),
      ),
    );
  }
}
