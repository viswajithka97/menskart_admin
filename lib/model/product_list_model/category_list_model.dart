// To parse this JSON data, do
//
//     final categoryListModel = categoryListModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

CategoryListModel categoryListModelFromJson(String str) => CategoryListModel.fromJson(json.decode(str));

String categoryListModelToJson(CategoryListModel data) => json.encode(data.toJson());

class CategoryListModel {
    CategoryListModel({
        required this.category,
        required this.admin,
    });

    List<Category> category;
    bool admin;

    factory CategoryListModel.fromJson(Map<String, dynamic> json) => CategoryListModel(
        category: List<Category>.from(json["category"].map((x) => Category.fromJson(x))),
        admin: json["admin"],
    );

    Map<String, dynamic> toJson() => {
        "category": List<dynamic>.from(category.map((x) => x.toJson())),
        "admin": admin,
    };
}

class Category {
    Category({
        required this.id,
        required this.brand,
        required this.category,
    });

    String id;
    String? brand;
    String category;

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["_id"],
        brand: json["brand"] == null ? null : json["brand"],
        category: json["category"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "brand": brand == null ? null : brand,
        "category": category,
    };
}
