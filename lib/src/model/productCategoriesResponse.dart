class ProductCategories {
  String id;
  String ccode;
  String name;

  ProductCategories({
    required this.id,
    required this.ccode,
    required this.name,
  });

  factory ProductCategories.fromJson(Map<String, dynamic> json) {
    return ProductCategories(
      id: json['0'] as String,
      ccode: json['ccode'] as String,
      name: json['1'] as String,
    );
  }
}
