import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:memlearn/src/auth/view/auth_page.dart';
import 'package:memlearn/src/auth/view/welcome_page.dart';
import 'package:memlearn/src/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:memlearn/src/splash/view/splash_page.dart';
import 'package:memlearn/src/theme_data.dart';
import 'package:sizer/sizer.dart';

class MemLearn extends StatelessWidget {
  const MemLearn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, oritentation, deviceType) {
      return MaterialApp(
        restorationScopeId: 'app',
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', ''), // English, no country code
        ],
        onGenerateTitle: (BuildContext context) =>
            AppLocalizations.of(context)!.appTitle,
        theme: memlearnTheme(),
        onGenerateRoute: (RouteSettings routeSettings) {
          return MaterialPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) {
              switch (routeSettings.name) {
                case WelcomePage.routeName:
                  return const WelcomePage();
                case AuthPage.routeName:
                  return const AuthPage();
                case BottomNavBar.routeName:
                  return const BottomNavBar();
                default:
                  return const SplashPage();
              }
            },
          );
        },
      );
    });
  }
}
