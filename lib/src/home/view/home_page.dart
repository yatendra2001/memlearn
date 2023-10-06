import 'package:flutter/material.dart';
import 'package:memcode/src/utils/theme_constants.dart';
import 'package:memcode/src/widgets/pop_button.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home-page';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Supabase.instance.client.auth.signOut();
    return PopButton(
      size: 5.sp,
      radius: 100,
      color: Colors.green,
      onPressed: () {
        // Navigator.of(context).pop();
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Icon(
          Icons.star,
          color: AppColorTheme.kColorNotWhite,
          size: 35.sp,
        ),
      ),
    );
  }
}
