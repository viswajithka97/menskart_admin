// To parse this JSON data, do
//
//     final addProductModel = addProductModelFromJson(jsonString);

import 'dart:convert';

AddProductModel addProductModelFromJson(String str) => AddProductModel.fromJson(json.decode(str));

String addProductModelToJson(AddProductModel data) => json.encode(data.toJson());

class AddProductModel {
    AddProductModel({
        required this.success,
    });

    bool success;

    factory AddProductModel.fromJson(Map<String, dynamic> json) => AddProductModel(
        success: json["success"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
    };
}
