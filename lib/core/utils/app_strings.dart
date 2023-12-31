abstract class AppStrings {
  // App Configurations
  static const String appName = 'MealSnap';

  // .env keys
  static const String envApiKey = 'API_KEY';
  static const String envAppWriteProjectId = 'APPWRITE_PROJECT_ID';
  static const String envAppWriteApiKey = 'APPWRITE_API_KEY';

  // Hive
  static const String favoriteBox = 'Favorite';

  // shared preferences keys
  static const String keyNameAppLanguage = 'app_language';
  static const String prefsId = 'id';
  static const String prefsToken = 'token';

  // API
  static const String apiKey = "apiKey";

  // API end-points
  static const String apiBaseUrl = 'https://api.spoonacular.com/';
  static const String apiRandomEndPoint = 'random';
  static const String apiRecipesEndPoint = 'recipes';
  static const String apiInformationEndPoint = 'information';
  static const String apiSimilarEndPoint = 'similar';
  static const String apiComplexSearchEndPoint = 'complexSearch';
  static const String apiAutoCompleteEndPoint = 'autocomplete';
  static const String apiEquipmentsEndPoint = 'equipmentWidget.json?';
  static const String apiNutritionEndPoint = 'nutritionWidget.json?';

  static const String apiCode = 'code';
  static const String apiToken = 'token';
  static const String apiEquipment = 'equipment';

  // API query parameters
  static const String query = 'query';
  static const String number = 'number';

  // API response keys
  static const String results = 'results';

  // app write API
  static const String appWriteEndPoint = "https://cloud.appwrite.io/v1";
  static const String appWriteEmail = 'email';
  static const String appWritePassword = 'password';
  static const String appWriteConfirmPassword = 'confirmPassword';

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

  // food types
  static const String foodTypeBreakfast = 'breakfast';
  static const String foodTypeLunch = 'lunch';
  static const String foodTypeDrinks = 'drinks';
  static const String foodTypePizza = 'pizza';
  static const String foodTypeBurgers = 'burgers';
  static const String foodTypeCake = 'cake';
  static const String foodTypeRice = 'rice';

  // search screen
  static const String searchRecipesByCategories = 'Recipes by categories';
  static const String recentSearchesByPeople = "Recent searches by people";

  // error messages
  static const String noDataFound = 'No data found';
  static const String noInternetConnection = 'No internet connection';
  static const String somethingWentWrong = 'Something went wrong';

  // App General Strings
  static const String search = 'Search';

  // meal types
  static const String appetizer = "appetizer";
  static const String beverage = "beverage";
  static const String bread = "bread";
  static const String breakfast = "breakfast";
  static const String dessert = "dessert";
  static const String drink = "drink";
  static const String fingerFood = "fingerfood";
  static const String mainCourse = "main course";
  static const String marinade = "marinade";
  static const String salad = "salad";
  static const String sauce = "sauce";
  static const String sideDish = "side dish";
  static const String snack = "snack";
  static const String soup = "soup";

  // home types app bar
  static const String baking = "Baking";
  static const String burgers = "Burgers";
  static const String chicken = "Chicken";
  static const String desserts = "Desserts";
  static const String duck = "Duck";
  static const String drinks = "Drinks";
  static const String lamb = "Lamb";
  static const String meat = "Meat";
  static const String mince = "Mince";
  static const String noodles = "Noodles";
  static const String pasta = "Pasta";
  static const String pies = "Pies";
  static const String pizza = "Pizza";
  static const String pork = "Pork";
  static const String poultry = "Poultry";
  static const String rice = "Rice";
  static const String salads = "Salads";
  static const String sauces = "Sauces";
  static const String seafood = "Seafood";
  static const String sides = "Sides";
  static const String sausages = "sausages";
  static const String snacks = "Snacks";
  static const String soups = "Soups";
  static const String stirFry = "Stir Fry";
  static const String turkey = "Turkey";
  static const String vegetarian = "Vegetarian";
}
