// To parse this JSON data, do
//
//     final adminLoginModel = adminLoginModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

AdminLoginModel adminLoginModelFromJson(String str) => AdminLoginModel.fromJson(json.decode(str));

String adminLoginModelToJson(AdminLoginModel data) => json.encode(data.toJson());

class AdminLoginModel {
    AdminLoginModel({
        required this.login,
    });

    bool login;

    factory AdminLoginModel.fromJson(Map<String, dynamic> json) => AdminLoginModel(
        login: json["login"],
    );

    Map<String, dynamic> toJson() => {
        "login": login,
    };
}
