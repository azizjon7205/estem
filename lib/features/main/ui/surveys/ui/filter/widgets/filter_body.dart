import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:estem/core/router/router.dart';
import 'package:estem/features/main/ui/surveys/ui/filter/bloc/filter_event.dart';
import 'package:estem/shared/widgets/app_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../../core/router/router.gr.dart';
import '../../../../../../../core/styles/app_colors.dart';
import '../../../../../../../shared/models/region.dart';
import '../../../../../../../shared/widgets/item_category.dart';
import '../../../../../../../shared/widgets/sizes.dart';
import '../bloc/filter_bloc.dart';

class FilterBody extends StatelessWidget {
  const FilterBody({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<FilterBloc>();
    final watcher = context.watch<FilterBloc>();
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 30,
        horizontal: 20,
      ),
      child: Column(
        spacing: 20,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Filter",
            style: GoogleFonts.inter(
              fontSize: 25,
              color: AppColors.textStrong,
              fontWeight: FontWeight.w400,
            ),
          ),
          watcher.state.isLoading ? const SizedBox(
            height: 64,
            width: double.infinity,
            child: Center(
              child: SizedBox(
                height: 32,
                width: 32,
                child: CircularProgressIndicator(
                  color: AppColors.primary,
                ),
              ),
            ),
          ) : Column(
            spacing: 20,
            children: [
              if (watcher.state.categories.isNotEmpty)
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
                          controller.add(OnCategorySelected(category.id));
                        },
                      );
                    },
                    separatorBuilder: (context, i) => const Width(16),
                    itemCount: watcher.state.categories.length,
                  ),
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
                                controller.add(OnRegionSelected(element.id));
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
          ),
          Row(
            spacing: 20,
            children: [
              Expanded(
                flex: 2,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(0, 58),
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Color(0xFFE5E5E5)),
                      borderRadius: BorderRadius.circular(14.0),
                    ),
                  ),
                  onPressed: () {
                    controller.add(OnReset());
                  },
                  child: Text(
                    'base.actions.reset'.tr().toUpperCase(),
                    style: GoogleFonts.inter(
                      color: AppColors.textStrong,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: AppElevatedButton(
                  onTap: () {
                    navController.maybePop();
                    navController.push(SurveysRoute(params: watcher.state.mapToFilterParams()));
                  },
                  label: 'base.actions.apply'.tr().toUpperCase(),
                  hasSuffixNext: false,
                  enabled: watcher.state.isChanged,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
