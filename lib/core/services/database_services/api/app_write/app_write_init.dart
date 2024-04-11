import 'package:appwrite/appwrite.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../../../utils/app_strings.dart';

Client appWriteInit() {
  final Client client = Client();

  // AppwriteException: general_unknown_origin, Invalid Origin. Register your new client (com.bokl.meal_snap) as a new Android platform on your project console dashboard (403)
  client
    ..setEndpoint(AppStrings.appWriteEndPoint)
    ..setProject(dotenv.env[AppStrings.envAppWriteProjectId]);

  return client;
}
