// To parse this JSON data, do
//
//     final logoutModal = logoutModalFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

LogoutModal logoutModalFromJson(String str) => LogoutModal.fromJson(json.decode(str));

String logoutModalToJson(LogoutModal data) => json.encode(data.toJson());

class LogoutModal {
    LogoutModal({
        required this.admin,
    });

    bool admin;

    factory LogoutModal.fromJson(Map<String, dynamic> json) => LogoutModal(
        admin: json["admin"],
    );

    Map<String, dynamic> toJson() => {
        "admin": admin,
    };
}
