import 'dart:convert';

GetAllOrdersModel getAllOrdersModelFromJson(String str) =>
    GetAllOrdersModel.fromJson(json.decode(str));

String getAllOrdersModelToJson(GetAllOrdersModel data) =>
    json.encode(data.toJson());

class GetAllOrdersModel {
  GetAllOrdersModel({
    required this.orders,
    required this.admin,
  });

  List<Order> orders;
  bool admin;

  factory GetAllOrdersModel.fromJson(Map<String, dynamic> json) =>
      GetAllOrdersModel(
        orders: List<Order>.from(json["orders"].map((x) => Order.fromJson(x))),
        admin: json["admin"],
      );

  Map<String, dynamic> toJson() => {
        "orders": List<dynamic>.from(orders.map((x) => x.toJson())),
        "admin": admin,
      };
}

class Order {
  Order({
    required this.id,
    required this.deliveryDetails,
    required this.userId,
    required this.user,
    required this.paymentMethode,
    required this.products,
    required this.totalAmount,
    required this.status,
    required this.payment,
    required this.date,
    required this.orderDate,
    required this.canceled,
    required this.arriving,
    required this.order,
    required this.shipped,
    required this.delived,
  });

  String id;
  DeliveryDetails? deliveryDetails;
  String userId;
  String? user;
  String paymentMethode;
  List<Product>? products;
  dynamic totalAmount;
  String status;
  String payment;
  DateTime date;
  String orderDate;
  bool? canceled;
  bool? arriving;
  bool? order;
  bool? shipped;
  bool? delived;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["_id"],
        deliveryDetails: DeliveryDetails.fromJson(json["deliveryDetails"]),
        userId: json["userId"],
        user: json["user"] == null ? null : json["user"],
        paymentMethode: json["paymentMethode"],
        products: json["products"] == null
            ? null
            : List<Product>.from(
                json["products"].map((x) => Product.fromJson(x))),
        totalAmount: json["totalAmount"],
        status: json["status"],
        payment: json["payment"],
        date: DateTime.parse(json["Date"]),
        orderDate: json["date"],
        canceled: json["canceled"] == null ? null : json["canceled"],
        arriving: json["Arriving"] == null ? null : json["Arriving"],
        order: json["order"] == null ? null : json["order"],
        shipped: json["shipped"] == null ? null : json["shipped"],
        delived: json["Delived"] == null ? null : json["Delived"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "deliveryDetails": deliveryDetails!.toJson(),
        "userId": userId,
        "user": user == null ? null : user,
        "paymentMethode": paymentMethode,
        "products": products == null
            ? null
            : List<dynamic>.from(products!.map((x) => x.toJson())),
        "totalAmount": totalAmount,
        "status": status,
        "payment": payment,
        "Date": date.toIso8601String(),
        "date": orderDate,
        "canceled": canceled == null ? null : canceled,
        "Arriving": arriving == null ? null : arriving,
        "order": order == null ? null : order,
        "shipped": shipped == null ? null : shipped,
        "Delived": delived == null ? null : delived,
      };
}

class DeliveryDetails {
  DeliveryDetails({
    required this.mobile,
    required this.address,
    required this.pincode,
    required this.state,
    required this.city,
    required this.houseNo,
  });

  String mobile;
  String address;
  String pincode;
  String state;
  String city;
  dynamic houseNo;

  factory DeliveryDetails.fromJson(Map<String, dynamic> json) =>
      DeliveryDetails(
        mobile: json["mobile"],
        address: json["address"],
        pincode: json["pincode"],
        state: json["state"],
        city: json["city"],
        houseNo: json["houseNO"],
      );

  Map<String, dynamic> toJson() => {
        "mobile": mobile,
        "address": address,
        "pincode": pincode,
        "state": state,
        "city": city,
        "houseNO": houseNo,
      };
}

class Product {
  Product({
    required this.item,
    required this.quantity,
  });

  String item;
  int quantity;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        item: json["item"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "item": item,
        "quantity": quantity,
      };
}
