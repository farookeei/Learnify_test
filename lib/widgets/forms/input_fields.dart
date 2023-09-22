// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:phone_form_field/phone_form_field.dart';

import '../../themes/color_variables.dart';

enum InputType { text, phone, email, password, number, url, address, multiline }

enum Variant { filled, outlined }

class CustomLabel extends StatelessWidget {
  final String label;
  final Color labeColor;
  const CustomLabel(
      {Key? key, required this.label, this.labeColor = ReplyColors.neutralBold})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: Theme.of(context)
          .textTheme
          .labelLarge!
          .copyWith(color: labeColor, fontWeight: FontWeight.w500),
    );
  }
}

class CustomPhoneField extends StatelessWidget {
  final bool focus;
  final Color labelColor;
  final Color inputColor;
  final Color fillColor;
  final Color borderColor;
  final String? initialphoneNumber;
  final PhoneController? controller;
  final double? width;
  final Variant variant;
  final String? Function(PhoneNumber?)? validator;

  final FocusNode? focusNode;
  final AutovalidateMode autovalidateMode;
  final TextInputAction? textInputAction;
  final Function(PhoneNumber?)? onChanged;
  final Function(String)? onSubmitted;
  final bool enabled;
  final bool? filled;
  final TextStyle? hintStyle;

  final TextStyle? style;
  const CustomPhoneField({
    Key? key,
    this.focus = false,
    this.onSubmitted,
    this.controller,
    this.validator,
    this.width,
    this.initialphoneNumber,
    this.labelColor = ReplyColors.neutralBold,
    this.inputColor = ReplyColors.neutralBold,
    this.fillColor = ReplyColors.neutralLight,
    this.borderColor = ReplyColors.neutral50,
    this.textInputAction,
    this.autovalidateMode = AutovalidateMode.disabled,
    required this.variant,
    this.onChanged,
    this.focusNode,
    this.enabled = true,
    this.filled,
    this.hintStyle,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // CustomLabel(
        //   label: 'Phone number',
        //   labeColor: labelColor,
        // ),
        const SizedBox(height: 8),
        Container(
          width: width,
          // height: FormConstant.height,
          constraints: BoxConstraints(
            minWidth: 51.h,
          ),
          child: PhoneFormField(
            focusNode: focusNode, onSubmitted: onSubmitted,
            key: const Key('phone-field'),
            controller: controller,
            shouldFormat: true,
            countryCodeStyle: TextStyle(
              color: enabled ? inputColor : ReplyColors.neutral50,
              decoration: TextDecoration.none,
              fontSize: 16.sp,
            ),
            // favorites: const ['IN'],
            defaultCountry: IsoCode.IN,
            style: style ??
                TextStyle(
                  color: enabled ? inputColor : ReplyColors.neutral50,
                  decoration: TextDecoration.none,
                  fontSize: 16.sp,
                ),
            cursorColor: variant == Variant.filled ? inputColor : null,
            cursorWidth: 1.0,
            decoration: InputDecoration(
              isDense: true,
              // contentPadding:
              //     returnResponsiveChild(context, null, EdgeInsets.all(12.w)),
              errorStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: ReplyColors.red25,
                  ),
              filled: filled ?? variant == Variant.filled ? true : false,
              fillColor: fillColor,
              border: const OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: variant == Variant.filled
                    ? BorderSide.none
                    : BorderSide(
                        width: 1.5,
                        color: enabled ? borderColor : ReplyColors.neutral25),
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide:
                      //variant == Variant.filled
                      //?
                      BorderSide(width: 1.5, color: borderColor)
                  // : const BorderSide(
                  //     width: 1.5, color: FormConstant.focusField),
                  ),
              // errorBorder: OutlineInputBorder(
              //     borderRadius:
              //         BorderRadius.circular(FormConstant.borderRadius),
              //     borderSide: const BorderSide(
              //         width: 1.5, color: FormConstant.errorField)),
              hintText: 'Phone number',
              hintStyle: hintStyle ??
                  TextStyle(
                      color: inputColor.withOpacity(0.5), fontSize: 16.sp),
            ),
            // validator: validator ?? Validators.phonenumberValidators(),
            countrySelectorNavigator:
                const CountrySelectorNavigator.draggableBottomSheet(),
            showFlagInInput: true,
            flagSize: 16,
            autofillHints: const [AutofillHints.telephoneNumber],
            enabled: enabled,
            autofocus: focus,
            initialValue: initialphoneNumber != null
                ? PhoneNumber(isoCode: IsoCode.IN, nsn: initialphoneNumber!)
                : null,

            textInputAction: textInputAction,
            autovalidateMode: autovalidateMode,
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
