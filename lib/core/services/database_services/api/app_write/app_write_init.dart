import 'package:appwrite/appwrite.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../../../utils/app_strings.dart';

Client appWriteInit() {
  final Client client = Client();

  client
    ..setEndpoint(AppStrings.appWriteEndPoint)
    ..setProject(dotenv.env[AppStrings.envAppWriteProjectId]);

  return client;
}
