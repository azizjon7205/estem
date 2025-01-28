import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '/core/styles/app_colors.dart';
import '/shared/models/region.dart';
import '/shared/widgets/app_text_field.dart';
import '/shared/widgets/item_category.dart';
import '/shared/widgets/sizes.dart';
import '../bloc/create_bloc.dart';
import '../bloc/create_event.dart';

class SlotCreateSurveyAttributes extends StatelessWidget {
  const SlotCreateSurveyAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<CreateBloc>();
    final watcher = context.watch<CreateBloc>();
    return Column(
      spacing: 16.0,
      children: [
        AppTextField(
          label: "create.form_title".tr(),
          textInputAction: TextInputAction.next,
          value: watcher.state.title,
          onChanged: (value) {
            controller.add(OnTitleChanged(value));
          },
        ),
        AppTextField(
          label: "create.form_description".tr(),
          keyboardType: TextInputType.multiline,
          textInputAction: TextInputAction.newline,
          maxLines: 4,
          value: watcher.state.description,
          onChanged: (value) {
            controller.add(OnDescriptionChanged(value));
          },
        ),
        AppTextField(
          label: "create.form_duration".tr(),
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          textInputAction: TextInputAction.next,
          value: watcher.state.duration?.toString(),
          onChanged: (value) {
            controller.add(OnDurationChanged(int.tryParse(value) ?? 0));
          },
        ),
        AppTextField(
          label: "create.form_price".tr(),
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.done,
          value: watcher.state.price?.toString(),
          inputFormatters: [
            CurrencyTextInputFormatter.currency(
                locale: 'uz', decimalDigits: 0, symbol: ''),
          ],
          onChanged: (value) {
            controller.add(OnPriceChanged(
                double.tryParse(value.replaceAll(' ', '')) ?? 0));
          },
        ),
        if (watcher.state.categories.isNotEmpty)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8,
            children: [
              Text(
                'create.choose_category'.tr(),
                style: GoogleFonts.inter(
                  color: AppColors.textStrong,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 100,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, i) {
                    final category = watcher.state.categories[i];
                    return CategoryItem(
                      category: category,
                      isSelected: category.id == watcher.state.categoryId,
                      onTap: () {
                        controller.add(OnSelectCategory(category.id));
                      },
                    );
                  },
                  separatorBuilder: (context, i) => const Width(16),
                  itemCount: watcher.state.categories.length,
                ),
              ),
            ],
          ),
        if (watcher.state.regions.isNotEmpty)
          Column(
            spacing: 8,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'create.choose_region'.tr(),
                style: GoogleFonts.inter(
                  color: AppColors.textStrong,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              DropdownButtonHideUnderline(
                child: DropdownButton2<Region>(
                  isDense: true,
                  onChanged: (value) {},
                  menuItemStyleData: const MenuItemStyleData(
                      // padding: EdgeInsets.all(16),
                      height: 36,
                      overlayColor: WidgetStateColor.transparent),
                  dropdownStyleData: DropdownStyleData(
                    padding: EdgeInsets.all(0),
                    offset: const Offset(0, -4),
                    maxHeight: 300,
                    scrollPadding: const EdgeInsets.symmetric(vertical: 0.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color:
                              const Color(0xFF493E83).withValues(alpha: 0.12),
                          offset: const Offset(0, 16),
                          blurRadius: 32,
                        )
                      ],
                    ),
                  ),
                  customButton: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: AppColors.gray),
                    ),
                    child: Row(
                      spacing: 12.0,
                      children: [
                        Container(
                          width: 45.0,
                          height: 45.0,
                          padding: const EdgeInsets.all(7.0),
                          decoration: BoxDecoration(
                            color: AppColors.primary.withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Container(
                            padding: const EdgeInsets.all(7.0),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.location_on_outlined,
                                color: AppColors.primary,
                                size: 16,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          watcher.state.regionId == null
                              ? 'create.choose_region'.tr()
                              : watcher.state.regions
                                  .firstWhere(
                                      (e) => e.id == watcher.state.regionId)
                                  .name,
                          style: GoogleFonts.inter(
                            color: watcher.state.regionId == null
                                ? AppColors.secondary
                                : AppColors.textStrong,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            height: 34 / 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  items: [
                    ...watcher.state.regions.map(
                      (element) => DropdownMenuItem(
                        onTap: () {
                          controller.add(OnSelectRegion(element.id));
                        },
                        value: element,
                        child: Container(
                          height: 36,
                          width: double.infinity,
                          color: watcher.state.regionId == element.id
                              ? AppColors.primary.withValues(alpha: 0.3)
                              : Colors.transparent,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              element.name,
                              style: GoogleFonts.inter(
                                color: AppColors.textStrong,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
      ],
    );
  }
}
