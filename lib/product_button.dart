import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Item {
  final String nom;
  final int prix;

  Item({required this.nom, required this.prix});

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      nom: json['nom'],
      prix: json['prix'],
    );
  }
}
class menu extends StatelessWidget {
  final int id_item;
  final String nom;
  final String prix;
  final String image;

  const menu({
    Key? key,
    required this.id_item,
    required this.nom,
    required this.prix,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if () {
              Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ),
          );
       
      
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        onPrimary: Colors.black,
        padding: EdgeInsets.all(8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.network(
            $['image'],
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 8),
          Text(nom, style: TextStyle(fontSize: 16)),
          Text(prix, style: const TextStyle(fontSize: 14, color: Colors.grey)),
        ],
      ),
    );
  }
}
