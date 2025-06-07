class Recipe {
  final String id;
  final String title;
  final String difficulty;
  final String portion;
  final String time;
  final String description;
  final List<String> ingredients;
  final List<String> method;
  final String image;

  Recipe({
    required this.id,
    required this.title,
    required this.difficulty,
    required this.portion,
    required this.time,
    required this.description,
    required this.ingredients,
    required this.method,
    required this.image,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    final ingredients = List<String>.from(json['ingredients']);

    final methodRaw = json['method'] as List<dynamic>;
    final method = methodRaw.map((stepMap) {
      if (stepMap is Map<String, dynamic>) {
        return stepMap.values.first.toString();
      } else {
        return stepMap.toString();
      }
    }).toList();

    return Recipe(
      id: json['id'].toString(),
      title: json['title'],
      difficulty: json['difficulty'],
      portion: json['portion'],
      time: json['time'],
      description: json['description'],
      ingredients: ingredients,
      method: method,
      image: json['image'],
    );
  }
}
