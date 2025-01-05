// import 'package:cock_tails/models/cocktail_api.dart';
import 'package:_cocktails/models/cocktail_api.dart';
import 'package:_cocktails/cards/cocktail_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:_cocktails/models/cocktail.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => HomescreenState();
}

class HomescreenState extends State<Homescreen> {
  List<Cocktail> _cocktails = [];
  @override
  void initState() {
    super.initState();
    // getCocktailFirst();
  }

  Future getCocktails() async {
    return await CocktailApi().getCocktail();
    // setState(() {
    //   _isLoading = false;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
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
                  textStyle: const TextStyle(fontSize: 20.0)),
            )
          ]),
        ),
        body: Column(children: [
          Container(
            width: MediaQuery.of(context).size.width,
            child: SearchAnchor(
              builder: (BuildContext context, SearchController controller) {
                return SearchBar(
                  controller: controller,
                  padding: const MaterialStatePropertyAll<EdgeInsets>(
                      EdgeInsets.symmetric(horizontal: 40.0)),
                  onTap: () {
                    controller.openView;
                  },
                  onChanged: (_) {
                    controller.openView();
                  },
                );
              },
              suggestionsBuilder:
                  (BuildContext context, SearchController controller) {
                return List<ListTile>.generate(5, (int index) {
                  final String item = 'cocktail $index';
                  return ListTile(
                    title: Text(item),
                    onTap: () {
                      setState(() {
                        controller.closeView(item);
                      });
                    },
                  );
                });
              },
            ),
          ),
          SizedBox(
            height: 80,
          ),
          FutureBuilder(
            future: getCocktails(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  _cocktails = snapshot.data;
                  return ListView.builder(
                      itemCount: _cocktails.length,
                      itemBuilder: (context, index) {
                        var cocktail = _cocktails[index];
                        return CocktailCard(
                          name: cocktail.title,
                          difficulty: cocktail.difficulty,
                          thumbnailUrl: cocktail.thumbnailUrl,
                        );
                      });
                } else {
                  return const Center(
                    child: Text('No data found'),
                  );
                }
              } else {
                return const Center(
                  child: Text('An error occurred'),
                );
              }
            },
          )
        ]));
  }
}
