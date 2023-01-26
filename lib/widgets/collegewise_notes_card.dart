import 'package:flutter/material.dart';

class CollegewiseNotesCard extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final double price;
  final String collegOrSchool;
  const CollegewiseNotesCard(
      {super.key,
      required this.title,
      required this.id,
      required this.imageUrl,
      required this.price,
      required this.collegOrSchool});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      child: GridTile(
        header: Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 60,
            decoration: const BoxDecoration(
                color: Color.fromARGB(187, 110, 0, 150),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12))),
            child: Text(
              title,
              style: const TextStyle(
                  color: Colors.white,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold),
            )),
        footer: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 60,
          decoration: const BoxDecoration(
              color: Color.fromARGB(187, 110, 0, 150),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "₹ ${price.toString()}",
                style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold),
              ),
              IconButton(
                  onPressed: (() {}),
                  icon: const Icon(
                    Icons.preview,
                    color: Colors.white,
                  )),
              IconButton(
                  onPressed: (() {}),
                  icon: const Icon(
                    Icons.favorite,
                    color: Colors.white,
                  )),
              IconButton(
                  onPressed: (() {}),
                  icon: const Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                  )),
            ],
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: GestureDetector(
            onTap: () {},
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
