
import 'dart:convert';

UpdateCategoryModel updateCategoryModelFromJson(String str) => UpdateCategoryModel.fromJson(json.decode(str));

String updateCategoryModelToJson(UpdateCategoryModel data) => json.encode(data.toJson());

class UpdateCategoryModel {
    UpdateCategoryModel({
        required this.admin,
    });

    bool admin;

    factory UpdateCategoryModel.fromJson(Map<String, dynamic> json) => UpdateCategoryModel(
        admin: json["admin"],
    );

    Map<String, dynamic> toJson() => {
        "admin": admin,
    };
}
