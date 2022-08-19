
import 'dart:convert';

DashBoardModel dashBoardModelFromJson(String str) => DashBoardModel.fromJson(json.decode(str));

String dashBoardModelToJson(DashBoardModel data) => json.encode(data.toJson());

class DashBoardModel {
    DashBoardModel({
        required this.total,
        required this.totalSales,
        required this.totalProfit,
        required this.users,
        required this.admin,
    });

    Total total;
    Total totalSales;
    TotalProfit totalProfit;
    Total users;
    bool admin;

    factory DashBoardModel.fromJson(Map<String, dynamic> json) => DashBoardModel(
        total: Total.fromJson(json["total"]),
        totalSales: Total.fromJson(json["totalSales"]),
        totalProfit: TotalProfit.fromJson(json["totalProfit"]),
        users: Total.fromJson(json["users"]),
        admin: json["admin"],
    );

    Map<String, dynamic> toJson() => {
        "total": total.toJson(),
        "totalSales": totalSales.toJson(),
        "totalProfit": totalProfit.toJson(),
        "users": users.toJson(),
        "admin": admin,
    };
}

class Total {
    Total({
        required this.count,
    });

    int count;

    factory Total.fromJson(Map<String, dynamic> json) => Total(
        count: json["count"],
    );

    Map<String, dynamic> toJson() => {
        "count": count,
    };
}

class TotalProfit {
    TotalProfit({
        required this.total,
    });

    int total;

    factory TotalProfit.fromJson(Map<String, dynamic> json) => TotalProfit(
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "total": total,
    };
}
