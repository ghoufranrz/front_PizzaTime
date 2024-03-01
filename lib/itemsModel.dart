class ItemsModel {
  final int _idItem; // Correction du nom de variable pour suivre les conventions Dart
  String _nom;
  int _prix;

  // Constructeur
  ItemsModel(this._idItem, this._nom, this._prix);

  // Getter pour 'idItem'
  int get idItem => _idItem; // Ajouté pour l'exhaustivité

  // Getter pour 'nom'
  String get nom => _nom;

  // Setter pour 'nom'
  set nom(String value) {
    _nom = value;
  }

  // Getter pour 'prix'
  int get prix => _prix;

  // Setter pour 'prix'
  set prix(int value) {
    _prix = value;
  }
}
