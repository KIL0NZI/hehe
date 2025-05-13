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

  Cocktail({
    required this.title,
    required this.thumbnailUrl,
    required this.difficulty,
  });

  factory Cocktail.fromJson(Map<String, dynamic> json) {
    return Cocktail(
        title: json['title'],
        thumbnailUrl: json['image'],
        difficulty: json['difficulty']);
  }
}
