import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:memlearn/src/auth/view/auth_page.dart';
import 'package:memlearn/src/utils/asset_constants.dart';
import 'package:memlearn/src/utils/theme_constants.dart';
import 'package:memlearn/src/widgets/pop_button.dart';
import 'package:neopop/widgets/buttons/neopop_tilted_button/neopop_tilted_button.dart';
import 'package:sizer/sizer.dart';

class WelcomePage extends StatelessWidget {
  static const routeName = '/welcome-page';
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 10.h),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                kMemcodeLogoLight,
                height: 8.h,
              ),
            ),
            Lottie.asset(kOnboardingAnimation),
            SizedBox(height: 1.h),
            SizedBox(
              width: 100.w,
              child: Text(
                "best place to learn coding",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: AppColorTheme.kColorWhiteText,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(height: 2.h),
            Text(
              "effective, hands-on to help you learn programming faster and remember longer",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColorTheme.kColorWhiteText,
                fontSize: 11.sp,
              ),
            ),
            SizedBox(height: 5.h),
            NeoPopTiltedButton(
              onTapUp: () {
                HapticFeedback.vibrate();
                showModalBottomSheet(
                  context: context,
                  builder: (context) => const AuthPage(),
                  backgroundColor: AppColorTheme.kColorNotBlack,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                );
              },
              onTapDown: () => HapticFeedback.vibrate(),
              isFloating: true,
              decoration: NeoPopTiltedButtonDecoration(
                color: AppColorTheme.kColorNotWhite,
                plunkColor: AppColorTheme.kColorNotWhite,
                shadowColor: const Color.fromRGBO(36, 36, 36, 1),
                showShimmer: true,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
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
            )
          ],
        ),
      ),
    );
  }
}
