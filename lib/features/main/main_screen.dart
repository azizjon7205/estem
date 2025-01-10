import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '/core/router/router.gr.dart';
import '/core/styles/app_colors.dart';
import 'home/ui/widgets/drawer_layout.dart';

@RoutePage()
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _advancedDrawerController = AdvancedDrawerController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      disabledGestures: true,
      backdropColor: Colors.white,
      controller: _advancedDrawerController,
      childDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
      ),
      drawer: const DrawerLayout(),
      child: AutoTabsScaffold(
        routes: [
          HomeRoute(openDrawer: () {
            _advancedDrawerController.showDrawer();
          }),
          const FormsRoute(),
          const PlaceholderRoute(),
          const WalletRoute(),
          const ProfileRoute()
        ],
        floatingActionButton: Container(
          padding: const EdgeInsets.all(8),
          height: 62,
          width: 62,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, -3),
                  blurRadius: 8,
                  color: const Color(0xFF9DB2D6).withValues(alpha: 0.1),
                )
              ]),
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 8),
                  blurRadius: 20,
                  color: const Color(0xFF4A43EC).withValues(alpha: 0.2),
                )
              ],
            ),
            child: SvgPicture.asset('assets/icons/ic_add.svg'),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBuilder: (_, tabsRouter) {
          return BottomNavigationBar(
            selectedItemColor: AppColors.primary,
            unselectedItemColor: const Color(0xFFd1cfd6),
            currentIndex: tabsRouter.activeIndex,
            showUnselectedLabels: true,
            backgroundColor: Colors.white,
            unselectedLabelStyle: GoogleFonts.inter(
              color: const Color(0xFFd1cfd6),
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
            type: BottomNavigationBarType.fixed,
            elevation: 3,
            onTap: (value) {
              if (value != 2) {
                tabsRouter.setActiveIndex(value);
              }
            },
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/ic_home.svg',
                  width: 30,
                  height: 30,
                  colorFilter: const ColorFilter.mode(
                    Color(0xFFd1cfd6),
                    BlendMode.srcIn,
                  ),
                ),
                activeIcon: SvgPicture.asset(
                  'assets/icons/ic_home.svg',
                  width: 30,
                  height: 30,
                  colorFilter: const ColorFilter.mode(
                      AppColors.primary, BlendMode.srcIn),
                ),
                label: 'main.home'.tr(),
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/ic_forms.svg',
                  width: 30,
                  height: 30,
                  colorFilter: const ColorFilter.mode(
                    Color(0xFFd1cfd6),
                    BlendMode.srcIn,
                  ),
                ),
                activeIcon: SvgPicture.asset(
                  'assets/icons/ic_menu_search.svg',
                  width: 30,
                  height: 30,
                  colorFilter: const ColorFilter.mode(
                      AppColors.primary, BlendMode.srcIn),
                ),
                label: 'main.forms'.tr(),
              ),
              const BottomNavigationBarItem(
                  icon: SizedBox(), activeIcon: SizedBox(), label: ''),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/ic_wallet.svg',
                  width: 30,
                  height: 30,
                  colorFilter: const ColorFilter.mode(
                    Color(0xFFd1cfd6),
                    BlendMode.srcIn,
                  ),
                ),
                activeIcon: SvgPicture.asset(
                  'assets/icons/ic_wallet.svg',
                  width: 30,
                  height: 30,
                  colorFilter: const ColorFilter.mode(
                      AppColors.primary, BlendMode.srcIn),
                ),
                label: 'main.wallet'.tr(),
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/ic_profile.svg',
                  width: 30,
                  height: 30,
                  colorFilter: const ColorFilter.mode(
                    Color(0xFFd1cfd6),
                    BlendMode.srcIn,
                  ),
                ),
                activeIcon: SvgPicture.asset(
                  'assets/icons/ic_profile.svg',
                  width: 30,
                  height: 30,
                  colorFilter: const ColorFilter.mode(
                      AppColors.primary, BlendMode.srcIn),
                ),
                label: 'main.profile'.tr(),
              ),
            ],
          );
        },
      ),
    );
  }
}

/**
 * SmileItemCard(
    question: StarRatingQuestion(
    question: "This is short answer question?",
    image: 'https://picsum.photos/id/1/200/300',
    isRequired: true,
    ratingLabels: {
    1.0: 'Worst',
    2.0: 'Not Good',
    3.0: 'Neutral',
    4.0: 'Good',
    5.0: 'Very Good',
    },
    ),
    rating: 1.0,
    onSmileChanged: (rating ) {  },
    )
 *
 * */
