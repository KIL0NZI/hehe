import 'package:_cocktails/models/recipe.dart';
import 'package:flutter/material.dart';
import 'package:_cocktails/models/cocktail.dart';
import 'package:_cocktails/models/cocktail_recipe_api.dart';

class RecipeScreen extends StatefulWidget {
  final String cocktailId;

  const RecipeScreen({super.key, required this.cocktailId});

  @override
  State<RecipeScreen> createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  late Future _cocktailFuture;

  @override
  void initState() {
    super.initState();
    _fetchCocktail();
  }

  void _fetchCocktail() {
    setState(() {
      _cocktailFuture = CocktailRecipeApi().getCocktail(id: widget.cocktailId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: FutureBuilder(
        future: _cocktailFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: CircularProgressIndicator(color: Colors.yellow));
          } else if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Failed to load cocktail 🥲",
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellow),
                    onPressed: _fetchCocktail,
                    child: const Text("Retry",
                        style: TextStyle(color: Colors.black)),
                  ),
                ],
              ),
            );
          } else if (!snapshot.hasData) {
            return const Center(
              child: Text("No cocktail data found.",
                  style: TextStyle(color: Colors.white)),
            );
          }

          final Recipe recipe = snapshot.data as Recipe;

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Image.network(
                    recipe.image,
                    width: double.infinity,
                    height: 450,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        recipe.title,
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        recipe.description,
                        style:
                            const TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text("Difficulty: ",
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 20)),
                              Text(recipe.difficulty,
                                  style: const TextStyle(
                                      color: Colors.yellow, fontSize: 20)),
                            ],
                          ),
                          Row(
                            children: [
                              Text("Portion: ",
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 20)),
                              Text(recipe.portion,
                                  style: const TextStyle(
                                      color: Colors.yellow, fontSize: 20)),
                            ],
                          ),
                          Row(
                            children: [
                              Text("Time: ",
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 20)),
                              Text(
                                recipe.time,
                                style: const TextStyle(
                                    color: Colors.yellow, fontSize: 20),
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        "🧂 Ingredients",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      const SizedBox(height: 8),
                      ...recipe.ingredients.map(
                        (ingredient) => Text("• $ingredient",
                            style: const TextStyle(
                                color: Colors.white, fontSize: 20)),
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        "📋 Method",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      const SizedBox(height: 8),
                      ...recipe.method.asMap().entries.map(
                            (entry) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 4.0),
                              child: Text(
                                "Step ${entry.key + 1}: ${entry.value}",
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                            ),
                          ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
