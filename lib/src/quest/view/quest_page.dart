import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:memcode/src/utils/theme_constants.dart';
import 'package:sizer/sizer.dart';

class QuestPage extends StatelessWidget {
  const QuestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 2.h),
                Text(
                  "Daily Quests",
                  style: TextStyle(
                      color: AppColorTheme.kColorWhiteText,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 4.h),
                Card(
                  color: AppColorTheme.kColorNotWhite,
                  shadowColor: AppColorTheme.kColorWhiteGrey,
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Complete 20 quests",
                          style: TextStyle(
                              color: AppColorTheme.kColorNotBlack,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(height: 1.h),
                        Row(
                          children: [
                            SizedBox(
                              width: 72.w,
                              child: Stack(
                                children: [
                                  Container(
                                    height: 2.h,
                                    decoration: BoxDecoration(
                                      color: AppColorTheme.kColorWhiteGrey,
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                  ),
                                  LayoutBuilder(
                                    builder: (context, constraints) =>
                                        Container(
                                      width: constraints.maxWidth *
                                          0.1, // 10% completion
                                      height: 2.h,
                                      decoration: BoxDecoration(
                                        color: AppColorTheme.kColorNotBlack,
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 3.w),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Icon(
                                FontAwesomeIcons.solidCircleCheck,
                                color: Colors.green
                                    .withOpacity(0.5), // Faded color
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
