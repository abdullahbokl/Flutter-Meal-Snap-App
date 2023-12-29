import '../../../../core/common/models/recipe/equipment.dart';
import '../../../../core/common/models/recipe/nutrients.dart';
import '../../../../core/common/models/recipe/recipe_model.dart';
import '../../../../core/common/models/recipe/similar_list.dart';

class RecipeInfoScreenModel {
  final RecipeInfoModel recipeInfoModel;
  final List<SimilarModel> similarList;
  final List<EquipmentModel> equipmentsList;
  final NutrientModel nutrientModel;

  RecipeInfoScreenModel({
    required this.recipeInfoModel,
    required this.similarList,
    required this.equipmentsList,
    required this.nutrientModel,
  });
}
