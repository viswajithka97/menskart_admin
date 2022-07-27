
import 'dart:convert';

AddCategoryModel addCategoryModelFromJson(String str) => AddCategoryModel.fromJson(json.decode(str));

String addCategoryModelToJson(AddCategoryModel data) => json.encode(data.toJson());

class AddCategoryModel {
    AddCategoryModel({
        required this.admin,
    });

    bool admin;

    factory AddCategoryModel.fromJson(Map<String, dynamic> json) => AddCategoryModel(
        admin: json["admin"],
    );

    Map<String, dynamic> toJson() => {
        "admin": admin,
    };
}
