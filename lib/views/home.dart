import 'package:flutter/material.dart'; //TODO: MEMANGGIL DEPENDENSI
import 'package:flutter_app_resep/models/recipe.api.dart';
import 'package:flutter_app_resep/models/recipe.dart';
import 'package:flutter_app_resep/views/widgets/recipe_card.dart';

class HomePage extends StatefulWidget { //TODO: MEMBUAT HALAMAN UTAMA
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> { //TODO:STATE MANAGEMENT UNTUK HALAMAN UTAMA
  List<Recipe> _recipes;
  bool _isLoading = true;

  @override
  void initState() { //TODO: METHOD INITSTATE UNTUK MENGIBNISISALISASI DATA DI HOMEPAGE
    super.initState();
    getRecipes();
  }

  Future<void> getRecipes() async { //TODO: MENGAMBIL DATA RESEP DARI API YAMMYL
    _recipes = await RecipeApi.getRecipe();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) { //TODO: WIDGET UNTUK MEMBANGUN HALAMAN UTAMA
    return Scaffold(
        appBar: AppBar( //TODO: APPBAR (UNTUK JUDUL)
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center, //todo: TEXT ALIGNMENT DI TENGAH
            children: [
              Icon(Icons.restaurant_menu), //TODO: IKON, SPASI DAN TEKS DI APPBAR
              SizedBox(width: 10),
              Text('Resep Makanan')
            ],
          ),
        ),
        body: _isLoading //TODO: MENAMBAHKAN INDIKATOR LOADING
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
          itemCount: _recipes.length,
          itemBuilder: (context, index) {
            return RecipeCard( //TODO: MEMBUAT LIST BERBENTUK KARTU UNTUK LIST RESEP
                title: _recipes[index].name,
                cookTime: _recipes[index].totalTime,
                rating: _recipes[index].rating.toString(),
                thumbnailUrl: _recipes[index].images);
          },
        ));
  }
}