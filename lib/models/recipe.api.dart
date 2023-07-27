import 'dart:convert';
import 'package:flutter_app_resep/models/recipe.dart';
import 'package:http/http.dart' as http;

class RecipeApi {
  static Future<List<Recipe>> getRecipe() async { //TODO: MENETAPKAN YUMMYL SEBAGAI API
    var uri = Uri.https('yummly2.p.rapidapi.com', '/feeds/list',
        {"limit": "18", "start": "0", "tag": "list.recipe.popular"});

    final response = await http.get(uri, headers: { //TODO: KUNCI UNTUK MENGGUNAKAN API
      "x-rapidapi-key": "3168325557msh231739848b787cfp1b4ff2jsn2fa2d565b5ed",
      "x-rapidapi-host": "yummly2.p.rapidapi.com",
      "useQueryString": "true"
    });

    Map data = jsonDecode(response.body); //TODO: MEMPARSING DATA-DATA YANG DIPERLUKAN DARI API
    List _temp = [];

    for (var i in data['feed']) { //TODO: MENGAMBIL DESKRIPSI DAN DETAIL RESEP DARI API
      _temp.add(i['content']['details']);
    }

    return Recipe.recipesFromSnapshot(_temp);
  }
}