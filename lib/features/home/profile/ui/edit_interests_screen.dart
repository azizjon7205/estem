import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:estem/core/router/router.dart';
import 'package:estem/core/styles/app_colors.dart';
import 'package:estem/features/home/profile/bloc/profile_bloc.dart';
import 'package:estem/features/home/profile/bloc/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

@RoutePage()
class EditInterestsScreen extends StatefulWidget {
  const EditInterestsScreen(
      {super.key,
      required this.profileData,
      required this.initialInterests,
      required this.onSave});

  final List<String> initialInterests;
  final ValueChanged<List<String>> onSave;

  final ProfileLoaded profileData;

  @override
  _EditInterestsBottomSheetState createState() {
    return _EditInterestsBottomSheetState();
  }
}

class _EditInterestsBottomSheetState extends State<EditInterestsScreen> {
  late List<String> selectedInterests;
  final TextEditingController _interestController = TextEditingController();

  @override
  void initState() {
    super.initState();
    selectedInterests = List.from(widget.initialInterests);
  }

  @override
  void dispose() {
    _interestController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
      if (state is ProfileLoaded) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
              bottom: MediaQuery.of(context).viewInsets.bottom + 16,
              top: 30,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _interestController,
                  decoration: InputDecoration(
                    labelText: 'Enter',
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        final newInterest = _interestController.text.trim();
                        if (newInterest.isNotEmpty &&
                            !selectedInterests.contains(newInterest)) {
                          setState(() {
                            selectedInterests.add(newInterest);
                            _interestController.clear();
                          });
                        }
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
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
                    return selectedInterests
                        .asMap()
                        .entries
                        .map(
                          (entry) => Chip(
                            label: Text(
                              entry.value,
                              style: GoogleFonts.inter(color: AppColors.white),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                            deleteIcon: const Icon(
                              Icons.cancel,
                              color: AppColors.white,
                            ),
                            // interest name
                            onDeleted: () {
                              setState(() {
                                selectedInterests.remove(entry.value);
                              });
                            },
                            color: WidgetStateProperty.all<Color>(
                              predefinedColors[
                                  entry.key % predefinedColors.length],
                            ),
                          ),
                        )
                        .toList();
                  }(),
                ),
                const SizedBox(
                  height: 60,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 133,
                          height: 58,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.gray),
                            onPressed: () {},
                            child: Text(
                              'Cancel',
                              style: GoogleFonts.inter(
                                  color: AppColors.textStrong, fontSize: 16),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        SizedBox(
                          width: 133,
                          height: 58,
                          child: ElevatedButton(
                            onPressed: () {
                              widget.onSave(selectedInterests);
                              navController.maybePop();
                            },
                            child: Text(
                              'Save',
                              style: GoogleFonts.inter(
                                  color: AppColors.white, fontSize: 16),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }
      return const Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}
