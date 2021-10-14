import 'package:flutter/material.dart';

class InfoPOI extends StatelessWidget {
  const InfoPOI({Key? key, required this.name, required this.location, required this.rating}) : super(key: key);

  final String name;
  final String location;
  final String rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 5),
                child: Text(
                  name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                location,
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        const Icon(
          Icons.star,
          color: Colors.amber,
        ),
        Text(rating),
      ]
    );
  }
}