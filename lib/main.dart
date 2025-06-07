import 'dart:developer';

import 'package:_cocktails/models/cocktail.dart';
import 'package:_cocktails/models/cocktail_api.dart';
import 'package:_cocktails/screens/home_screen.dart';
import 'package:_cocktails/services/cocktail_service.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(CocktailAdapter());

  // CocktailService cocktailService = CocktailService();

  await Hive.openBox<Cocktail>('quickcocktaildb');
  // final Box<Cocktail> box = Hive.box('quickcocktaildb');
  // log(box.toString());

  // await cocktailService.getAndSaveCocktails();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Homescreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
