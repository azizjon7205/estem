import 'package:easy_localization/easy_localization.dart';
import 'package:estem/core/router/router.dart';
import 'package:estem/core/router/router.gr.dart';
import 'package:estem/shared/data/data_sources/local/app_shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/utils/injections.dart';
import '/shared/widgets/sizes.dart';
import 'drawer_menu_item.dart';

class DrawerLayout extends StatelessWidget {
  const DrawerLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 24, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.network(
                    'https://picsum.photos/id/1/200/300',
                    fit: BoxFit.cover,
                    height: 60,
                    width: 60,
                  ),
                ),
                const Height(12.0),
                Text(
                  'User name',
                  style: GoogleFonts.inter(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 19,
                  ),
                ),
                const Height(42.0),
                Column(
                  spacing: 16,
                  children: [
                    DrawerMenuItem(
                      leadingPath: 'assets/icons/ic_profile_2.svg',
                      label: 'main.my_profile'.tr(),
                      onTap: () {},
                    ),
                    DrawerMenuItem(
                      leadingPath: 'assets/icons/ic_statistics.svg',
                      label: 'main.statistics'.tr(),
                      onTap: () {},
                    ),
                    DrawerMenuItem(
                      leadingPath: 'assets/icons/ic_bookmark.svg',
                      label: 'main.bookmark'.tr(),
                      onTap: () {},
                    ),
                    DrawerMenuItem(
                      leadingPath: 'assets/icons/ic_message.svg',
                      label: 'main.contact_us'.tr(),
                      onTap: () {},
                    ),
                    DrawerMenuItem(
                      leadingPath: 'assets/icons/ic_settings.svg',
                      label: 'main.settings'.tr(),
                      onTap: () {},
                    ),
                    DrawerMenuItem(
                      leadingPath: 'assets/icons/ic_help.svg',
                      label: 'main.help_faqs'.tr(),
                      onTap: () {},
                    ),
                    DrawerMenuItem(
                      leadingPath: 'assets/icons/ic_privacy_policy.svg',
                      label: 'main.privacy_policy'.tr(),
                      onTap: () {},
                    ),
                    DrawerMenuItem(
                      leadingPath: 'assets/icons/ic_sign_out.svg',
                      label: 'main.sign_out'.tr(),
                      onTap: () {
                        sl<AppSharedPrefs>()
                          ..removePhoneNumber()
                          ..removeAuthToken();
                        navController.replaceAll([const MainRoute()]);
                      },
                    ),
                  ],
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    height: 46,
                    decoration: BoxDecoration(
                      color: const Color(0xFF00F8FF).withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Row(
                      spacing: 10,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset('assets/icons/ic_share.svg'),
                        Text(
                          'main.invite_friends'.tr(),
                          style: GoogleFonts.inter(
                              color: const Color(0xFF00F8FF),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              height: 17 / 14),
                        )
                      ],
                    ),
                  ),
                ),
                const Height(56.0)
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              width: 37,
              height: MediaQuery.of(context).size.height * 0.725,
              decoration: BoxDecoration(
                color: const Color(0xFFBCBCBC).withValues(alpha: 0.2),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40),
                  bottomLeft: Radius.circular(40),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              width: 22,
              height: MediaQuery.of(context).size.height * 0.7875,
              decoration: BoxDecoration(
                color: const Color(0xFFBCBCBC).withValues(alpha: 0.2),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40),
                  bottomLeft: Radius.circular(40),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
