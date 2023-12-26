abstract class AppStrings {
  // API
  static const String apiBaseUrl = 'https://api.spoonacular.com/recipes/';
  static const String apiRandom = 'random';
  static const String apiRecipes = 'recipes';
  static const String apiEquipmentWidget = 'equipmentWidget.json?';
  static const String apiNutritionWidget = '/nutritionWidget.json?';
  static const String apiInformation = '/information?';
  static const String apiSimilar = '/similar?';

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

  // shared preferences keys
  static const String prefsId = 'id';
  static const String prefsToken = 'token';

  // .env keys
  static const String apiKey = 'API_KEY';
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
}
