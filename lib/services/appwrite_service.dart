import 'package:appwrite/appwrite.dart';

class AppwriteService {
  static final Client client = Client()
    ..setEndpoint('https://cloud.appwrite.io/v1')  // Replace with your Appwrite endpoint
    ..setProject('67f4c36e001fe49b3947')
    ..setSelfSigned(status: true); // Remove in production

  // Add your Appwrite services here
  static final Account account = Account(client);
  static final Databases databases = Databases(client);
  static final Storage storage = Storage(client);
  static final Realtime realtime = Realtime(client);

  // Singleton pattern
  AppwriteService._();
  static final AppwriteService instance = AppwriteService._();
} 