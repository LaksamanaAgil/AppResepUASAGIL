class Recipe {
  final String name; //TODO: MENETAPKAN VARIABEL-VARIABEL BESERTA KELAS-KELASNYA
  final String images;
  final double rating;
  final String totalTime;

  Recipe({this.name, this.images, this.rating, this.totalTime}); //TODO: MENGINISIALISASI VARJABEL

  factory Recipe.fromJson(dynamic json) { //TODO: MEMBUAT CONTSTRUCTOR FACTORY
    return Recipe( //TODO: MENGAMBIL DATA RESEP DARI API YUMMYL
        name: json['name'] as String,
        images: json['images'][0]['hostedLargeUrl'] as String,
        rating: json['rating'] as double,
        totalTime: json['totalTime'] as String);
  }

  static List<Recipe> recipesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Recipe.fromJson(data);
    }).toList();
  }

  @override
  String toString(){
    return 'Recipe {name: $name, image: $images, rating: $rating, totalTime: $totalTime}';
  }
}