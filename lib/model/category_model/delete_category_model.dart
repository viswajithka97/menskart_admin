// To parse this JSON data, do
//
//     final deleteCategoryModel = deleteCategoryModelFromJson(jsonString);

import 'dart:convert';

DeleteCategoryModel deleteCategoryModelFromJson(String str) =>
    DeleteCategoryModel.fromJson(json.decode(str));

String deleteCategoryModelToJson(DeleteCategoryModel data) =>
    json.encode(data.toJson());

class DeleteCategoryModel {
  DeleteCategoryModel({
    required this.success,
  });

  bool success;

  factory DeleteCategoryModel.fromJson(Map<String, dynamic> json) =>
      DeleteCategoryModel(
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
      };
}
