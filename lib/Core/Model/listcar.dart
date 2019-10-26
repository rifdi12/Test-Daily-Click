import 'dart:convert';

class ListCars {
    String carName;
    String carImage;
    int startFromPrice;

    ListCars({
        this.carName,
        this.carImage,
        this.startFromPrice,
    });
      ListCars.fromJson(Map<String, dynamic> json) {
    carName = json['CarName'];
    carImage = json['CarImage'];
    startFromPrice = json['StartFromPrice'];
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CarName'] = this.carName;
    data['CarImage'] = this.carImage;
    data['StartFromPrice'] = this.startFromPrice;
    return data;
  }
}