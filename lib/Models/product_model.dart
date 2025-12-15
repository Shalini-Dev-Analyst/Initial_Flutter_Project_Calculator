class Product{
  final String id;
  final String name;
  final double price;
  final String? color;

  Product({
    required this.id,
    required this.name,
    required this.price,
    this.color,
});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'].toString(),
      name: json['name'] ?? '',
      price: json['data'] != null && json['data']['price'] != null
          ? (json['data']['price'] as num).toDouble()
          : 0.0,
      color: json['data'] != null ? json['data']['color'] : null,
    );
  }
}