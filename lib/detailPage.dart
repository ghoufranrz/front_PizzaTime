import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Item>> fetchItems() async {
  final response = await http
      .post(Uri.parse('http://localhost:3000/items/items/getitemsbyMenu'));

  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((data) => Item.fromJson(data)).toList();
  } else {
    throw Exception('Failed to load items');
  }
}

class Item {
  final String nom;
  final int prix;
  //final int nombreArticle;

  Item({
    required this.nom,
    required this.prix,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      nom: json['nom'],
      prix: json['prix'],
      //nombreArticle: json['nombreArticle'] ?? 1,
    );
  }
}

class DetailPage extends StatelessWidget {
  final String itemName;

  const DetailPage({required this.itemName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(itemName),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text('Contenu de la page $itemName ici...'),
              ),
              SizedBox(
                width: 250,
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Remarque',
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.add_circle_outline),
                    onPressed: () {
                      //footerMessage = '${snapshot.data![index].prix} = ${snapshot.data![index].prix} * ${snapshot.data![index].nombreArticle}
                    },
                  ),
                  SizedBox(width: 20),
                  //Text(
                  // style: TextStyle(fontSize: 20),
                  //),
                  SizedBox(width: 20),
                  IconButton(
                    icon: Icon(Icons.remove_circle_outline),
                    onPressed: () {
                      // Mettre à jour l'état ici n'est pas possible car DetailPage est un StatelessWidget
                      // Vous devez utiliser un StatefulWidget si vous souhaitez mettre à jour l'état.
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
    // ),
  }
}
