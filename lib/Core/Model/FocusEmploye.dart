// To parse this JSON data, do
//
//     final focusEmploye = focusEmployeFromJson(jsonString);

import 'dart:convert';

FocusEmploye focusEmployeFromJson(String str) => FocusEmploye.fromJson(json.decode(str));

String focusEmployeToJson(FocusEmploye data) => json.encode(data.toJson());

class FocusEmploye {
    String id;
    String employeeName;
    String employeeSalary;
    String employeeAge;
    String profileImage;

    FocusEmploye({
        this.id,
        this.employeeName,
        this.employeeSalary,
        this.employeeAge,
        this.profileImage,
    });

    factory FocusEmploye.fromJson(Map<String, dynamic> json) => FocusEmploye(
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
