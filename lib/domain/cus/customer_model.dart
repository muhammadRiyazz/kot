class CustomerDetails {
  String cusid;
  String bussinessname;
  String bussinessaddr;
  String customerType;

  CustomerDetails({
    required this.cusid,
    required this.bussinessname,
    required this.bussinessaddr,
    required this.customerType,
  });

  // Factory method to create an instance from JSON
  factory CustomerDetails.fromJson(Map<String, dynamic> json) {
    return CustomerDetails(
      cusid: json['cusid'],
      bussinessname: json['bussinessname'],
      bussinessaddr: json['bussinessaddr'],
      customerType: json['CustomerTYPE'],
    );
  }

  // Method to convert an instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'cusid': cusid,
      'bussinessname': bussinessname,
      'bussinessaddr': bussinessaddr,
      'CustomerTYPE': customerType,
    };
  }
}
