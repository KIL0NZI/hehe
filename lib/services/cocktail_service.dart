import 'dart:developer';

import 'package:_cocktails/models/cocktail.dart';
import 'package:_cocktails/models/cocktail_api.dart';
import 'package:hive/hive.dart';

class CocktailService {
  Future getAndSaveCocktails() async {
    try {
      final Box<Cocktail> cocktailBox = Hive.box<Cocktail>('quickcocktaildb');

      final response = await CocktailApi().getCocktail();

      for (int i = 0; i < response.length; i++) {
        await cocktailBox.put('cocktail_$i', response[i]);
      }

      log('$response');
    } catch (e) {
      log(e.toString());
    }
  }

  Future fetchSavedCocktails() async {}
}
