
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:estem/core/router/router.gr.dart';
import 'package:estem/core/styles/app_colors.dart';
import 'package:estem/features/home/profile/bloc/profile_bloc.dart';
import 'package:estem/features/home/profile/bloc/profile_event.dart';
import 'package:estem/features/home/profile/bloc/profile_state.dart';
import 'package:estem/features/home/profile/ui/widgets/build_chip.dart';
import 'package:estem/features/home/profile/ui/widgets/build_detail_card.dart';
import 'package:estem/features/home/profile/ui/widgets/change_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget {
    const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc()..add(LoadProfile()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Profile',
            style: GoogleFonts.inter(fontSize: 24, fontWeight: FontWeight.w500),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: BlocBuilder<ProfileBloc, ProfileState>(
                  builder: (context, state){
                    if(state is ProfileLoaded){
                      return  Row(
                        children: [
                          IconButton(
                            onPressed: (){
                              context.router.push(EditProfileRoute(profileData: state));
                            },
                            icon: Image.asset('assets/icons/ic_edit.png'),
                          ),
                          Text(
                            'Edit profile',
                            style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: AppColors.primary),
                          ),
                        ],
                      );
                    } else {
                      return IconButton(
                        onPressed: null, // Agar state yuklanmasa
                        icon: Image.asset('assets/icons/ic_edit.png'),
                    );
                     }
                    }
              ),
            )
          ],
        ),
        body: BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
          if (state is ProfileLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProfileError) {
            return Center(child: Text(state.message));
          } else if (state is ProfileLoaded) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  const CircularAvatar(),
                  Padding(
                    padding: const EdgeInsets.only(left: 4, right: 4),
                    child: Column(
                      children: [
                        BuildDetailCard(title: 'GENDER', value: state.gender),
                        BuildDetailCard(title: 'AGE', value: state.age.toString()),
                        BuildDetailCard(title: 'CITY', value: state.city),
                        BuildDetailCard(title: 'INCOME', value: state.income),
                        BuildDetailCard(
                            title: 'EMPLOYMENT STATUS',
                            value: state.employmentStatus),
                        BuildDetailCard(
                            title: 'EDUCAATION', value: state.education),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Interests',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                       ChangeButton(profileData: state,),
                    ],
                  ),
                  Wrap(
                    spacing: 8,
                    children: () {

                      final predefinedColors = [
                        Color(0xFF6B7AED), // #6B7AED
                        Color(0xFFEE544A), // #EE544A
                        Color(0xFFFF8D5D), // #FF8D5D
                        Color(0xFF7D67EE), // #7D67EE
                        Color(0xFF29D697), // #29D697
                        Color(0xFF39D1F2), // #39D1F2
                      ];

                      // shuffle
                      predefinedColors.shuffle();

                      // connect to the colors list
                      return state.interests
                          .asMap()
                          .entries
                          .map(
                            (entry) => BuildChip(
                          label: entry.value, // interest name
                          color: predefinedColors[entry.key % predefinedColors.length], // Rang
                        ),
                      ).toList();
                    }(),
                  )
                ],
              ),
            );
          }
          return const SizedBox.shrink();
        },
        ),
      ),
    );
  }
}

class CircularAvatar extends StatelessWidget {
  const CircularAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage('assets/images/im_profile_avatar.png'),
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          'John Macintosh',
          style: GoogleFonts.inter(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        Text(
          'Member since 23/11/2023',
          style: GoogleFonts.inter(fontWeight: FontWeight.w400, fontSize: 14),
        ),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }
}
