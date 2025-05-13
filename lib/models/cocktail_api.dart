import 'dart:convert';
import 'dart:developer';
import 'package:_cocktails/models/cocktail.dart';
import 'package:http/http.dart' as http;

class CocktailApi {
  Future<List<Cocktail>> getCocktail() async {
    // Create the URI using the provided endpoint with scheme and path
    var uri = Uri(
      scheme: 'https',
      host: 'the-cocktail-db3.p.rapidapi.com',
    );

    final response = await http.get(uri, headers: {
      'X-Rapidapi-Key':
          'f779fd5053msh6f425d8faaa6731p1a55d7jsnc53e98fc7651', // Your API key
      'X-Rapidapi-Host':
          'the-cocktail-db3.p.rapidapi.com', // Add this required header
    });

    if (response.statusCode == 200) {
      log('we have liftoff');
      List<dynamic> data = jsonDecode(response.body);

      return data.map((json) => Cocktail.fromJson(json)).toList();
    } else {
      // Error handling: throw an exception or handle the error as needed
      throw Exception('Failed to load cocktail');
    }
  }
}
