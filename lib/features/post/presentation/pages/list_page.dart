import 'package:card_loading/card_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ionicons/ionicons.dart';
import 'package:pkp/features/post/presentation/bloc/post_bloc.dart';
import 'package:pkp/features/post/presentation/widgets/post_card.dart';
import 'package:pkp/injector.dart';
import 'package:pkp/shared/extensions/styles_extension.dart';
import 'package:pkp/shared/utils/routes/app_routes.dart';
import 'package:pkp/themes/app_text_style.dart';

class ListPage extends StatelessWidget{
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: injector<PostBloc>()..add(FetchAllPost()),
      child: Scaffold(
        body: _body(context),
        floatingActionButton: _addButton(context),
      ),
    );
  }

  Widget _body(BuildContext context){
    return SafeArea(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: BlocBuilder<PostBloc, PostState>(
          builder: (context, state){
            final colors = context.appColors;

            if(state.status == PostStatus.loadingRead){
              return ListView.builder(
                itemCount: 10,
                physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                itemBuilder: (context, index){
                  return Padding(
                    padding: EdgeInsets.only(bottom: 8.h),
                    child: CardLoading(height: 144.h, width: double.infinity, borderRadius: BorderRadius.circular(10),),
                  );
                },
              );
            }

            if(state.status == PostStatus.errorRead){
              return Center(
                child: Text(
                  "Error: ${state.errorMsg}",
                  style: AppTypography.heading8.copyWith(color: colors.onBackground),
                ),
              );
            }

            if(state.posts.isEmpty){
              return Center(
                child: Text(
                  "No Post Found",
                  style: AppTypography.heading8.copyWith(color: colors.onBackground),
                ),
              );
            }

            return RefreshIndicator(
              onRefresh: () async => injector<PostBloc>().add(FetchAllPost()),
              child: ListView.builder(
                physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                itemCount: state.posts.length,
                itemBuilder: (context, index){
                  return PostCard(post: state.posts[index]);
                },
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _addButton(BuildContext context){
    return FloatingActionButton(
      onPressed: () => Navigator.pushNamed(context, AppRoutes.addPage),
      child: const Icon(Ionicons.add),
    );
  }
}