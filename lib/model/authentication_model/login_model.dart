// To parse this JSON data, do
//
//     final adminLoginModel = adminLoginModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

AdminLoginModel adminLoginModelFromJson(String str) => AdminLoginModel.fromJson(json.decode(str));

String adminLoginModelToJson(AdminLoginModel data) => json.encode(data.toJson());

class AdminLoginModel {
    AdminLoginModel({
        required this.loggin,
    });

    bool loggin;

    factory AdminLoginModel.fromJson(Map<String, dynamic> json) => AdminLoginModel(
        loggin: json["loggin"],
    );

    Map<String, dynamic> toJson() => {
        "loggin": loggin,
    };
}
