// To parse this JSON data, do
//
//     final productListModel = productListModelFromJson(jsonString);

import 'dart:convert';

ProductListModel productListModelFromJson(String str) => ProductListModel.fromJson(json.decode(str));

String productListModelToJson(ProductListModel data) => json.encode(data.toJson());

class ProductListModel {
    ProductListModel({
        required this.products,
        required this.admin,
    });

    List<Product> products;
    bool admin;

    factory ProductListModel.fromJson(Map<String, dynamic> json) => ProductListModel(
        products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
        admin: json["admin"],
    );

    Map<String, dynamic> toJson() => {
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
        "admin": admin,
    };
}

class Product {
    Product({
        required this.id,
        required this.category,
        required this.brand,
        required this.description,
        required this.orginalPrice,
        required this.offerpercentage,
        required this.offerPrice,
    });

    String id;
    Category? category;
    String brand;
    String description;
    String orginalPrice;
    String offerpercentage;
    int? offerPrice;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["_id"],
        category: json["category"] == null ? null : categoryValues.map[json["category"]],
        brand: json["brand"] == null ? null : json["brand"],
        description: json["description"] == null ? null : json["description"],
        orginalPrice: json["orginalPrice"] == null ? null : json["orginalPrice"],
        offerpercentage: json["offerpercentage"] == null ? null : json["offerpercentage"],
        offerPrice: json["offerPrice"] == null ? null : json["offerPrice"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "category": category == null ? null : categoryValues.reverse[category],
        "brand": brand == null ? null : brand,
        "description": description == null ? null : description,
        "orginalPrice": orginalPrice == null ? null : orginalPrice,
        "offerpercentage": offerpercentage == null ? null : offerpercentage,
        "offerPrice": offerPrice == null ? null : offerPrice,
    };
}

enum Category { SHIRT, JEANS, T_SHIRTS, SHOES, CATEGORY_SHIRT }

final categoryValues = EnumValues({
    "Shirt": Category.CATEGORY_SHIRT,
    "Jeans": Category.JEANS,
    " Shirt": Category.SHIRT,
    "shoes": Category.SHOES,
    "T-shirts": Category.T_SHIRTS
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String>? reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap ??= map.map((k, v) =>  MapEntry(v, k));
        return reverseMap!;
    }
}
