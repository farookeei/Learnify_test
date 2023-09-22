import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnify_test/themes/color_variables.dart';

enum SnackBarType {
  success,
  error,
  warning,
  info,
  custom,
}

void customSnackBar({
  required final BuildContext context,
  final Color? bgColor,
  final Color? foregroundColor,
  required final SnackBarType snackBarType,
  required final String title,
  final String? text,
  final IconData? icon,
  final Widget? iconWidget,
  final int duration = 3,
}) {
  print('Snackbar used');
  showFlash(
    context: context,
    duration: Duration(seconds: duration),
    builder: (context, controller) {
      return Flash(
        controller: controller,
        behavior: FlashBehavior.floating,
        position: FlashPosition.top,
        boxShadows: kElevationToShadow[5],
        horizontalDismissDirection: HorizontalDismissDirection.horizontal,
        backgroundColor: ReplyColors.greenLight,
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        margin: EdgeInsets.symmetric(horizontal: 12),
        child: FlashBar(
          icon: iconWidget,
          title: Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                      child: Text(title,
                          style: Theme.of(context).textTheme.labelLarge)),
                  InkWell(
                    child: Icon(
                      Icons.close,
                      color: ReplyColors.neutralBold,
                      size: 20.r,
                    ),
                    onTap: () {
                      controller.dismiss();
                    },
                  )
                ],
              )),
          content: text == null
              ? const SizedBox()
              : Text(text, style: Theme.of(context).textTheme.bodyMedium),
        ),
      );
    },
  );
}
