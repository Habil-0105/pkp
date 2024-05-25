import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pkp/shared/extensions/styles_extension.dart';
import 'package:pkp/themes/app_text_style.dart';

class Button extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? color;
  final Color? textColor;
  final double radius;
  final double? height;

  const Button({
    super.key,
    required this.text,
    required this.onPressed,
    this.color,
    this.textColor,
    this.radius = 10,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return SizedBox(
      width: double.infinity,
      height: height ?? 40.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(color ?? colors.primary),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  radius,
                ),
              ),
            ),
            padding: height == null ? null : MaterialStateProperty.all<EdgeInsets>(
              EdgeInsets.zero,
            )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: AppTypography.labelButton2.copyWith(color: textColor ?? colors.onPrimary),
            ),
          ],
        ),
      ),
    );
  }
}