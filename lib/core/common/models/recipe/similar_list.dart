class SimilarModel {
  final String id;
  final String name;
  final String image;
  final String readyInMinutes;
  final String servings;
  SimilarModel({
    required this.id,
    required this.name,
    required this.image,
    required this.readyInMinutes,
    required this.servings,
  });
  factory SimilarModel.fromJson(json) {
    return SimilarModel(
      id: json['id'].toString(),
      name: json['title'] ?? '',
      image:
          "https://spoonacular.com/recipeImages/${json['id']}-556x370.${json['imageType']}",
      readyInMinutes: json['readyInMinutes'].toString(),
      servings: json['servings'].toString(),
    );
  }
}

class SimilarList {
  final List<SimilarModel> list;
  SimilarList({
    required this.list,
  });

  factory SimilarList.fromJson(List<dynamic> json) {
    return SimilarList(
      list: json.map((data) => SimilarModel.fromJson(data)).toList(),
    );
  }
}
