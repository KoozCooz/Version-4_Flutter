import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:herbalens/firebase_options.dart';
import 'package:herbalens/ui/screens/Root%20page/Notifications/message.dart';
import 'package:herbalens/ui/screens/Root%20page/Notifications/notifications.dart';
import 'package:herbalens/ui/screens/Dashboard/home_page.dart';
import 'package:herbalens/ui/screens/Account/signup_page.dart';
import 'package:herbalens/ui/screens/Account/signin_page.dart';
import 'package:herbalens/ui/onboarding_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:herbalens/ui/screens/detail_page.dart';
import 'package:herbalens/ui/screens/termscons.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'ui/screens/Root page/root_page.dart';

final navigatorKey = GlobalKey<NavigatorState>();

SharedPreferences? prefs;

Future _firebaseBackgroundMessage(RemoteMessage message) async {
  if (message.notification != null) {
    print("Some notification Received");
  }
}

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  loadSavedPlants();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // on background notification tapped
  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    if (message.notification != null) {
      print("Background Notification Tapped");
      navigatorKey.currentState!.pushNamed("/message", arguments: message);
    }
  });

  PushNotifications.init();
  PushNotifications.localNotiInit();
  // Listen to background notifications
  FirebaseMessaging.onBackgroundMessage(_firebaseBackgroundMessage);

  // to handle foreground notifications
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    String payloadData = jsonEncode(message.data);
    print("Got a message in foreground");
    if (message.notification != null) {
      PushNotifications.showSimpleNotification(
          title: message.notification!.title!,
          body: message.notification!.body!,
          payload: payloadData);
    }
  });

  // for handling in terminated state
  final RemoteMessage? message =
      await FirebaseMessaging.instance.getInitialMessage();

  if (message != null) {
    print("Launched from terminated state");
    Fluttertoast.showToast(msg: "Lauched in Terminated State");
    Future.delayed(const Duration(seconds: 1), () {
      navigatorKey.currentState!.pushNamed("/message", arguments: message);
    });
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Onboarding Screen',
      // home: const OnboardingScreen(),

      home: FirebaseAuth.instance.currentUser == null
          ? const OnboardingScreen()
          : const RootPage(),
      // initialRoute:
      //     FirebaseAuth.instance.currentUser == null ? '/onboard' : '/home',
      debugShowCheckedModeBanner: false,
      routes: {
        '/onboard': (context) => const OnboardingScreen(),
        '/terms' : (context) => TermsAndConditionsScreen(),
        '/login': (context) => const SignIn(),
        '/signUp': (context) => const SignUp(),
        '/home': (context) => const HomePage(listofArticle: [],),
        '/message': (context) => const Message()
      },
    );
  }
}
//cristalkathy@gmail.com
//111111
