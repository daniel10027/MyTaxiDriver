import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:driver/brand_colors.dart';
import 'package:driver/screens/mainpage.dart';
import 'package:driver/widgets/TaxiButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class VehiculeInfoPage extends StatelessWidget {
  static const String id = 'vehiculeinfo';
  var carModelController = TextEditingController();
  var carColorController = TextEditingController();
  var vehiculeNumberController = TextEditingController();

  void updateProfile(context) {
    String id = FirebaseAuth.instance.currentUser!.uid;
    DatabaseReference driverRef =
        FirebaseDatabase.instance.ref().child('drivers/$id/vehicule_details');

    Map map = {
      'car_color': carColorController.text,
      'car_model': carModelController.text,
      'vehicule_number': vehiculeNumberController.text,
    };
    driverRef.set(map);
    Navigator.pushNamedAndRemoveUntil(context, MainPage.id, (route) => false);
  }

  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  void showSnack(String title) {
    final snackbar = SnackBar(
        content: Text(
      title,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 15,
      ),
    ));
    scaffoldMessengerKey.currentState?.showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: scaffoldMessengerKey,
      child: Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Image.asset(
              'images/logo.png',
              height: 110,
              width: 110,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Entrez les détails du véhicule',
                    style: TextStyle(fontFamily: 'Brand-Bold', fontSize: 22.0),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextField(
                    controller: carModelController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: 'Modèle du véhicule',
                        hintStyle:
                            TextStyle(color: Colors.grey, fontSize: 10.0)),
                    style: TextStyle(fontSize: 14.0),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextField(
                    controller: carColorController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: 'Couleur du véhicule',
                        hintStyle:
                            TextStyle(color: Colors.grey, fontSize: 10.0)),
                    style: TextStyle(fontSize: 14.0),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextField(
                    maxLength: 11,
                    controller: vehiculeNumberController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: 'Immatriculation du véhicule',
                        hintStyle:
                            TextStyle(color: Colors.grey, fontSize: 10.0)),
                    style: TextStyle(fontSize: 14.0),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  TaxiButton(
                    title: 'Enregistrer',
                    color: BrandColors.colorGreen,
                    onPressed: () async {
                      var connectivityResult =
                          await (Connectivity().checkConnectivity());

                      if (connectivityResult != ConnectivityResult.mobile &&
                          connectivityResult != ConnectivityResult.wifi) {
                        showSnack('Aucune connexion Internet ');
                        return;
                      }

                      if (carModelController.text.length < 3) {
                        showSnack('Veuillez saisir un model valide svp !');
                        return;
                      }

                      if (carColorController.text.length < 3) {
                        showSnack('Veuillez saisir une couleur valide svp !');
                        return;
                      }

                      if (vehiculeNumberController.text.length < 3) {
                        showSnack('Veuillez saisir un matricule valide svp !');
                        return;
                      }

                      updateProfile(context);
                    },
                  ),
                ],
              ),
            ),
          ],
        ))),
      ),
    );
  }
}
