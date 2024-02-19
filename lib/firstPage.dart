import 'package:flutter/material.dart';
import 'package:front_app/deuxiemePage.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('first Page'),
        //leading: IconButton(
        //icon: Icon(Icons.arrow_back),
        //onPressed: () => Navigator.pop(context),
        // ),
      ),
      // Le reste du code de votre interface utilisateur
      body: Center(
        child: Text('Bienvenue sur la premiere  page!'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.navigate_next),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const DeuxiemePage()));
        },
      ),
    );
  }
}
