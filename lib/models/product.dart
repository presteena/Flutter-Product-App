class Product {
  final int id;
  final String title;
  final String description;
  final String thumbnail;
  final double price;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.thumbnail,
    required this.price,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      thumbnail: json['thumbnail'],
      price: json['price'].toDouble(),
    );
  }
}
