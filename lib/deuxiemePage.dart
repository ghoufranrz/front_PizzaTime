import 'package:flutter/material.dart';
import 'package:front_app/firstPage.dart';

class DeuxiemePage extends StatelessWidget {
  const DeuxiemePage({Key? key}) : super(key: key);

  //const DeuxiemePage ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('FORMULE VIENNOISERIE'),
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
                'FORMULE VIENNOISERIE',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('images/recette1.jpg'),
              ),
              SizedBox(height: 20),
              Text(
                'Viennoiserie au choix boisson  chaude au choixjus d\'orange',
                textAlign: TextAlign.center,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CheckBoxButton(title: 'Croissant'),
                  SizedBox(height: 20),
                  CheckBoxButton(title: 'Liste 2'),
                  SizedBox(height: 20),
                  CheckBoxButton(title: 'Liste 3'),
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
    'CROISSANT': false,
    'PAIN AU CHOCOLAT': false,
  };
  bool showOtherCheckBoxes = false;
  Map<String, bool> otherValues = {
    'Option 1': false,
    'Option 2': false,
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
            if (showCheckBoxes && widget.title == 'Croissant') {
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
        if (showCheckBoxes && widget.title == 'Croissant') ...[
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
        if (showCheckBoxes && widget.title == 'Liste 2') ...[
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
