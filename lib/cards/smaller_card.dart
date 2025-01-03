import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SmallerCard extends StatelessWidget {
  final String name;
  final String thumbnailUrl;
  final String difficulty;

  SmallerCard({
    required this.name,
    required this.thumbnailUrl,
    required this.difficulty,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          width: 100,
          height: 100,
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
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          name,
          textAlign: TextAlign.center,
        )
      ],
    );
    // alignment: Alignment.bottomLeft,
  }
}
