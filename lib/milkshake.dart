import 'package:flutter/material.dart';
import 'product_button.dart'; // Assurez-vous de créer ce fichier et de déplacer la classe ProductButton dedans

class Milkshake extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('MELTING POT'),
        ),
        body: Center(
          child: Column(
            mainAxisSize:
                MainAxisSize.max, // Cela aide à centrer la colonne elle-même
            children: [
              ProductButton(
                id: 1,
                name: "MILKSHAKE VANILLE",
                price: "prix 6.00€",
                imageUrl:
                    "images/milkshake vanille.jpg", // Assurez-vous que cette image est dans le dossier assets
              ),
              SizedBox(height: 20), // Espacement entre les boutons
              ProductButton(
                id: 2,
                name: "MILKSHAKE CHOCOLAT",
                price: "prix 6.00€",
                imageUrl:
                    "images/MILKSHAKE CHOCOLAT.jpg", // Assurez-vous que cette image est dans le dossier assets
              ),
              SizedBox(height: 20), // Espacement entre les boutons
              ProductButton(
                id: 3,
                name: "MILKSHAKE FRUITS ROUGES",
                price: "prix 6.00€",
                imageUrl:
                    "images/MILKSHAKE FRUITS ROUGES.jpg", // Assurez-vous que cette image est dans le dossier assets
              ),
            ],
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
