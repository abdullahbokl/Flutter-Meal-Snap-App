import '../../../../core/common/models/recipe/equipment.dart';
import '../../../../core/common/models/recipe/nutrients.dart';
import '../../../../core/common/models/recipe/recipe_model.dart';
import '../../../../core/common/models/recipe/similar_list.dart';

class RecipeInfoScreenModel {
  final RecipeInfoModel info;
  final List<Similar> similarList;
  final List<Equipment> equipment;
  final Nutrient nutrient;

  RecipeInfoScreenModel({
    required this.info,
    required this.similarList,
    required this.equipment,
    required this.nutrient,
  });
}
