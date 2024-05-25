import 'package:flutter/material.dart';
import 'package:pkp/features/post/data/models/post_model.dart';
import 'package:pkp/features/post/presentation/pages/form_page.dart';
import 'package:pkp/features/post/presentation/pages/list_page.dart';
import 'package:pkp/shared/extensions/styles_extension.dart';
import 'package:pkp/shared/utils/helpers/screen_argument.dart';
import 'package:pkp/themes/app_text_style.dart';

class AppRoutes{
  static const listPage = "/";
  static const addPage = "/add";
  static const editPage = "/edit";

  static Route<dynamic>? onGenerateRoutes(RouteSettings settings){
    switch(settings.name){
      case listPage:
        return _pageRouteBuilder(page: const ListPage());
      case addPage:
        return _pageRouteBuilder(page: FormPage.add());
      case editPage:
        final args = settings.arguments as ScreenArgument<PostModel>;
        return _pageRouteBuilder(page: FormPage.edit(post: args.data,));
      default:
        return MaterialPageRoute(builder: (context){
          final colors = context.appColors;

          return Scaffold(
            body: Text(
              "No route defined for ${settings.name}",
              style: AppTypography.heading8.copyWith(color: colors.onBackground),
            ),
          );
        });
    }
  }

  static PageRouteBuilder<dynamic> _pageRouteBuilder({required Widget page}){
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return page;
        },
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        }
    );
  }
}