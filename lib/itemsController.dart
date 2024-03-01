import 'package:http/http.dart' as http;
//import 'package:get/get.dart';
import 'package:front_app/contraint.dart';

class ItemsController {

  
  void getitemsbyredirect({
    required String nom,
    required int prix
  }){
    var request = http.MultipartRequest(
        "POST", Uri.parse("${Contraint.baseUrl}/getitemsbyredirect"),);
  }
}
