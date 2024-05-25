import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:pkp/shared/extensions/styles_extension.dart';
import 'package:pkp/themes/app_text_style.dart';

class TextInput extends StatefulWidget {
  final String hintText;
  final String labelText;
  final TextEditingController controller;
  final int? maxLines;
  final String? Function(String?)? validator;

  const TextInput({
    Key? key,
    required this.hintText,
    required this.labelText,
    required this.controller,
    this.maxLines,
    this.validator
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelText != '') ...[
          Text(
            widget.labelText,
            style: AppTypography.labelText1,
          ),
        ],
        Gap(4.h),
        TextFormField(
          controller: widget.controller,
          keyboardType: widget.maxLines == null ? TextInputType.text : TextInputType.multiline,
          style: AppTypography.caption1.copyWith(color: colors.onBackground),
          autocorrect: false,
          maxLines: widget.maxLines ?? 1,
          validator: widget.validator,
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.always,
            isDense: true,
            filled: true,
            fillColor: colors.background,
            hintText: widget.hintText,
            hintStyle: AppTypography.caption1,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: colors.onBackground,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: colors.primary,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: colors.onBackground,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
