import 'package:flutter/material.dart';
import 'package:front_app/checkBoxButton.dart';

class MilkVanille extends StatefulWidget {
  const MilkVanille({Key? key}) : super(key: key);

  @override
  _MilkVanilleState createState() => _MilkVanilleState();
}

class _MilkVanilleState extends State<MilkVanille> {
  static const IconData add_circle_outline =
      IconData(0xe050, fontFamily: 'MaterialIcons');
  static const IconData do_disturb_on_outlined =
      IconData(0xefd7, fontFamily: 'MaterialIcons');
  int _variableModifiable = 1;
  String footerMessage = 'Ajouter 1 article au panier';
  String priceMessage = '6.00 € ';
  int _footerPrice = 6;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('MILKSHAKE VANILLE'),
          // Bouton de retour à la page précédente
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            //height: MediaQuery.of(context)
            // .size
            // .height, // Prendre la hauteur de l'écran
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage('images/MILKSHAKE VANILLE.jpg'),
                  ),
                  Text(
                    'MILKSHAKE VANILLE',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CheckBoxButton(
                        id :1,
                        title: 'COULIS',
                      ),
                      SizedBox(height: 20),
                      CheckBoxButton(
                        id : 2,
                        title: 'TOPPING'),
                      SizedBox(height: 20),
                      Text(
                        'Remarque :',
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20),
                      TextField(
                        minLines: 1,
                        maxLines: 5,
                        style: TextStyle(fontSize: 20),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: Icon(Icons.add_circle_outline),
                            onPressed: () {
                              setState(() {
                                // Action à effectuer lors du clic sur l'icône d'ajout
                                _variableModifiable++;
                                footerMessage =
                                    'Ajouter $_variableModifiable article au panier';
                                _footerPrice = _variableModifiable * 6;
                                priceMessage = '$_footerPrice.00 €';
                              });
                            },
                          ),
                          SizedBox(width: 20),
                          Text(
                            ' $_variableModifiable',
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(width: 20),
                          IconButton(
                            icon: Icon(Icons.remove_circle_outline),
                            onPressed: () {
                              setState(() {
                                // Action à effectuer lors du clic sur l'icône de suppression
                                if (_variableModifiable > 1) {
                                  _variableModifiable--;
                                  footerMessage =
                                      'Ajouter $_variableModifiable article au panier';
                                  _footerPrice = _footerPrice - 6;
                                  priceMessage = '$_footerPrice.00 €';
                                }
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),

        // Footer de couleur gris
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
                  footerMessage,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: Text(
                  priceMessage,
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


