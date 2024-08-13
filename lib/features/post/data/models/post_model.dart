import '../../domain/entities/post_entitiy.dart';

class PostModel extends PostEntity {
  final int id;
  final int userId;
  PostModel({
    required this.id,
    required this.userId,
    required super.title,
    required super.body,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'],
      userId: json['userId'],
      title: json['title'],
      body: json['body'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'title': title,
      'body': body,
    };
  }
}
