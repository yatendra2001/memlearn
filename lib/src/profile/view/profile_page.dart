import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:memcode/src/auth/view/welcome_page.dart';
import 'package:memcode/src/utils/asset_constants.dart';
import 'package:memcode/src/utils/theme_constants.dart';
import 'package:shake_flutter/shake_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    Shake.setUserFeedbackEnabled(true);
    Shake.setInvokeShakeOnShakeDeviceEvent(true);

    Shake.start(dotenv.env['shakeClientId']!, dotenv.env['shakeClientSecret']!);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 1.5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    kMemcodeLogoLight,
                    height: 6.h,
                  ),
                ),
                SizedBox(width: 2.w),
                Text(
                  "memcode",
                  style: TextStyle(
                      color: AppColorTheme.kColorWhiteText,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
            SizedBox(height: 1.5.h),
            Divider(height: 3.h),
            OutlinedButton(
              child: Text(
                "Report a problem",
                style: TextStyle(
                    color: AppColorTheme.kColorWhiteText,
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w900),
              ),
              onPressed: () {
                Shake.show();
              },
            ),
            SizedBox(height: 1.5.h),
            OutlinedButton(
              child: Text(
                "Log out",
                style: TextStyle(
                    color: AppColorTheme.kColorWhiteText,
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w900),
              ),
              onPressed: () async {
                await Supabase.instance.client.auth.signOut().then(
                      (value) => Navigator.of(context)
                          .pushNamed(WelcomePage.routeName),
                    );
              },
            ),
          ],
        ),
      ),
    );
  }
}
