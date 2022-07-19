// To parse this JSON data, do
//
//     final editProductModal = editProductModalFromJson(jsonString);

import 'dart:convert';

EditProductModal editProductModalFromJson(String str) => EditProductModal.fromJson(json.decode(str));

String editProductModalToJson(EditProductModal data) => json.encode(data.toJson());

class EditProductModal {
    EditProductModal({
        required this.success,
    });

    bool success;

    factory EditProductModal.fromJson(Map<String, dynamic> json) => EditProductModal(
        success: json["success"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
    };
}
