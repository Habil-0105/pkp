import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:pkp/shared/extensions/styles_extension.dart';

class LoadingButton extends StatelessWidget{
  const LoadingButton({
    super.key,
    this.radius = 10.0,
    this.color,
    this.height
  });

  final double radius;
  final Color? color;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return SizedBox(
      width: double.infinity,
      height: height ?? 40.h,
      child: OutlinedButton(
        onPressed: null,
        style: ButtonStyle(
            side: MaterialStateProperty.all(BorderSide(
              color: color ?? colors.primary,
              width: 1,
            )),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  radius,
                ),
              ),
            )
        ),
        child: Center(
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: LoadingAnimationWidget.prograssiveDots(color: color ?? colors.primary, size: 20.r),
          ),
        ),
      ),
    );
  }
}