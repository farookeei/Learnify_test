import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learnify_test/layout/layout_scaffold.dart';
import 'package:learnify_test/screen/otp_verify.dart';
import 'package:learnify_test/themes/color_variables.dart';
import 'package:learnify_test/widgets/buttons/button.dart';

import '../widgets/forms/input_fields.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = "/login";

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String? _phoneNumber = "";
    String? _countryCode = "+91";
    return LayoutScaffold(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20.h,
            ),
            Center(
              child: Text(
                "Login",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontWeight: FontWeight.w600),
              ),
            ),
            SvgPicture.asset(
              "assets/images/login.svg",
              height: 340.h,
              width: 340.w,
            ),
            SizedBox(
              height: 50.h,
            ),
            CustomPhoneField(
              width: 300.w,
              variant: Variant.outlined,
              onChanged: (e) {
                // if (e != null && e.nsn.isNotEmpty) {
                _phoneNumber = e!.nsn;
                _countryCode = "+${e.countryCode}";

                //   }
              },
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomButton(
              align: Alignment.center,
              onTap: () {
                Navigator.pushNamed(context, OTPVerifyScreen.routeName,
                    arguments: _phoneNumber!.isEmpty
                        ? null
                        : "$_countryCode $_phoneNumber");
              },
              radius: 30,
              width: 300.w,
              child: Text(
                "Get OTP",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Colors.white, fontWeight: FontWeight.w600),
              ),
              backgroundColor: ReplyColors.red100,
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              "By signing up, you agree with our Terms and conditions",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            )
          ],
        ),
      ),
    );
  }
}
