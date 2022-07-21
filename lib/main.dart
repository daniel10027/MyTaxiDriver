import 'package:driver/globalvariables.dart';
import 'package:driver/screens/loginpage.dart';
import 'package:driver/screens/mainpage.dart';
import 'package:driver/screens/registration.dart';
import 'package:driver/screens/vehiculeinfo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb;
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'package:geolocator/geolocator.dart';

Future<LocationPermission> permission = Geolocator.requestPermission();

const USE_DATABASE_EMULATOR = false;
const emulatorPort = 9000;
final emulatorHost =
    (!kIsWeb && defaultTargetPlatform == TargetPlatform.android)
        ? '10.0.2.2'
        : 'localhost';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  if (USE_DATABASE_EMULATOR) {
    FirebaseDatabase.instance.useDatabaseEmulator(emulatorHost, emulatorPort);
  }

  User? currentFirebaseUser = await FirebaseAuth.instance.currentUser;

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute:
            (currentFirebaseUser == null) ? LoginPage.id : MainPage.id,
        routes: {
          MainPage.id: (context) => MainPage(),
          LoginPage.id: (context) => LoginPage(),
          RegistrationPage.id: (context) => RegistrationPage(),
          VehiculeInfoPage.id: (context) => VehiculeInfoPage(),
        });
  }
}
