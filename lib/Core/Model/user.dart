// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    List<Value> value;

    User({
        this.value,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        value: List<Value>.from(json["value"].map((x) => Value.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "value": List<dynamic>.from(value.map((x) => x.toJson())),
    };
}

class Value {
    String userId;
    String displayName;
    String firstName;
    String lastName;
    String email;
    bool emailConfirmed;
    String phoneNumber;
    bool phoneNumberConfirmed;
    bool enabledRentWithKey;
    dynamic accountType;
    bool isLister;
    bool verifiedMember;
    DateTime lastLogin;
    List<ExtraInfoList> extraInfoList;
    ExtraProfile extraProfile;
    List<String> roles;
    String affiliateId;

    Value({
        this.userId,
        this.displayName,
        this.firstName,
        this.lastName,
        this.email,
        this.emailConfirmed,
        this.phoneNumber,
        this.phoneNumberConfirmed,
        this.enabledRentWithKey,
        this.accountType,
        this.isLister,
        this.verifiedMember,
        this.lastLogin,
        this.extraInfoList,
        this.extraProfile,
        this.roles,
        this.affiliateId,
    });

    factory Value.fromJson(Map<String, dynamic> json) => Value(
        userId: json["UserId"],
        displayName: json["DisplayName"],
        firstName: json["FirstName"],
        lastName: json["LastName"],
        email: json["Email"],
        emailConfirmed: json["EmailConfirmed"],
        phoneNumber: json["PhoneNumber"],
        phoneNumberConfirmed: json["PhoneNumberConfirmed"],
        enabledRentWithKey: json["EnabledRentWithKey"],
        accountType: json["AccountType"],
        isLister: json["IsLister"],
        verifiedMember: json["VerifiedMember"],
        lastLogin: DateTime.parse(json["LastLogin"]),
        extraInfoList: List<ExtraInfoList>.from(json["ExtraInfoList"].map((x) => ExtraInfoList.fromJson(x))),
        extraProfile: ExtraProfile.fromJson(json["ExtraProfile"]),
        roles: List<String>.from(json["Roles"].map((x) => x)),
        affiliateId: json["AffiliateId"],
    );

    Map<String, dynamic> toJson() => {
        "UserId": userId,
        "DisplayName": displayName,
        "FirstName": firstName,
        "LastName": lastName,
        "Email": email,
        "EmailConfirmed": emailConfirmed,
        "PhoneNumber": phoneNumber,
        "PhoneNumberConfirmed": phoneNumberConfirmed,
        "EnabledRentWithKey": enabledRentWithKey,
        "AccountType": accountType,
        "IsLister": isLister,
        "VerifiedMember": verifiedMember,
        "LastLogin": lastLogin.toIso8601String(),
        "ExtraInfoList": List<dynamic>.from(extraInfoList.map((x) => x.toJson())),
        "ExtraProfile": extraProfile.toJson(),
        "Roles": List<dynamic>.from(roles.map((x) => x)),
        "AffiliateId": affiliateId,
    };
}

class ExtraInfoList {
    dynamic appId;
    String appName;
    String appPicture;
    String appProvider;

    ExtraInfoList({
        this.appId,
        this.appName,
        this.appPicture,
        this.appProvider,
    });

    factory ExtraInfoList.fromJson(Map<String, dynamic> json) => ExtraInfoList(
        appId: json["AppId"],
        appName: json["AppName"],
        appPicture: json["AppPicture"],
        appProvider: json["AppProvider"],
    );

    Map<String, dynamic> toJson() => {
        "AppId": appId,
        "AppName": appName,
        "AppPicture": appPicture,
        "AppProvider": appProvider,
    };
}

class ExtraProfile {
    String address;
    String city;
    String state;
    int zipCode;
    String works;
    dynamic school;
    dynamic about;
    DateTime joinDate;
    String refCode;

    ExtraProfile({
        this.address,
        this.city,
        this.state,
        this.zipCode,
        this.works,
        this.school,
        this.about,
        this.joinDate,
        this.refCode,
    });

    factory ExtraProfile.fromJson(Map<String, dynamic> json) => ExtraProfile(
        address: json["Address"],
        city: json["City"],
        state: json["State"],
        zipCode: json["ZipCode"],
        works: json["Works"],
        school: json["School"],
        about: json["About"],
        joinDate: DateTime.parse(json["JoinDate"]),
        refCode: json["RefCode"],
    );

    Map<String, dynamic> toJson() => {
        "Address": address,
        "City": city,
        "State": state,
        "ZipCode": zipCode,
        "Works": works,
        "School": school,
        "About": about,
        "JoinDate": joinDate.toIso8601String(),
        "RefCode": refCode,
    };
}
