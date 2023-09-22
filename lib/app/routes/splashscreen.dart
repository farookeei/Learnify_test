import 'package:flutter/material.dart';

import '../../screen/loginScreen.dart';

class SplashScreen extends StatelessWidget {
  static const routName = "/splashscreen";

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LoginScreen();
  }
}
