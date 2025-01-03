import 'dart:convert';
import 'package:http/http.dart' as http;

class Cocktail {
  final String title;
  final String thumbnailUrl;
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

  // static Future getCocktail() async {
  //   // Create the URI using the provided endpoint
  //   var uri = Uri.https(
  //     'http://the-cocktail-db3.p.rapidapi.com', // Host
  //     '/45', // Path for the specific resource
  //   );

  //   // Make the GET request with the appropriate headers
  //   final response = await http.get(uri, headers: {
  //     'X-Rapidapi-Key':
  //         'f779fd5053msh6f425d8faaa6731p1a55d7jsnc53e98fc7651', // Your API key
  //     'X-Rapidapi-Host': 'the-cocktail-db3.p.rapidapi.com', // Host header
  //   });

  //   if (response.statusCode == 200) {
  //     Map<String, dynamic> data = jsonDecode(response.body);
  //     return Cocktail(
  //       title: data['title'] as String,
  //       thumbnailUrl: data['image'] as String,
  //       difficulty: data['difficulty'] as String,
  //     );
  //   }
  //   //   else {
  //   //     _showAlert();
  //   //   }
  // }
}
