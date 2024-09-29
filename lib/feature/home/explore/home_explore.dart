// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive/hive.dart';
part 'home_explore.g.dart';

@HiveType(typeId: 0)
class HomeExplore {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final double price;
  @HiveField(2)
  final int discountPercentage;
  @HiveField(3)
  final String image;
  HomeExplore({
    required this.name,
    required this.price,
    required this.discountPercentage,
    required this.image,
  });

  HomeExplore copyWith({
    String? name,
    double? price,
    int? discountPercentage,
    String? image,
  }) {
    return HomeExplore(
      name: name ?? this.name,
      price: price ?? this.price,
      discountPercentage: discountPercentage ?? this.discountPercentage,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'price': price,
      'discountPercentage': discountPercentage,
      'image': image,
    };
  }

  factory HomeExplore.fromMap(Map<String, dynamic> map) {
    return HomeExplore(
      name: map['name'] as String,
      price: map['price'] as double,
      discountPercentage: map['discountPercentage'] as int,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory HomeExplore.fromJson(String source) =>
      HomeExplore.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'HomeExplore(name: $name, price: $price, discountPercentage: $discountPercentage, image: $image)';
  }

  @override
  bool operator ==(covariant HomeExplore other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.price == price &&
        other.discountPercentage == discountPercentage &&
        other.image == image;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        price.hashCode ^
        discountPercentage.hashCode ^
        image.hashCode;
  }
}
