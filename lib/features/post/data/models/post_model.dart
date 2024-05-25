import 'package:pkp/features/post/domain/entities/post.dart';

class PostModel extends Post{
  PostModel({required super.userId, required super.id, required super.title, required super.body});

  PostModel copyWith({
    int? userId,
    int? id,
    String? title,
    String? body,
  }) =>
      PostModel(
        userId: userId ?? this.userId,
        id: id ?? this.id,
        title: title ?? this.title,
        body: body ?? this.body,
      );

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    body: json["body"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
    "body": body,
  };
}