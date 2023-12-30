abstract class AppStrings {
  static const String appName = 'MealSnap';

  // Hive
  static const String favoriteBox = 'Favorite';

  // API
  static const String apiKey = "apiKey";

  // API end points
  static const String apiBaseUrl = 'https://api.spoonacular.com/';
  static const String apiRandomEndPoint = 'random';
  static const String apiRecipesEndPoint = 'recipes';
  static const String apiInformationEndPoint = 'information';
  static const String apiSimilarEndPoint = 'similar';
  static const String apiComplexSearchEndPoint = 'complexSearch';
  static const String apiAutoCompleteEndPoint = 'autocomplete';
  static const String apiEquipmentsEndPoint = 'equipmentWidget.json?';
  static const String apiNutritionEndPoint = 'nutritionWidget.json?';

  // food types
  static const String foodTypeBreakfast = 'breakfast';
  static const String foodTypeLunch = 'lunch';
  static const String foodTypeDrinks = 'drinks';
  static const String foodTypePizza = 'pizza';
  static const String foodTypeBurgers = 'burgers';
  static const String foodTypeCake = 'cake';
  static const String foodTypeRice = 'rice';

  // app write
  static const String appWriteEndPoint = "https://cloud.appwrite.io/v1";
  static const String appWriteEmail = 'email';
  static const String appWritePassword = 'password';

  // Shared Preferences Keys
  static const String keyNameAppLanguage = 'app_language';

  // Api Keys
  static const String apiId = 'id';
  static const String apiEmail = 'email';
  static const String apiPassword = 'password';
  static const String apiConfirmPassword = 'confirmPassword';
  static const String apiCode = 'code';
  static const String apiMessage = 'message';
  static const String apiToken = 'token';
  static const String apiName = 'name';
  static const String apiDescription = 'description';
  static const String apiPrice = 'price';
  static const String apiCategory = 'category';
  static const String apiMealImages = 'mealImages';
  static const String apiHowToSell = 'howToSell';
  static const String apiEquipment = 'equipment';

  // shared preferences keys
  static const String prefsId = 'id';
  static const String prefsToken = 'token';

  // .env keys
  static const String envApiKey = 'API_KEY';
  static const String envAppWriteProjectId = 'APPWRITE_PROJECT_ID';
  static const String envAppWriteApiKey = 'APPWRITE_API_KEY';

  // sign up model
  static const String signUpModelName = 'name';
  static const String signUpModelEmail = 'email';
  static const String signUpModelPassword = 'password';

  // food model
  static const String foodModelId = 'id';
  static const String foodModelName = 'title';
  static const String foodModelImage = 'image';
  static const String foodModelReadyInMinutes = 'readyInMinutes';
  static const String foodModelServings = 'servings';

  // search result model
  static const String searchResultModelId = 'id';
  static const String searchResultModelName = 'title';
  static const String searchResultModelImage = 'image';

  // recipe info screen model
  static const String recipeInfoIngredientImageUrl =
      'https://spoonacular.com/cdn/ingredients_100x100/';
  static const String recipeInfoEquipmentImageUrl =
      "https://spoonacular.com/cdn/equipment_100x100/";
  static const String recipeInfoScreenModelIngredients = 'Ingredients';
  static const String recipeInfoScreenModelEquipments = 'Equipments';
  static const String recipeInfoConsistency = 'Consistency';
  static const String recipeInfoIngredientAisle = 'Aisle';
  static const String recipeInfoInstructions = 'Instructions';
  static const String recipeInfoSummary = 'Summary';
  static const String recipeInfoNutrients = 'Nutrients';
  static const String recipeInfoBadForHealthNutrients =
      'Bad for health Nutrients.';
  static const String goodForHealthNutrients = 'good for health Nutrients.';
  static const String recipeInfoSimilar = 'Similar';
  static const String recipeInfoCalories = 'Calories';
  static const String recipeInfoFat = 'Fat';
  static const String recipeInfoCarbohydrates = 'Carbohydrates';
  static const String recipeInfoProtein = 'Protein';

  // search auto complete model
  static const String searchAutoCompleteModelId = 'id';
  static const String searchAutoCompleteModelName = 'title';
  static const String searchAutoCompleteModelImage = 'image';
  static const String searchAutoCompleteModelImageType = 'imageType';

  // API query parameters
  static const String query = 'query';
  static const String number = 'number';

  // API response keys
  static const String results = 'results';
}
