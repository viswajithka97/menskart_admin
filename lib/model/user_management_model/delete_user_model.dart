// To parse this JSON data, do
//
//     final deleteUserModel = deleteUserModelFromJson(jsonString);

import 'dart:convert';

DeleteUserModel deleteUserModelFromJson(String str) => DeleteUserModel.fromJson(json.decode(str));

String deleteUserModelToJson(DeleteUserModel data) => json.encode(data.toJson());

class DeleteUserModel {
    DeleteUserModel({
        required this.success,
    });

    bool success;

    factory DeleteUserModel.fromJson(Map<String, dynamic> json) => DeleteUserModel(
        success: json["success"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
    };
}
