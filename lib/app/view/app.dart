import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../themes/theme.dart';
import '../routes/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppView();
  }
}

class AppView extends StatefulWidget {
  AppView({
    Key? key,
  }) : super(key: key);

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  // final themeController = Get.put(ThemeController());

  late final _router;

  @override
  void initState() {
    _router = AppRouter();

    super.initState();
  }

  @override
  void dispose() {
    _router.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        splitScreenMode: true,
        minTextAdapt: true,
        designSize: const Size(360, 800),
        builder: (ctx, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: Themes.lightTheme,
            // themeMode: themeController.theme,
            // darkTheme: Themes.darkTheme,
            title: 'Learnify App',
            onGenerateRoute: _router.onGenerateRoute,
          );
        });
  }
}
