import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pinput/pinput.dart';

import '../layout/layout_scaffold.dart';
import '../themes/color_variables.dart';
import '../widgets/buttons/button.dart';
import '../widgets/forms/input_fields.dart';
import '../widgets/snack_bar/custom_snackbar.dart';

class OTPVerifyScreen extends StatelessWidget {
  static const routeName = "/otp-verify";

  final String? phoneNumber;

  OTPVerifyScreen({this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 65.w,
      height: 50.h,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Colors.black,
      ),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade400),
      ),
    );
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
                "OTP Verify",
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
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "OTP Sent to\n",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  TextSpan(
                    text: phoneNumber,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Pinput(
              length: 4,
              defaultPinTheme: defaultPinTheme,
              focusedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  border: Border.all(color: Colors.green),
                ),
              ),
              onCompleted: (pin) => debugPrint(pin),
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomButton(
              align: Alignment.center,
              onTap: () {
                customSnackBar(
                    context: context,
                    snackBarType: SnackBarType.success,
                    title: "Your details has been submitted");
              },
              radius: 30,
              width: 300.w,
              backgroundColor: ReplyColors.red100,
              child: Text(
                "Verify OTP",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Colors.white, fontWeight: FontWeight.w600),
              ),
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
