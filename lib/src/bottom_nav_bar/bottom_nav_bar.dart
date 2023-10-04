import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:memlearn/src/home/view/home_page.dart';
import 'package:memlearn/src/paths/view/paths_page.dart';
import 'package:memlearn/src/profile/view/profile_page.dart';
import 'package:memlearn/src/quest/view/quest_page.dart';
import 'package:memlearn/src/utils/theme_constants.dart';

import 'package:sizer/sizer.dart';

class BottomNavBar extends StatefulWidget {
  static const routeName = '/bottom-nav-bar';
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;
  int currentTabIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    const QuestPage(),
    const PathsPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: Container(
          height: 9.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColorTheme.kColorNotBlack,
            border: Border(
              top: BorderSide(color: AppColorTheme.kColorNotWhite, width: 0.5),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(bottom: 2.h, left: 3.w, right: 3.w),
            child: GNav(
                rippleColor: AppColorTheme
                    .kColorGrey, // tab button ripple color when pressed
                hoverColor: AppColorTheme.kColorGrey, // tab button hover color
                haptic: true, // haptic feedback
                tabBorderRadius: 30,
                curve: Curves.easeOutExpo, // tab animation curves
                duration:
                    const Duration(milliseconds: 200), // tab animation duration
                gap: 2.8.w, // the tab button gap between icon and text
                color: AppColorTheme.kColorGrey, // unselected icon color
                activeColor: AppColorTheme
                    .kColorNotWhite, // selected icon and text color
                iconSize: 14.sp, // tab button icon size
                tabBackgroundColor:
                    AppColorTheme.kColorGrey, // selected tab background color
                padding: EdgeInsets.symmetric(
                    horizontal: 20, vertical: 1.5.h), // navigation bar padding
                tabs: const [
                  GButton(
                    icon: FontAwesomeIcons.house,
                    text: 'Home',
                  ),
                  GButton(
                    icon: FontAwesomeIcons.coins,
                    text: 'Quests',
                  ),
                  GButton(
                    icon: FontAwesomeIcons.map,
                    text: 'Paths',
                  ),
                  GButton(
                    icon: FontAwesomeIcons.user,
                    text: 'Profile',
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
