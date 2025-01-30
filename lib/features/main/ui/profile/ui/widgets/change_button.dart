
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../bloc/profile_bloc.dart';
import '../../bloc/profile_event.dart';
import '../edit_interests_screen.dart';
import '/core/styles/app_colors.dart';
import '../../bloc/profile_state.dart';

class ChangeButton extends StatelessWidget {
  const ChangeButton({
    super.key,
    required this.profileData,
  });

  final ProfileLoaded profileData;

  @override
  Widget build(BuildContext context) {
    final interests = profileData.interests;
    return SizedBox(
      width: 90,
      height: 28,
      child: ElevatedButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (bottomSheetContext) {
              return BlocProvider.value(
                value: context.read<ProfileBloc>(),
                child: EditInterestsScreen(
                    profileData: profileData,
                    initialInterests: interests,
                    onSave: (updateInterests) {
                      context.read<ProfileBloc>().add(UpdateInterests(interests));
                    }),
              );
            },
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          shadowColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        ),
        child: Row(
          children: [
            Image.asset('assets/icons/ic_change.png'),
            const SizedBox(
              width: 6,
            ),
            Text(
              'CHANGE',
              style: GoogleFonts.inter(
                  fontSize: 10,
                  color: AppColors.primary,
                  fontWeight: FontWeight.w500),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
