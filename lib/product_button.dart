import 'package:flutter/material.dart';
import 'package:front_app/milkFRouges.dart';
import 'package:front_app/milkVanille.dart';
import 'package:front_app/milkChocolat.dart';

class ProductButton extends StatelessWidget {
  final int id;
  final String name;
  final String price;
  final String imageUrl;

  const ProductButton({
    Key? key,
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (id == 1) {
          // Assurez-vous que l'ID correspond à celui que vous avez donné au bouton "MILKSHAKE VANILLE"
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MilkVanille()),
          );
        } else if (id == 2) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MilkChocolat()),
          );
        } else if (id == 3) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MilkFRouge()),
          );
        }
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
            imageUrl,
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 8),
          Text(name, style: TextStyle(fontSize: 16)),
          Text(price, style: TextStyle(fontSize: 14, color: Colors.grey)),
        ],
      ),
    );
  }
}
