import 'package:flutter/material.dart';
import 'package:front_app/detailPage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
//import 'package:unsplash_client/unsplash_client.dart';

void main() {
  runApp(MyApp());
}

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
  final int id_item;
  final String nom;
  final int prix;
  final String image;

  const Item(
      {required this.id_item,
      required this.nom,
      required this.prix,
      required this.image});

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id_item: json['id_item'],
      nom: json['nom'],
      prix: json['prix'],
      image: json['image'],
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('MELTING POT'),
          backgroundColor: Colors.blue, // Couleur de l'appBar en bleu
        ),
        body: Container(
          color: Colors.white, // Définir l'arrière-plan blanc
          child: Center(
            child: FutureBuilder<List<Item>>(
              future: fetchItems(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text("Error: ${snapshot.error}");
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailPage(
                                itemName: snapshot.data![index].nom,
                              ),
                            ),
                          );
                        },
                        child: Card(
                          // Utilisez un Card pour chaque élément avec un fond blanc
                          child: ListTile(
                            title: Text(snapshot.data![index].nom),
                            subtitle:
                                Text('Prix: ${snapshot.data![index].prix}'),
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ),
        // Footer de couleur bleu
        bottomNavigationBar: Container(
          color: Colors.blue,
          height: 50, // Hauteur du footer
          child: Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween, // Espace entre les éléments
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  '0 article',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(),
                child: Text(
                  'Paiement',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: Text(
                  '0.00 €',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
