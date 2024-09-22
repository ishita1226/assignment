// Product model class
class ProductModel {
  final String name;
  final String description;
  final double originalPrice;
  final double discountedPrice;
  final double discountPercentage;
  final String imageUrl;

  ProductModel({
    required this.name,
    required this.description,
    required this.originalPrice,
    required this.discountedPrice,
    required this.discountPercentage,
    required this.imageUrl,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      name: json['title'],
      description: json['description'],
      originalPrice: double.parse(json['price'].toString()),
      discountedPrice: double.parse(json['price'].toString()) * (1 - json['discountPercentage'] / 100),
      discountPercentage: json['discountPercentage'].toDouble(),
      imageUrl: json['thumbnail'],
    );
  }
}

