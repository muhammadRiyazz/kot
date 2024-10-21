class Category {
  final int id;

  final String pdtFilter;
  final String serOrGoods;

  Category({
    required this.id,
    required this.pdtFilter,
    required this.serOrGoods,
  });

  // Factory method to create a Category instance from JSON
  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['Id'] ?? 0, // Default value in case of null

      pdtFilter: json['pdtfilter'] ?? '',
      serOrGoods: json['SERorGOODS'] ?? '',
    );
  }

  // Method to convert a Category instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      
      'pdtfilter': pdtFilter,
      'SERorGOODS': serOrGoods,
    };
  }
}
