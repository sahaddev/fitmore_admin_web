import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final int? id;
  final String? mongoId;
  final String title;
  final String subTitle;
  final String description;
  final String imageOne;
  final String imageTwo;
  final String imageThree;
  final String imageFour;
  final int price;
  final String category;
  final bool active;
  final int quantity;
  final DateTime? updatedAt;

  const ProductEntity({
    this.id,
    this.mongoId,
    required this.title,
    required this.subTitle,
    required this.description,
    required this.imageOne,
    required this.imageTwo,
    required this.imageThree,
    required this.imageFour,
    required this.price,
    required this.category,
    this.active = true,
    required this.quantity,
    this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        mongoId,
        title,
        subTitle,
        description,
        imageOne,
        imageTwo,
        imageThree,
        imageFour,
        price,
        category,
        active,
        quantity,
        updatedAt,
      ];
}
