import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

import '/core/styles/app_colors.dart';
import '/core/utils/log/app_logger.dart';
import '/shared/models/question.dart';
import '/shared/models/questions/option.dart';
import '/shared/models/questions/question_select.dart';
import '/shared/widgets/app_text_field.dart';
import 'form_container.dart';
import 'form_item_option.dart';

class FormSelect extends StatefulWidget {
  const FormSelect(
      {super.key,
      required this.question,
      required this.onQuestionChanged,
      this.onDelete});

  final SelectQuestion question;
  final Function(Question) onQuestionChanged;
  final VoidCallback? onDelete;

  @override
  State<FormSelect> createState() => _FormSelectState();
}

class _FormSelectState extends State<FormSelect> {
  late bool isRequired;
  late SelectQuestion query;
  Uint8List? _imageBytes;

  @override
  void initState() {
    query = widget.question;
    isRequired = widget.question.isRequired;

    super.initState();
    _decodeImage();
  }

  void onSwitchValueChanged(bool value) {
    widget.onQuestionChanged(query.copyWith(isRequired: value));
    setState(() {
      isRequired = value;
      query = query.copyWith(isRequired: value) as SelectQuestion;
    });
  }

  void onHasOtherValueChanged(bool value) {
    setState(() {
      query = query.copyWith(hasOther: value) as SelectQuestion;
    });
    widget.onQuestionChanged(query);
  }

  void onPickImage() async {
    logger.info('Pick image tap');
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      logger.info('Pick image name: ${image?.name}');
      if (image == null) return;
      final imageBytes = await image.readAsBytes();
      final base64Image = base64Encode(imageBytes);

      // Update the state and notify parent
      setState(() {
        query = query.copyWith(image: base64Image) as SelectQuestion;
        _imageBytes = base64Decode(query.image!);
      });
      widget.onQuestionChanged(query);

      // logger.info('Pick image: ${query.image}');
    } catch (e) {
      logger.info('Failed to pick image: $e');
    }
  }

  void onAddOption() {
    setState(() {
      query.options.add(Option(option: '', id: const Uuid().v4()));
    });
    widget.onQuestionChanged(query);
  }

  void onRemoveOption(dynamic id) {
    setState(() {
      final options = query.options;
      options.removeWhere((element) => element.id == id);
      query = query.copyWith(options: options) as SelectQuestion;
    });
    widget.onQuestionChanged(query);
  }

  void onOptionValueChanged(dynamic id, String value) {
    final option = query.options.firstWhere((element) => element.id == id);
    final index = query.options.indexWhere((element) => element.id == id);
    setState(() {
      query.options.removeAt(index);
      query.options.insert(index, option.copyWith(option: value));
    });
    widget.onQuestionChanged(query);
  }

  @override
  void didUpdateWidget(covariant FormSelect oldWidget) {
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
        crossAxisAlignment: CrossAxisAlignment.end,
        spacing: 16.0,
        children: [
          AppTextField(
            hint: widget.question.questionType.hint.tr(),
            value: widget.question.question,
            onChanged: (value) {
              query = query.copyWith(question: value) as SelectQuestion;
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
          Column(
            spacing: 8,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ...query.options.map(
                (element) => FormItemOption(
                  key: Key(element.id),
                  hint: 'question.option_hint'.tr(args: ['']),
                  value: element.option,
                  leading: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 5,
                        color: AppColors.gray,
                      ),
                    ),
                  ),
                  onValueChanged: (value) {
                    onOptionValueChanged(element.id, value);
                  },
                  onRemove: () {
                    onRemoveOption(element.id);
                  },
                ),
              ),
              GestureDetector(
                onTap: onAddOption,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14.0),
                    color: AppColors.primary.withValues(alpha: 0.1),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 4.0,
                    children: [
                      const Icon(
                        Icons.add,
                        color: AppColors.primary,
                        size: 14,
                      ),
                      Text(
                        'question.add_option'.tr(),
                        style: GoogleFonts.inter(
                          color: AppColors.primary,
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          height: 12.1 / 10,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Row(
                spacing: 6.0,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'question.add_other'.tr(),
                    style: GoogleFonts.inter(
                      color: const Color(0xFF29253C),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      height: 23 / 14,
                    ),
                  ),
                  SizedBox(
                    height: 23,
                    width: 40,
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: Switch(
                        value: query.hasOther,
                        onChanged: onHasOtherValueChanged,
                      ),
                    ),
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
                      child: SvgPicture.asset(
                          'assets/icons/ic_delete_outlined.svg'),
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
                    height: 23,
                    width: 40,
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: Switch(
                        value: isRequired,
                        onChanged: onSwitchValueChanged,
                      ),
                    ),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
