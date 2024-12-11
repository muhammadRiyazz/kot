class InvoiceInfo {
  final String invoiceNumberBtoC;
  final String invoiceNumberBtoB;
  final String invoiceReturnNumberBtoC;
  final String invoiceReturnNumberBtoB;

  InvoiceInfo({
    required this.invoiceNumberBtoC,
    required this.invoiceNumberBtoB,
    required this.invoiceReturnNumberBtoC,
    required this.invoiceReturnNumberBtoB,
  });

  // Factory constructor to create an instance from JSON
  factory InvoiceInfo.fromJson(Map<String, dynamic> json) {
    return InvoiceInfo(
      invoiceNumberBtoC: json['InvoiceNumberBtoC'] ?? '',
      invoiceNumberBtoB: json['InvoiceNumberBtoB'] ?? '',
      invoiceReturnNumberBtoC: json['InvoiceReturnNumberBtoC'] ?? '',
      invoiceReturnNumberBtoB: json['InvoiceReturnNumberBtoB'] ?? '',
    );
  }

  // Method to convert an instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'InvoiceNumberBtoC': invoiceNumberBtoC,
      'InvoiceNumberBtoB': invoiceNumberBtoB,
      'InvoiceReturnNumberBtoC': invoiceReturnNumberBtoC,
      'InvoiceReturnNumberBtoB': invoiceReturnNumberBtoB,
    };
  }
}

// Example usage for a list of InvoiceInfo objects
List<InvoiceInfo> parseInvoiceInfoList(List<dynamic> jsonList) {
  return jsonList.map((json) => InvoiceInfo.fromJson(json)).toList();
}



List<InvoiceInfo> appentydataresult=[];