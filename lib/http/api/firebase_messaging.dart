import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseMessagingService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initializeFirebaseMessaging() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      // Handle notification when the app is in the foreground
      print("On Message: $message");
      // Add your logic to display the notification
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      // Handle notification when the app is opened from the background
      print("On Launch: $message");
      // Add your logic as needed
    });

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    await _firebaseMessaging.requestPermission();
    String? token = await _firebaseMessaging.getToken();
    print("FCM Token: $token");
  }

  Future<void> subscribeToTopic(String topic) async {
    await _firebaseMessaging.subscribeToTopic(topic);
  }
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // Handle notification when the app is in the background
  print("On Resume: $message");
  // Add your logic as needed
}
