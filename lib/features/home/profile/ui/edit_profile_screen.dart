import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:estem/core/router/router.dart';
import 'package:estem/core/styles/app_colors.dart';
import 'package:estem/features/home/profile/bloc/profile_event.dart';
import 'package:estem/features/home/profile/bloc/profile_state.dart';
import 'package:estem/features/home/profile/ui/widgets/buil_dropdown_field.dart';
import 'package:estem/features/home/profile/ui/widgets/build_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../bloc/profile_bloc.dart';

@RoutePage()
class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key, required this.profileData,});

  final ProfileLoaded profileData;


  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController(text: profileData.name);
    final ageController =
        TextEditingController(text: profileData.age.toString());
    final incomeController = TextEditingController(text: profileData.income);

    //DropDown selected values
    String selectedGender = profileData.gender;
    String selectedCity = profileData.city;
    String selectedEducation = profileData.education;
    String employmentStatus = profileData.employmentStatus;

    // Dropdown options
    final genderOptions = ['Male', 'Female', 'Other'];
    final cityOptions = ['Tashkent', 'Samarkand', 'Bukhara', 'Andijan'];
    final educationOptions = ['Master degree', 'High School', 'Bachelor'  'PhD'];
    final employmentStatusOptions = [
      'Full-Time Employment',
      'Part-Time employment',
      'Remote'
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Profile',
          style: GoogleFonts.inter(fontSize: 24, fontWeight: FontWeight.w500),
        ),
        leading: const BackButton(),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Center(
              child: Stack(
                children: [
                   Container(
                     decoration: BoxDecoration(
                       shape: BoxShape.circle,
                       border: Border.all(
                         color: AppColors.primary,
                         width: 2
                       ),
                     ),
                     child: const CircleAvatar(
                      radius: 50,
                      backgroundImage:
                          AssetImage('assets/images/im_profile_avatar.png'),
                                       ),
                   ),
                  Positioned(
                    right: -12,
                    top: -16,
                    child: GestureDetector(
                      onTap: () {

                      },
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        child: IconButton(
                          onPressed: () {},
                          icon: Image.asset('assets/icons/ic_edit.png', ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 22,),
            Padding(
              padding: const EdgeInsets.only(left: 38, right: 38),
              child: Column(
                children: [
                  BuildTextField(label: 'FULL NAME', controller: nameController),
                  BuildDropdownField(label: 'GENDER', selectedValue: selectedGender, options: genderOptions, onChanged: (value) => selectedGender = value!),
                  BuildTextField(label: 'AGE', controller: ageController, isNumeric: true),
                  BuildDropdownField(label: 'CITY', selectedValue: selectedCity, options: cityOptions, onChanged: (value) => selectedCity = value!),
                  BuildTextField(controller: incomeController, label: 'INCOME'),
                  BuildDropdownField(label: 'EDUCATION', selectedValue: selectedEducation, options: educationOptions, onChanged: (value) => selectedEducation = value!),
                  BuildDropdownField(label: 'EMPLOYMENT STATUS', selectedValue: employmentStatus, options: employmentStatusOptions, onChanged: (value) => employmentStatus = value!),

                  const SizedBox(height: 16,),
                   ElevatedButton(
                    style: ButtonStyle(
                      padding: WidgetStateProperty.all(
                        const EdgeInsets.symmetric(
                            vertical: 14,
                        ),
                      ),
                    ),

                    onPressed: () {
                      if(_formKey.currentState!.validate()){
                        // Send new data to the Bloc
                        context.read<ProfileBloc>().add(UpdateProfile(
                            name: nameController.text,
                            gender: selectedGender,
                            age: int.tryParse(ageController.text)??0,
                            city: selectedCity,
                            income: incomeController.text,
                            education: selectedEducation,
                            employmentStatus: employmentStatus),
                        );
                        navController.maybePop();
                      }
                    },
                    child: Text(
                      'Save Changes',
                      style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: AppColors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
