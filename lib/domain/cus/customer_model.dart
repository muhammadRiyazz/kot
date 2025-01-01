import 'package:restaurant_kot/domain/resto%20info/hotel_info.dart';

class CustomerDetails {
  String cusid;
  String bussinessname;
  String bussinessaddr;
  String customerType;
  String gstno;

  CustomerDetails(
      {required this.cusid,
      required this.bussinessname,
      required this.bussinessaddr,
      required this.customerType,
      required this.gstno});

  // Factory method to create an instance from JSON
  factory CustomerDetails.fromJson(Map<String, dynamic> json) {
    return CustomerDetails(
      gstno: json['gstno'],
      cusid: json['cusid'],
      bussinessname: json['bussinessname'],
      bussinessaddr: json['bussinessaddr'],
      customerType: json['CustomerTYPE'],
    );
  }

  // Method to convert an instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'gstno': gstno,
      'cusid': cusid,
      'bussinessname': bussinessname,
      'bussinessaddr': bussinessaddr,
      'CustomerTYPE': customerType,
    };
  }
}

Settings? infoCustomer;
String? usernameA;
bool? billEdit;
String? ipid;

