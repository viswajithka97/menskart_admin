// To parse this JSON data, do
//
//     final deleteProductModel = deleteProductModelFromJson(jsonString);

import 'dart:convert';

DeleteProductModel deleteProductModelFromJson(String str) => DeleteProductModel.fromJson(json.decode(str));

String deleteProductModelToJson(DeleteProductModel data) => json.encode(data.toJson());

class DeleteProductModel {
    DeleteProductModel({
        required this.success,
    });

    bool success;

    factory DeleteProductModel.fromJson(Map<String, dynamic> json) => DeleteProductModel(
        success: json["success"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
    };
}
