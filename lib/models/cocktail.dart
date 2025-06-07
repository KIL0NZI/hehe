import 'dart:developer';

import 'package:hive/hive.dart';

part 'cocktail.g.dart';

@HiveType(typeId: 0)
class Cocktail extends HiveObject {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final String thumbnailUrl;

  @HiveField(2)
  final String difficulty;

  @HiveField(3)
  final String id;


  Cocktail({
    required this.title,
    required this.thumbnailUrl,
    required this.difficulty,
    required this.id
  });

  factory Cocktail.fromJson(Map<String, dynamic> json) {
      if (json['id'] == null) {
    log('⚠️ Missing ID in cocktail JSON: $json');
  }
    return Cocktail(
        title: json['title'],
        thumbnailUrl: json['image'],
        difficulty: json['difficulty'],
        id: json['id'],
);
  }
}
