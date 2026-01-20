import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _fln =
      FlutterLocalNotificationsPlugin();

  var fcmToken = ''.obs;
  var title = ''.obs;
  var body = ''.obs;
  var imageUrl = ''.obs;

  @override
  void onInit() {
    super.onInit();
    initNotifications();
  }

  void initNotifications() async {
    await _fcm.requestPermission();

    String? token = await _fcm.getToken();
    fcmToken.value = token ?? 'Token tidak ditemukan';
    print('FCM Token : $token');

    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const InitializationSettings initSettings = InitializationSettings(
      android: androidSettings,
    );
    await _fln.initialize(initSettings);

    FirebaseMessaging.onMessage.listen((message) {
      title.value = message.notification?.title ?? 'Tanpa judul';
      body.value = message.notification?.body ?? 'Tanpa isi';
      imageUrl.value = message.notification?.android?.imageUrl ??
          message.data['image'] ??
          '';
      print('Pesan diterima (foreground): $title - $body');

      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        _fln.show(
          notification.hashCode,
          notification.title,
          notification.body,
          const NotificationDetails(
            android: AndroidNotificationDetails(
              'channel_id',
              'channel_name',
              importance: Importance.max,
              priority: Priority.high,
            ),
          ),
        );
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      title.value = message.notification?.title ?? 'Dibuka: tanpa judul';
      body.value = message.notification?.body ?? 'Dibuka: tanpa isi';
      imageUrl.value = message.notification?.android?.imageUrl ??
          message.data['image'] ??
          '';
      print('Pesan dibuka: $title - $body');
    });
  }
}
