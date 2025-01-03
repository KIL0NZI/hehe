import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CocktailCard extends StatelessWidget {
  final String name;
  final String thumbnailUrl;
  final String difficulty;

  CocktailCard({
    required this.name,
    required this.thumbnailUrl,
    required this.difficulty,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      width: 100,
      height: 180,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.purple.shade300.withOpacity(0.9),
            offset: const Offset(
              0.0,
              10.0,
            ),
            blurRadius: 10.0,
            spreadRadius: -6.0,
          ),
        ],
        image: DecorationImage(
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.35),
            BlendMode.multiply,
          ),
          image: NetworkImage(thumbnailUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Align(
              alignment: Alignment.bottomRight,
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  color: Colors.black
                      .withOpacity(0.7), // Background color with opacity
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(15.0),
                      bottomLeft: Radius.circular(15.0)),
                ),
                child: Text(
                  name,
                  style: GoogleFonts.montserrat(
                    textStyle: const TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              )),
          // Align(
          //   child: Padding(
          //     padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          //     child: Text(
          //       portion,
          //       style: TextStyle(fontSize: 19, color: Colors.white),
          //       overflow: TextOverflow.ellipsis,
          //       maxLines: 2,
          //       textAlign: TextAlign.center,
          //     ),
          //   ),
          //   alignment: Alignment.topLeft,
          // ),
          Align(
            alignment: Alignment.topLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 18,
                      ),
                      SizedBox(width: 7),
                      Text(
                        difficulty,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                // Container(
                //   padding: EdgeInsets.all(5),
                //   margin: EdgeInsets.all(10),
                //   decoration: BoxDecoration(
                //     color: Colors.black.withOpacity(0.4),
                //     borderRadius: BorderRadius.circular(15),
                //   ),
                // child: Row(
                //   children: [
                //     Icon(
                //       Icons.schedule,
                //       color: Colors.yellow,
                //       size: 18,
                //     ),
                //     SizedBox(width: 7),
                //     Text(
                //       time,
                //       style: TextStyle(
                //         color: Colors.white,
                //       ),
                //     ),
                //   ],
                // ),
                // )
              ],
            ),
            // alignment: Alignment.bottomLeft,
          ),
        ],
      ),
    );
  }
}
