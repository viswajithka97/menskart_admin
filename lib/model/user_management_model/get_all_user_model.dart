// To parse this JSON data, do
//
//     final getAllUsersModel = getAllUsersModelFromJson(jsonString);

import 'dart:convert';

GetAllUsersModel getAllUsersModelFromJson(String str) =>
    GetAllUsersModel.fromJson(json.decode(str));

String getAllUsersModelToJson(GetAllUsersModel data) =>
    json.encode(data.toJson());

class GetAllUsersModel {
  GetAllUsersModel({
    required this.users,
    required this.admin,
  });

  List<User> users;
  bool admin;

  factory GetAllUsersModel.fromJson(Map<String, dynamic> json) =>
      GetAllUsersModel(
        users: List<User>.from(json["users"].map((x) => User.fromJson(x))),
        admin: json["admin"],
      );

  Map<String, dynamic> toJson() => {
        "users": List<dynamic>.from(users.map((x) => x.toJson())),
        "admin": admin,
      };
}

class User {
  User({
    required this.id,
    required this.referedCode,
    required this.name,
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.wallet,
    required this.referel,
    required this.address,
    required this.profile,
    required this.userBlock,
    required this.conformPassword,
  });

  String id;
  String? referedCode;
  String name;
  String email;
  String password;
  String phoneNumber;
  int? wallet;
  String? referel;
  List<Address>? address;
  bool? profile;
  bool? userBlock;
  String? conformPassword;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        referedCode: json["referedCode"] == null ? null : json["referedCode"],
        name: json["name"],
        email: json["email"],
        password: json["password"],
        phoneNumber: json["phoneNumber"],
        wallet: json["Wallet"] == null ? null : json["Wallet"],
        referel: json["referel"] == null ? null : json["referel"],
        address: json["Address"] == null
            ? null
            : List<Address>.from(
                json["Address"].map((x) => Address.fromJson(x))),
        profile: json["profile"] == null ? null : json["profile"],
        userBlock: json["userBlock"] == null ? null : json["userBlock"],
        conformPassword:
            json["conformPassword"] == null ? null : json["conformPassword"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "referedCode": referedCode == null ? null : referedCode,
        "name": name,
        "email": email,
        "password": password,
        "phoneNumber": phoneNumber,
        "Wallet": wallet == null ? null : wallet,
        "referel": referel == null ? null : referel,
        "Address": address == null
            ? null
            : List<dynamic>.from(address!.map((x) => x.toJson())),
        "profile": profile == null ? null : profile,
        "userBlock": userBlock == null ? null : userBlock,
        "conformPassword": conformPassword == null ? null : conformPassword,
      };
}

class Address {
  Address({
    required this.useraddress,
    required this.name,
    required this.phoneNumber,
    required this.state,
    required this.pincode,
    required this.house,
    required this.city,
    required this.home,
    required this.address,
  });

  String useraddress;
  String name;
  String phoneNumber;
  String state;
  String pincode;
  dynamic house;
  String city;
  String home;
  String address;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        useraddress: json["Useraddress"],
        name: json["name"],
        phoneNumber: json["phoneNumber"],
        state: json["state"],
        pincode: json["pincode"],
        house: json["house"],
        city: json["city"],
        home: json["home"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "Useraddress": useraddress,
        "name": name,
        "phoneNumber": phoneNumber,
        "state": state,
        "pincode": pincode,
        "house": house,
        "city": city,
        "home": home,
        "address": address,
      };
}
