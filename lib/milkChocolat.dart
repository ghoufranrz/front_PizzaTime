import 'package:flutter/material.dart';

class MilkChocolat extends StatefulWidget {
  const MilkChocolat({Key? key}) : super(key: key);

  @override
  _MilkChocolatState createState() => _MilkChocolatState();
}

class _MilkChocolatState extends State<MilkChocolat> {
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
          title: Text('MILKSHAKE CHOCOLAT'),
          // Bouton de retour à la page précédente
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage('images/MILKSHAKE CHOCOLAT.jpg'),
                ),
                Text(
                  'MILKSHAKE CHOCOLAT',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CheckBoxButton(title: 'COULIS'),
                    SizedBox(height: 20),
                    CheckBoxButton(title: 'TOPPING'),
                    SizedBox(height: 20),
                    Text(
                      'Remarque :',
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    // Ajoutez le TextField ici
                    TextField(
                      minLines: 1,
                      maxLines: 5,
                      style: TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 20),
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

class CheckBoxButton extends StatefulWidget {
  final String title;

  CheckBoxButton({required this.title});

  @override
  _CheckBoxButtonState createState() => _CheckBoxButtonState();
}

class _CheckBoxButtonState extends State<CheckBoxButton> {
  bool showCheckBoxes = false;
  Map<String, bool> values = {
    'COULIS CHOCOLAT': false,
    'COULIS FRUITS ROUGES': false,
    'COULIS CARAMEL': false,
    'JE NE VEUX PAS DE COULIS': false,
  };
  bool showOtherCheckBoxes = false;
  Map<String, bool> otherValues = {
    'TOP KINDER BUENO': false,
    'TOP SPECULOOS': false,
    'TOP OREO': false,
    'JE NE VEUX PAS DE TOPPING': false,
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            setState(() {
              showCheckBoxes = !showCheckBoxes;
              // Réinitialiser l'état de l'autre liste de cases à cocher lorsque ce bouton est cliqué
              showOtherCheckBoxes = false;
            });
            if (showCheckBoxes && widget.title == 'COULIS') {
              bool isChecked = values.containsValue(false);
              if (!isChecked) {
                // Afficher une boîte de dialogue si aucun choix n'est fait
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Erreur'),
                      content: Text('Le choix est obligatoire'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              }
            }
          },
          child: Text('${widget.title}'),
        ),
        SizedBox(height: 10),
        if (showCheckBoxes && widget.title == 'COULIS') ...[
          ListView(
            shrinkWrap: true,
            children: values.keys.map((String key) {
              return CheckboxListTile(
                title: Text(key),
                value: values[key],
                onChanged: (bool? value) {
                  setState(() {
                    values[key] = value!;
                  });
                },
              );
            }).toList(),
          ),
        ],
        if (showCheckBoxes && widget.title == 'TOPPING') ...[
          ListView(
            shrinkWrap: true,
            children: otherValues.keys.map((String key) {
              return CheckboxListTile(
                title: Text(key),
                value: otherValues[key],
                onChanged: (bool? value) {
                  setState(() {
                    otherValues[key] = value!;
                  });
                },
              );
            }).toList(),
          ),
        ],
      ],
    );
  }
}
