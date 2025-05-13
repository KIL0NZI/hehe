import 'package:_cocktails/models/cocktail.dart';
import 'package:_cocktails/screens/home_screen.dart';
import 'package:_cocktails/services/cocktail_service.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  CocktailService cocktailService = CocktailService();
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(CocktailAdapter());
  await Hive.openBox<Cocktail>('quickcocktaildb');

  await cocktailService.getAndSaveCocktails();

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
