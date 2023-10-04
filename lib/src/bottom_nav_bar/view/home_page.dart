import 'package:flutter/material.dart';
import 'package:memlearn/src/utils/theme_constants.dart';
import 'package:memlearn/src/widgets/pop_button.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home-page';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Supabase.instance.client.auth.signOut();
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 4.h),
            Text(
              "Coding Paths",
              style: TextStyle(
                  color: AppColorTheme.kColorWhiteText,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 1.h),
            Text(
              "Step-by-step stages to masters",
              style: TextStyle(
                color: AppColorTheme.kColorWhiteGrey,
                fontSize: 11.sp,
              ),
            ),
            SizedBox(height: 2.h),
            SizedBox(
              height: 25.h,
              child: ListView(
                children: [
                  Card(
                    child: Placeholder(),
                  )
                ],
                scrollDirection: Axis.horizontal,
              ),
            ),
            PopButton(
              size: 25,
              color: AppColorTheme.kColorNotWhite,
              onPressed: () {
                // Navigator.of(context).pop();
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 20.w),
                child: Text(
                  "X",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColorTheme.kColorNotBlack,
                    fontSize: 18,
                    fontFamily: 'Gameplay',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
