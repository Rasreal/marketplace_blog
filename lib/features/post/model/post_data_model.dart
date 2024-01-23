
import 'dart:convert';

PostDataModel postDataModelFromJson(String str) => PostDataModel.fromJson(json.decode(str));

String postDataModelToJson(PostDataModel data) => json.encode(data.toJson());

class PostDataModel {
  int userId;
  int id;
  String title;
  String body;

  PostDataModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory PostDataModel.fromJson(Map<String, dynamic> json) => PostDataModel(
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
