// To parse this JSON data, do
//
//     final adminLogoutModel = adminLogoutModelFromJson(jsonString);


import 'dart:convert';

AdminLogoutModel adminLogoutModelFromJson(String str) => AdminLogoutModel.fromJson(json.decode(str));

String adminLogoutModelToJson(AdminLogoutModel data) => json.encode(data.toJson());

class AdminLogoutModel {
    AdminLogoutModel({
        required this.login,
    });

    bool login;

    factory AdminLogoutModel.fromJson(Map<String, dynamic> json) => AdminLogoutModel(
        login: json["login"],
    );

    Map<String, dynamic> toJson() => {
        "login": login,
    };
}
