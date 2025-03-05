class Settings {
  final String taxtype;
  final String cmpname;
    final String cmpgstno;

  
  final String cmpadd;
  final String companyContactNo;
  final String billFooterText;
  final String kotFooterText;
  final String gSTScheme;

  Settings({
    required this.gSTScheme,
    required this.cmpgstno,
    required this.taxtype,
    required this.cmpname,
    required this.cmpadd,
    required this.companyContactNo,
    required this.billFooterText,
    required this.kotFooterText,
  });

  // Factory constructor to create a Settings object from JSON
  factory Settings.fromJson(Map<String, dynamic> json) {
    return Settings(
      gSTScheme: json['GSTScheme']??'',
      cmpgstno: json['cmpgstno']??'',
      taxtype: json['taxtype'] ?? '',
      cmpname: json['cmpname'] ?? '',
      cmpadd: json['cmpadd'] ?? '',
      companyContactNo: json['CompanyContactNo'] ?? '',
      billFooterText: json['BillFooterText'] ?? '',
      kotFooterText: json['KOTFooterText'] ?? '',
    );
  }

  // Method to convert a Settings object to JSON
  Map<String, dynamic> toJson() {
    return {
            'taxtype': taxtype,
      'GSTScheme': gSTScheme,
      'cmpname': cmpname,
      'cmpadd': cmpadd,
      'CompanyContactNo': companyContactNo,
      'BillFooterText': billFooterText,
      'KOTFooterText': kotFooterText,
    };
  }
}
