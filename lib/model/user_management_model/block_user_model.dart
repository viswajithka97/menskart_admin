// To parse this JSON data, do
//
//     final blockUserModel = blockUserModelFromJson(jsonString);

import 'dart:convert';

BlockUserModel blockUserModelFromJson(String str) => BlockUserModel.fromJson(json.decode(str));

String blockUserModelToJson(BlockUserModel data) => json.encode(data.toJson());

class BlockUserModel {
    BlockUserModel({
        required this.success,
    });

    bool success;

    factory BlockUserModel.fromJson(Map<String, dynamic> json) => BlockUserModel(
        success: json["success"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
    };
}
