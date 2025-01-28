import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:estem/features/create_survey/ui/widgets/form_item_option.dart';
import 'package:estem/shared/models/questions/question_scale.dart';
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

class FormLinearScale extends StatefulWidget {
  const FormLinearScale(
      {super.key,
      required this.question,
      required this.onQuestionChanged,
      this.onDelete});

  final ScaleQuestion question;
  final Function(Question) onQuestionChanged;
  final VoidCallback? onDelete;

  @override
  State<FormLinearScale> createState() => _FormLinearScaleState();
}

class _FormLinearScaleState extends State<FormLinearScale> {
  late ScaleQuestion query;
  Uint8List? _imageBytes;

  @override
  void initState() {
    query = widget.question;
    super.initState();
    _decodeImage();
  }

  void onSwitchValueChanged(bool value) {
    setState(() {
      query = query.copyWith(isRequired: value) as ScaleQuestion;
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
        query = query.copyWith(image: base64Image) as ScaleQuestion;
        _imageBytes = base64Decode(query.image!);
      });
      widget.onQuestionChanged(query);

      // logger.info('Pick image: ${query.image}');
    } catch (e) {
      logger.info('Failed to pick image: $e');
    }
  }

  void onRightScaleChanged(int value) {
    setState(() {
      query = query.copyWith(rightScale: value) as ScaleQuestion;
    });
    widget.onQuestionChanged(query);
  }

  void onLeftLabelChanged(String value) {
    setState(() {
      query = query.copyWith(leftLabel: value) as ScaleQuestion;
    });
    widget.onQuestionChanged(query);
  }

  void onRightLabelChanged(String value) {
    setState(() {
      query = query.copyWith(rightLabel: value) as ScaleQuestion;
    });
    widget.onQuestionChanged(query);
  }

  @override
  void didUpdateWidget(covariant FormLinearScale oldWidget) {
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
              query = query.copyWith(question: value) as ScaleQuestion;
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
            spacing: 8.0,
            children: [
              Container(
                width: 42.0,
                padding: const EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    border: Border.all(color: AppColors.gray)),
                child: Center(
                  child: Text(
                    '1',
                    style: GoogleFonts.poppins(
                        color: const Color(0xFFB8B6BE),
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                        height: 21 / 14),
                  ),
                ),
              ),
              Container(
                width: 16,
                color: AppColors.gray,
                height: 1,
              ),
              Container(
                width: 42.0,
                padding: const EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    border: Border.all(color: AppColors.gray)),
                child: Center(
                  child: DropdownButton(
                    value: query.rightScale,
                    isDense: true,
                    icon: const Icon(Icons.keyboard_arrow_down, size: 16,),
                    style: GoogleFonts.poppins(
                        color: const Color(0xFFB8B6BE),
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                        height: 21 / 14,
                    ),
                    items: [
                      for (var i = 2; i <= 10; i++)
                        DropdownMenuItem(
                            value: i,
                            child: Text(i.toString()),)
                    ],
                    onChanged: (value) {
                      if (value != null) onRightScaleChanged(value);
                    },
                  ),
                ),
              )
            ],
          ),
          Column(
            spacing: 12.0,
            children: [
              FormItemOption(
                hint: 'question.left_label'.tr(),
                value: query.leftLabel,
                onValueChanged: onLeftLabelChanged,
                showSuffix: false,
              ),
              FormItemOption(
                hint: 'question.right_label'.tr(),
                value: query.rightLabel,
                onValueChanged: onRightLabelChanged,
                showSuffix: false,
              )
            ],
          ),
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
