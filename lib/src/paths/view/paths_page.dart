// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

import 'package:memcode/src/paths/models/path_model.dart';
import 'package:memcode/src/utils/paths_constants.dart';
import 'package:memcode/src/utils/theme_constants.dart';
import 'package:memcode/src/widgets/pop_button.dart';

class PathsPage extends StatelessWidget {
  const PathsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Supabase.instance.client.auth.signOut();
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
                "Coding Paths",
                style: TextStyle(
                    color: AppColorTheme.kColorWhiteText,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 1.h),
              Text(
                "Step-by-step stages to mastery",
                style: TextStyle(
                  color: AppColorTheme.kColorWhiteGrey,
                  fontSize: 11.sp,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                "Mobile Development",
                style: TextStyle(
                    color: AppColorTheme.kColorWhiteText,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 2.h),
              const PathsListViewCardWidget(
                type: "Mobile Development",
                pathModelsList: PathsConstants.mobileDevelopmentPathModelsList,
              ),
              Divider(
                height: 6.h,
                thickness: 2,
              ),
              Text(
                "Blockchain Development",
                style: TextStyle(
                    color: AppColorTheme.kColorWhiteText,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 2.h),
              const PathsListViewCardWidget(
                type: "Blockchain Development",
                pathModelsList:
                    PathsConstants.blockchainDevelopmentPathModelsList,
              ),
              Divider(
                height: 6.h,
                thickness: 2,
              ),
              Text(
                "Frontend Development",
                style: TextStyle(
                    color: AppColorTheme.kColorWhiteText,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 2.h),
              const PathsListViewCardWidget(
                type: "Frontend Development",
                pathModelsList:
                    PathsConstants.frontendDevelopmentPathModelsList,
              ),
              Divider(
                height: 6.h,
                thickness: 2,
              ),
              Text(
                "Backend Development",
                style: TextStyle(
                    color: AppColorTheme.kColorWhiteText,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 2.h),
              const PathsListViewCardWidget(
                type: "Backend Development",
                pathModelsList: PathsConstants.backendDevelopmentPathModelsList,
              ),
              SizedBox(height: 3.h),
            ],
          ),
        ),
      )),
    );
  }
}

class PathsListViewCardWidget extends StatelessWidget {
  final String type;
  final List<PathModel> pathModelsList;
  const PathsListViewCardWidget({
    Key? key,
    required this.type,
    required this.pathModelsList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44.h,
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(width: 5.w),
        scrollDirection: Axis.horizontal,
        itemCount: pathModelsList.length,
        itemBuilder: (context, index) => Stack(
          children: [
            Container(
              width: 80.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColorTheme.kColorGrey, width: 2),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 11.h,
                          width: 30.w,
                          child: Image.asset(pathModelsList[index].imageUrl),
                        ),
                        Text(
                          pathModelsList[index].currentLevel,
                          style: TextStyle(
                              color: AppColorTheme.kColorYellowPastel,
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 2),
                        )
                      ],
                    ),
                    SizedBox(height: 3.h),
                    Text(
                      "${pathModelsList[index].numberOfStages} STAGES • ${pathModelsList[index].numberOfLevels} LEVELS",
                      style: TextStyle(
                        color: AppColorTheme.kColorWhiteGrey.withOpacity(0.6),
                        fontSize: 10.sp,
                      ),
                    ),
                    SizedBox(height: 2.5.h),
                    Text(
                      pathModelsList[index].pathTitle,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: AppColorTheme.kColorWhiteText,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: 2.5.h),
                    Text(
                      pathModelsList[index].pathDescription,
                      style: TextStyle(
                        color: AppColorTheme.kColorWhiteGrey,
                        fontSize: 10.sp,
                      ),
                    ),
                    SizedBox(height: 2.5.h),
                    PopButton(
                      size: 10.sp,
                      color: AppColorTheme.kColorNotWhite,
                      onPressed: () async {
                        HapticFeedback.vibrate();
                      },
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 22.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "continue →",
                              style: TextStyle(
                                  color: AppColorTheme.kColorNotBlack,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (pathModelsList[index].pathTitle != "Flutter Development")
              Positioned.fill(
                child: ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.transparent.withOpacity(0.1)),
                      child: Center(
                        child: Text(
                          "coming soon",
                          style: TextStyle(
                            color: AppColorTheme.kColorYellowPastel,
                            fontSize: 11.sp,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
