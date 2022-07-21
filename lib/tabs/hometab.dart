import 'dart:async';

import 'package:driver/brand_colors.dart';
import 'package:driver/globalvariables.dart';
import 'package:driver/widgets/AvailabilityButton.dart';
import 'package:driver/widgets/ConfirmSheet.dart';
import 'package:driver/widgets/TaxiButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_geofire/flutter_geofire.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeTab extends StatefulWidget {
  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  Completer<GoogleMapController> _controller = Completer();

  final LocationSettings locationSettings = LocationSettings(
    accuracy: LocationAccuracy.bestForNavigation,
    distanceFilter: 4,
  );

  late GoogleMapController mapController;

  late Position currentPosition;

  late DatabaseReference tripRequestRef;

  var geoLocator = Geolocator();

  late String availabilityTitle = "PASSER EN LIGNE";
  Color availabilityColor = BrandColors.colorOrange;
  bool isAvailable = false;

  void getCurrentPosition() async {
    LocationPermission permission = await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation);
    currentPosition = position;
    // Recuperation de la latitude et de la longitude de l'utilisateur
    LatLng pos = LatLng(position.latitude, position.longitude);
    // Modification de la position de la camera
    // CameraPosition cp = new CameraPosition(target: pos, zoom: 14);
    // Mise a jour de la posotion de la camera avec zoom in de 14
    mapController.animateCamera(CameraUpdate.newLatLng(pos));

    // String address =
    //     await HelperMethods.findCordinateAddress(position, context);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        GoogleMap(
          padding: EdgeInsets.only(top: 135),
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
          mapType: MapType.normal,
          initialCameraPosition: googlePlex,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
            mapController = controller;
            getCurrentPosition();
          },
        ),
        Container(
          height: 135,
          width: double.infinity,
          color: BrandColors.colorPrimary,
        ),
        Positioned(
          top: 60,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AvailabilityButton(
                title: availabilityTitle,
                onPressed: () {
                  // GoOnline();
                  // getLocationUpdates();
                  showModalBottomSheet(
                      isDismissible: false,
                      context: context,
                      builder: (BuildContext context) => ConfirmSheet(
                            title: (!isAvailable)
                                ? 'PASSER EN LIGNE'
                                : 'PASSER HORS LIGNE',
                            subtitle: (!isAvailable)
                                ? 'Vous serez marqué comme disponible pour recevoir des courses'
                                : 'Vous serez marqué comme indisponible pour recevoir des courses',
                            onPressed: () {
                              if (!isAvailable) {
                                GoOnline();
                                getLocationUpdates();
                                Navigator.pop(context);
                                setState(() {
                                  availabilityColor = BrandColors.colorGreen;
                                  availabilityTitle = "HORS LIGNE";
                                  isAvailable = true;
                                });
                              } else {
                                GoOffline();
                                Navigator.pop(context);
                                setState(() {
                                  availabilityColor = BrandColors.colorOrange;
                                  availabilityTitle = "EN LIGNE";
                                  isAvailable = false;
                                });
                              }
                            },
                          ));
                },
                color: availabilityColor,
              ),
            ],
          ),
        ),
      ],
    );
  }

  void GoOnline() {
    Geofire.initialize('driersAvailable');
    Geofire.setLocation(FirebaseAuth.instance.currentUser!.uid,
        currentPosition.latitude, currentPosition.longitude);

    tripRequestRef = FirebaseDatabase.instance
        .ref()
        .child('drivers/${FirebaseAuth.instance.currentUser!.uid}/newtrip');
    tripRequestRef.set("waiting");
    tripRequestRef.onValue.listen((event) {});
  }

  void GoOffline() {
    Geofire.removeLocation(FirebaseAuth.instance.currentUser!.uid);
    tripRequestRef.onDisconnect();
    tripRequestRef.remove();
  }

  void getLocationUpdates() {
    StreamSubscription<Position> homeTabPostionStream;

    homeTabPostionStream =
        Geolocator.getPositionStream(locationSettings: locationSettings)
            .listen((Position position) {
      currentPosition = position;
      if (isAvailable) {
        Geofire.setLocation(FirebaseAuth.instance.currentUser!.uid,
            currentPosition.latitude, currentPosition.longitude);
      }

      LatLng pos = LatLng(position.latitude, position.longitude);
      // Modification de la position de la camera
      // CameraPosition cp = new CameraPosition(target: pos, zoom: 14);
      // Mise a jour de la posotion de la camera avec zoom in de 14
      mapController.animateCamera(CameraUpdate.newLatLng(pos));
    });
  }
}
