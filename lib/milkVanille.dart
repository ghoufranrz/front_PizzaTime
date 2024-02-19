import 'package:flutter/material.dart';

class MilkVanille extends StatelessWidget {
  const MilkVanille({Key? key}) : super(key: key);
  static const IconData add_circle_outline =
      IconData(0xe050, fontFamily: 'MaterialIcons');

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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'MILKSHAKE VANILLE',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage('images/MILKSHAKE VANILLE.jpg'),
              ),
              SizedBox(height: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CheckBoxButton(title: 'COULIS'),
                  SizedBox(height: 20),
                  CheckBoxButton(title: 'TOPPING'),
                  Text(
                    'Remarque :',
                    textAlign: TextAlign.center,
                  ),
                  // Ajoutez le TextField ici
                  TextField(
                    minLines: 1,
                    maxLines: 5,
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                  // actions: [
                  IconButton(
                    icon: Icon(Icons.add_circle_outline),
                    onPressed: () {
                      // Action à effectuer lors du clic sur l'icône
                    },
                  ),
                  //],
                ],
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
