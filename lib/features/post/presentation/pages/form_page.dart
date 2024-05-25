// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_validator/form_validator.dart';
import 'package:gap/gap.dart';
import 'package:pkp/features/post/data/models/post_model.dart';
import 'package:pkp/features/post/presentation/bloc/post_bloc.dart';
import 'package:pkp/injector.dart';
import 'package:pkp/shared/widgets/button.dart';
import 'package:pkp/shared/widgets/loading_button.dart';
import 'package:pkp/shared/widgets/text_input.dart';
import 'package:pkp/themes/app_text_style.dart';

class FormPage extends StatefulWidget{
  FormPage.add({
    super.key,
    this.isAdd = true
  });

  FormPage.edit({
    super.key,
    this.isAdd = false,
    required this.post
  });

  final bool isAdd;
  PostModel? post;

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  late TextEditingController _title;
  late TextEditingController _body;
  final GlobalKey<FormState> _form = GlobalKey<FormState>();

  @override
  void initState() {
    if(widget.post == null){
      _title = TextEditingController();
      _body = TextEditingController();
    }else{
      _title = TextEditingController(text: widget.post!.title);
      _body = TextEditingController(text: widget.post!.body);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _formBody(context),
    );
  }

  AppBar _appBar(){
    return AppBar(
      title: Text(
        widget.isAdd ? "Add" : "Edit",
        style: AppTypography.heading5,
      ),
      centerTitle: true,
    );
  }

  Widget _formBody(BuildContext context){
    return SafeArea(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16.h),
        child: Column(
          children: [
            _formFields(),
            _formButton()
          ],
        ),
      ),
    );
  }

  Widget _formFields(){
    return Expanded(
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Form(
          key: _form,
          child: ListView(
            physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            children: [
              Gap(12.h),
              TextInput(
                labelText: 'Title',
                hintText: 'Enter your title here',
                controller: _title,
                validator: ValidationBuilder().build(),
              ),
              Gap(20.h),
              TextInput(
                labelText: 'Body',
                hintText: 'Enter your body here',
                controller: _body,
                maxLines: 6,
                validator: ValidationBuilder().build(),
              )
            ],
          ),
        ),
      )
    );
  }

  Widget _formButton(){
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: BlocConsumer<PostBloc, PostState>(
        listener: (context, state){
          if(state.status == PostStatus.create || state.status == PostStatus.update){
            injector<PostBloc>().add(FetchAllPost());
          }

          if(state.status == PostStatus.read){
            Navigator.pop(context);
          }
        },
        builder: (context, state){
          if(state.status == PostStatus.loadingUpdate || state.status == PostStatus.loadingCreate || state.status == PostStatus.loadingRead){
            return const LoadingButton();
          }

          return Button(
              text: widget.isAdd ? "Add Post" : "Edit Post",
              onPressed: (){
                if(_form.currentState!.validate()){
                  if(widget.isAdd){
                    injector<PostBloc>().add(CreatePost(title: _title.text, body: _body.text));
                  }else{
                    if(_title.text == widget.post!.title && _body.text == widget.post!.body){
                      Navigator.pop(context);
                      return;
                    }

                    PostModel post = PostModel(
                        userId: widget.post!.userId,
                        id: widget.post!.id,
                        title: _title.text,
                        body: _body.text
                    );

                    injector<PostBloc>().add(UpdatePost(post: post));
                  }
                }
              }
          );
        },
      ),
    );
  }
}