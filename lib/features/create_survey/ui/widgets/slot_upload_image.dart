import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:estem/features/create_survey/ui/bloc/create_bloc.dart';
import 'package:estem/features/create_survey/ui/bloc/create_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/styles/app_colors.dart';

class SlotUploadImage extends StatelessWidget {
  const SlotUploadImage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: null,
      child: DottedBorder(
        borderType: BorderType.RRect,
        radius: const Radius.circular(12.0),
        dashPattern: const [7.5, 4],
        color: AppColors.primary,
        child: SizedBox(
          width: double.infinity,
          height: 150,
          child: context.watch<CreateBloc>().state.imageLoading
              ? const Center(
                  child: SizedBox(
                    height: 32,
                    width: 32,
                    child: CircularProgressIndicator(
                      color: AppColors.primary,
                    ),
                  ),
                )
              : context.watch<CreateBloc>().state.image != null
                  ? Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12.0),
                          child: Image.network(
                            context.watch<CreateBloc>().state.image!,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            width: double.infinity,
                            height: 56,
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.3),
                            ),
                            child: Center(
                              child: ElevatedButton(
                                onPressed: () {
                                  context
                                      .read<CreateBloc>()
                                      .add(OnTapBrowseImage());
                                },
                                clipBehavior: Clip.hardEdge,
                                style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(0, 0),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 6.0, horizontal: 12.0),
                                  backgroundColor: AppColors.primary,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6.0),
                                  ),
                                ),
                                child: Text(
                                  'base.actions.browse_file'.tr(),
                                  style: GoogleFonts.inter(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    height: 23 / 14,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  : Column(
                      spacing: 16.0,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 36,
                          width: 36,
                          child:
                              SvgPicture.asset('assets/icons/ic_gallery.svg'),
                        ),
                        Text(
                          'create.upload_image'.tr(),
                          style: GoogleFonts.inter(
                            color: const Color(0xFF888693),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            height: 23 / 14,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            context.read<CreateBloc>().add(OnTapBrowseImage());
                          },
                          clipBehavior: Clip.hardEdge,
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(0, 0),
                            padding: const EdgeInsets.symmetric(
                                vertical: 6.0, horizontal: 12.0),
                            backgroundColor: AppColors.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                          ),
                          child: Text(
                            'base.actions.browse_file'.tr(),
                            style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              height: 23 / 14,
                            ),
                          ),
                        )
                      ],
                    ),
        ),
      ),
    );
  }
}
