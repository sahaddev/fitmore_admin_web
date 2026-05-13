import '../../domain/entities/product.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    super.id,
    super.mongoId,
    required super.title,
    required super.subTitle,
    required super.description,
    required super.imageOne,
    required super.imageTwo,
    required super.imageThree,
    required super.imageFour,
    required super.price,
    required super.category,
    super.active,
    required super.quantity,
    super.updatedAt,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      mongoId: json['_id'],
      title: json['title'] ?? '',
      subTitle: json['sub_title'] ?? '',
      description: json['description'] ?? '',
      imageOne: json['image_one'] ?? json['image1'] ?? '',
      imageTwo: json['image_two'] ?? json['image2'] ?? '',
      imageThree: json['image_three'] ?? json['image3'] ?? '',
      imageFour: json['image_four'] ?? json['image4'] ?? '',
      price: json['price'] ?? 0,
      category: json['category'] ?? '',
      active: json['active'] ?? true,
      quantity: json['quantity'] ?? json['productCount'] ?? 0,
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'sub_title': subTitle,
      'description': description,
      'image1': imageOne,
      'image2': imageTwo,
      'image3': imageThree,
      'image4': imageFour,
      'price': price,
      'category': category,
      'active': active,
      'productCount': quantity,
    };
  }

  factory ProductModel.fromEntity(ProductEntity entity) {
    return ProductModel(
      id: entity.id,
      mongoId: entity.mongoId,
      title: entity.title,
      subTitle: entity.subTitle,
      description: entity.description,
      imageOne: entity.imageOne,
      imageTwo: entity.imageTwo,
      imageThree: entity.imageThree,
      imageFour: entity.imageFour,
      price: entity.price,
      category: entity.category,
      active: entity.active,
      quantity: entity.quantity,
      updatedAt: entity.updatedAt,
    );
  }
}
