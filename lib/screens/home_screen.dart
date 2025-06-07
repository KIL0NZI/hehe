// import 'package:cock_tails/models/cocktail_api.dart';
import 'package:_cocktails/models/cocktail_api.dart';
import 'package:_cocktails/cards/cocktail_card.dart';
import 'package:_cocktails/models/cocktail_recipe_api.dart';
import 'package:_cocktails/screens/nav_drawer.dart';
import 'package:_cocktails/screens/recipe_screen.dart';
import 'package:_cocktails/services/cocktail_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:_cocktails/models/cocktail.dart';
import 'dart:developer' as developer;
import 'dart:math';

import 'package:hive/hive.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => HomescreenState();
}

class HomescreenState extends State<Homescreen> {
  final Box<Cocktail> cocktailBox = Hive.box<Cocktail>('quickcocktaildb');
  List<Cocktail> filteredCocktails = [];
  List<String> allCocktails = [];
  TextEditingController searchController = TextEditingController();
  CocktailService cocktailService = CocktailService();
  final random = Random();

  Cocktail? randomCocktail;

  @override
  void initState() {
    super.initState();
    getRandomCocktail();
  }

  void getRandomCocktail() {
    final randomIndex = random.nextInt(cocktailBox.length);
    randomCocktail = cocktailBox.getAt(randomIndex) as Cocktail;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black87,
        drawer: NavDrawer(),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Colors.black,
          title: Row(children: [
            const Icon(
              Icons.wine_bar,
              size: 20,
            ),
            const SizedBox(
              width: 10.0,
            ),
            Text(
              'TipsyTime',
              style: GoogleFonts.montserrat(
                  textStyle:
                      const TextStyle(fontSize: 20.0, color: Colors.white)),
            )
          ]),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () async {
                  await CocktailRecipeApi().getCocktail(id: randomCocktail?.id);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RecipeScreen(
                              cocktailId: randomCocktail?.id ?? '2')));
                },
                child: Stack(
                  children: [
                    Container(
                      width: 380,
                      height: 280,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image:
                                  NetworkImage(randomCocktail!.thumbnailUrl))),
                    ),
                    Container(
                      width: 380,
                      height: 280,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.black.withOpacity(.95),
                            Colors.transparent, // Dark at the bottom
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                        top: 20,
                        left: 20,
                        child: Text(
                          "Cocktail Of The Day",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w100),
                        )),
                    Positioned(
                      top: 60,
                      left: 30,
                      child: Container(
                        width: 350,
                        child: Text(randomCocktail!.title,
                            style: GoogleFonts.montserrat(
                                textStyle: const TextStyle(
                                    fontSize: 25.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                            softWrap: true,
                            overflow: TextOverflow.ellipsis),
                      ),
                    ),
                    Positioned(
                        top: 90,
                        left: 30,
                        child: Row(
                          children: [
                            Text(
                              'Difficulty: ',
                              style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white),
                            ),
                            Text(randomCocktail!.difficulty,
                                style: GoogleFonts.montserrat(
                                    textStyle: const TextStyle(
                                        fontSize: 15.0, color: Colors.yellow))),
                          ],
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: 380,
                height: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey.shade900),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        Positioned(
                          top: 23,
                          left: 20,
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.purple.shade200),
                          ),
                        ),
                        Positioned(
                            child: Image(image: AssetImage('assets/dice.png')))
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Random Cocktail',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 17),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Don't know what to make?",
                          style: TextStyle(
                              fontWeight: FontWeight.w200, color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 70,
                    ),
                    GestureDetector(
                      onTap: () async {
                        int randomNumber = 1 + random.nextInt(131);
                        await CocktailRecipeApi()
                            .getCocktail(id: randomNumber.toString());
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RecipeScreen(
                                    cocktailId: randomNumber.toString())));
                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.pink.shade400),
                        child: Icon(
                          Icons.arrow_outward,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Browse Cocktails',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              cocktailList()
            ],
          ),
        ));
  }

  Widget cocktailList() {
    return ListView.builder(
        itemCount: cocktailBox.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final cocktail = cocktailBox.getAt(index);
          return GestureDetector(
            onTap: () async {
              await CocktailRecipeApi().getCocktail(id: cocktail?.id);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          RecipeScreen(cocktailId: cocktail?.id ?? '3')));
            },
            child: CocktailCard(
              name: cocktail?.title ?? 'err',
              thumbnailUrl: cocktail?.thumbnailUrl ?? 'err',
              difficulty: cocktail?.difficulty ?? 'err',
            ),
          );
        });
  }

  //           Widget searchBar() {
  //             return
  //           }

  //           Widget drinksRow() {
  //             return ListView.builder(
  //                 scrollDirection: Axis.horizontal,
  //                 itemCount: allCocktails.length,
  //                 itemBuilder: (context, index) {
  //                   var cocktail = allCocktails[index];
  //                   return SmallerCard(
  //                     name: allCocktails.title,
  //                     thumbnailUrl: allCocktails.thumbnailUrl,
  //                   );
  //                 });
  //       });
  // }
}
