import 'package:flutter/material.dart';
import 'package:front_app/milkFRouges.dart';
import 'package:front_app/milkVanille.dart';
import 'package:front_app/milkChocolat.dart';

//class CheckBoxButtonState extends State<StatefulWidget> {
//List<MilkCheckBoxButton> checkBoxButtons = [
//MilkCheckBoxButton(id: '1', title: 'COULIS'),
//MilkCheckBoxButton(id: '2', title: 'TOPPING'),

//];

class CheckBoxButton extends StatefulWidget {
  final int id;
  final String title;
  //bool isActive false;

  CheckBoxButton({required this.title, required this.id});

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

              showOtherCheckBoxes = true;
            });
            if (!showCheckBoxes) {
              String message =
                  widget.id == 1 ? 'Coulis obligatoire' : 'Topping obligatoire';
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(message),
                  duration: Duration(seconds: 2),
                ),
              );
            }
          },
          child: Text('${widget.title}'),
        ),
        if (showCheckBoxes && widget.id == 1 && widget.id == 2) ...[
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
      ],
    );
  }
}
