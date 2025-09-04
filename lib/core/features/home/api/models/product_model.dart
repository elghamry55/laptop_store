class ProductModel {
  final String id;
  final String name;
  final String status;
  final String description;
  final num price;
  final String image;
  final String company;
  final num countInStock;

  ProductModel({
    required this.id,
    required this.name,
    required this.status,
    required this.description,
    required this.price,
    required this.image,
    required this.company,
    required this.countInStock,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['_id'],
      name: json['name'],
      status: json['status'],
      description: json['description'],
      price: json['price'],
      image: json['image'],
      company: json['company'],
      countInStock: json['countInStock'],
    );
  }
}
