// To parse this JSON data, do
//
//     final listProduct = listProductFromJson(jsonString);

import 'dart:convert';

List<ListProduct> listProductFromJson(String str) => List<ListProduct>.from(json.decode(str).map((x) => ListProduct.fromJson(x)));

String listProductToJson(List<ListProduct> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ListProduct {
    String id;
    String employeeName;
    String employeeSalary;
    String employeeAge;
    String profileImage;

    ListProduct({
        this.id,
        this.employeeName,
        this.employeeSalary,
        this.employeeAge,
        this.profileImage,
    });

    factory ListProduct.fromJson(Map<String, dynamic> json) => ListProduct(
        id: json["id"],
        employeeName: json["employee_name"],
        employeeSalary: json["employee_salary"],
        employeeAge: json["employee_age"],
        profileImage: json["profile_image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "employee_name": employeeName,
        "employee_salary": employeeSalary,
        "employee_age": employeeAge,
        "profile_image": profileImage,
    };
}
