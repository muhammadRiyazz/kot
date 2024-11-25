class PrinterConfig {
  final String printerName;
  final String kitchenName;
  final String computerName;

  PrinterConfig({
    required this.printerName,
    required this.kitchenName,
    required this.computerName,
  });

  // Factory method to create a PrinterConfig from JSON
  factory PrinterConfig.fromJson(Map<String, dynamic> json) {
    return PrinterConfig(
      printerName: json['PrinterName'],
      kitchenName: json['KitchenName'],
      computerName: json['ComputerName'],
    );
  }

  // Method to convert PrinterConfig to JSON
  Map<String, dynamic> toJson() {
    return {
      'PrinterName': printerName,
      'KitchenName': kitchenName,
      'ComputerName': computerName,
    };
  }
}
