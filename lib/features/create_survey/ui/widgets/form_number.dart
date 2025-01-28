import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:estem/shared/models/questions/question_email.dart';
import 'package:estem/shared/models/questions/question_number.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '/core/styles/app_colors.dart';
import '/core/utils/log/app_logger.dart';
import '/shared/models/question.dart';
import '/shared/widgets/app_text_field.dart';
import 'form_container.dart';

class FormNumber extends StatefulWidget {
  const FormNumber(
      {super.key,
      required this.question,
      required this.onQuestionChanged,
      this.onDelete});

  final NumberQuestion question;
  final Function(Question) onQuestionChanged;
  final VoidCallback? onDelete;

  @override
  State<FormNumber> createState() => _FormNumberState();
}

class _FormNumberState extends State<FormNumber> {
  late Question query;
  Uint8List? _imageBytes;

  @override
  void initState() {
    query = widget.question;

    super.initState();
    _decodeImage();
  }

  void onSwitchValueChanged(bool value) {
    setState(() {
      query = query.copyWith(isRequired: value);
    });
    widget.onQuestionChanged(query);
  }

  void onPickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      // logger.info('Pick image name: ${image?.name}');
      if (image == null) return;
      final imageBytes = await image.readAsBytes();
      final base64Image = base64Encode(imageBytes);

      // Update the state and notify parent
      setState(() {
        query = query.copyWith(image: base64Image);
        _imageBytes = base64Decode(query.image!);
      });
      widget.onQuestionChanged(query);

      // logger.info('Pick image: ${query.image}');
    } catch (e) {

      logger.info('Failed to pick image: $e');
    }
  }

  @override
  void didUpdateWidget(covariant FormNumber oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Check if the image has changed
    if (widget.question.image != oldWidget.question.image) {
      _decodeImage();
    }
  }

  void _decodeImage() {
    if (widget.question.image != null) {
      setState(() {
        _imageBytes = base64Decode(widget.question.image!);
      });
    } else {
      setState(() {
        _imageBytes = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return FormContainer(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 16.0,
        children: [
          AppTextField(
            hint: widget.question.questionType.hint.tr(),
            value: widget.question.question,
            onChanged: (value) {
              query = query.copyWith(question: value);
              widget.onQuestionChanged(query);
            },
          ),
          if (_imageBytes != null) ...[
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.memory(
                _imageBytes!,
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            )
          ],
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            spacing: 6.0,
            children: [
              GestureDetector(
                onTap: () {
                  onPickImage();
                },
                child: Container(
                  width: 24,
                  height: 24,
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset('assets/icons/ic_attach.svg'),
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
                    value: query.isRequired,
                    onChanged: onSwitchValueChanged,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
