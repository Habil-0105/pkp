import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:pkp/features/post/data/models/post_model.dart';
import 'package:pkp/features/post/presentation/bloc/post_bloc.dart';
import 'package:pkp/injector.dart';
import 'package:pkp/shared/extensions/styles_extension.dart';
import 'package:pkp/shared/utils/helpers/screen_argument.dart';
import 'package:pkp/shared/utils/routes/app_routes.dart';
import 'package:pkp/shared/widgets/button.dart';
import 'package:pkp/themes/app_text_style.dart';

class PostCard extends StatelessWidget{
  const PostCard({super.key, required this.post});
  final PostModel post;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              post.title,
              style: AppTypography.heading5,
            ),
            Text(
              post.body,
              style: AppTypography.bodyText1,
            ),
            Gap(4.h),
            Divider(
              color: colors.onBackground.withOpacity(0.2),
            ),
            Gap(4.h),
            Row(
              children: [
                Expanded(
                  child: Button(
                      text: "Delete",
                      color: colors.error,
                      textColor: colors.onError,
                      onPressed: () => injector<PostBloc>().add(DeletePost(post: post))
                  ),
                ),
                Gap(6.w),
                Expanded(
                  child: Button(
                      text: "Edit",
                      onPressed: () => Navigator.pushNamed(context, AppRoutes.editPage, arguments: ScreenArgument<PostModel>(post))
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}