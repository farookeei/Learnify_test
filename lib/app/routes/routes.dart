import 'package:flutter/material.dart';
import 'package:learnify_test/app/routes/splashscreen.dart';
import 'package:learnify_test/screen/loginScreen.dart';
import 'package:learnify_test/screen/otp_verify.dart';

class AppRouter {
  AppRouter();

  Route onGenerateRoute(RouteSettings settings) {
    var args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => const SplashScreen());

      case OTPVerifyScreen.routeName:
        return MaterialPageRoute(
            builder: (context) => OTPVerifyScreen(
                  phoneNumber: args == null ? "+91 9929292292" : args as String,
                ));

      case LoginScreen.routeName:
        return MaterialPageRoute(builder: (context) => const LoginScreen());

      default:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
    }
  }
}
