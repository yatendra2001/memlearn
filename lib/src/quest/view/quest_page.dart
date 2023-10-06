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
                  "Goals",
                  style: TextStyle(
                      color: AppColorTheme.kColorWhiteText,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 3.h),
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
                              width: 70.w,
                              child: Stack(
                                children: [
                                  Container(
                                    height: 3.h,
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
                                      height: 3.h,
                                      decoration: BoxDecoration(
                                        color: AppColorTheme.kColorNotBlack,
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 0,
                                    right: 0,
                                    top: 0,
                                    bottom: 0,
                                    child: Center(
                                      child: Text(
                                        '1/10', // Progress text
                                        style: TextStyle(
                                          color: AppColorTheme.kColorNotBlack,
                                          fontSize: 9.sp,
                                          fontWeight: FontWeight.w700,
                                        ),
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
                                FontAwesomeIcons.box,
                                size: 20.sp,
                                color: AppColorTheme.kColorNotBlack
                                    .withOpacity(0.5), // Faded color
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 3.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Daily Quests",
                      style: TextStyle(
                          color: AppColorTheme.kColorWhiteText,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700),
                    ),
                    Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.clock,
                          size: 12.sp,
                        ),
                        SizedBox(width: 1.w),
                        Text(
                          "12 hours",
                          style: TextStyle(
                              color: AppColorTheme.kColorWhiteText,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 2.h),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border:
                        Border.all(color: AppColorTheme.kColorGrey, width: 2),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DailyQuestsInformationWidget(
                        icondata: FontAwesomeIcons.fire,
                        color: AppColorTheme.kColorPurplePastel,
                        title: "Start a streak",
                        totalTasks: "1",
                        tasksCompleted: "0",
                      ),
                      Divider(
                        height: 2.h,
                        color: AppColorTheme.kColorGrey,
                        thickness: 2,
                      ),
                      DailyQuestsInformationWidget(
                        icondata: FontAwesomeIcons.boxArchive,
                        color: AppColorTheme.kColorYellowPastel,
                        title: "Get 5 in a row correct in 2 lessons",
                        totalTasks: "2",
                        tasksCompleted: "1",
                      ),
                      Divider(
                        height: 2.h,
                        color: AppColorTheme.kColorGrey,
                        thickness: 2,
                      ),
                      DailyQuestsInformationWidget(
                        icondata: FontAwesomeIcons.stopwatch,
                        color: AppColorTheme.kColorBluePastel,
                        title: "Spend 15 minutes learning",
                        totalTasks: "15",
                        tasksCompleted: "10",
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DailyQuestsInformationWidget extends StatelessWidget {
  final IconData icondata;
  final String title;
  final String totalTasks;
  final String tasksCompleted;
  final Color color;
  const DailyQuestsInformationWidget({
    super.key,
    required this.icondata,
    required this.title,
    required this.totalTasks,
    required this.tasksCompleted,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        children: [
          Icon(
            icondata,
            color: color,
            size: 32.sp,
          ),
          SizedBox(width: 5.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 50.w,
                child: Text(
                  title,
                  style: TextStyle(
                      color: AppColorTheme.kColorWhiteText,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(height: 1.5.h),
              Row(
                children: [
                  SizedBox(
                    width: 54.w,
                    child: Stack(
                      children: [
                        Container(
                          height: 3.h,
                          decoration: BoxDecoration(
                            color: AppColorTheme.kColorGrey,
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        LayoutBuilder(
                          builder: (context, constraints) => Container(
                            width: constraints.maxWidth *
                                (int.parse(tasksCompleted) /
                                    int.parse(totalTasks)), // 10% completion
                            height: 3.h,
                            decoration: BoxDecoration(
                              color: color,
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          right: 0,
                          top: 0,
                          bottom: 0,
                          child: Center(
                            child: Text(
                              '$tasksCompleted/$totalTasks', // Progress text
                              style: TextStyle(
                                color: int.parse(tasksCompleted) /
                                            int.parse(totalTasks) >
                                        0.4
                                    ? AppColorTheme.kColorNotBlack
                                    : AppColorTheme.kColorWhiteText,
                                fontSize: 9.sp,
                                fontWeight: FontWeight.w700,
                              ),
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
                      size: 20.sp,
                      color: color.withOpacity(0.2), // Faded color
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
