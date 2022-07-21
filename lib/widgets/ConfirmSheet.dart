import 'package:driver/brand_colors.dart';
import 'package:driver/widgets/TaxiButton.dart';
import 'package:driver/widgets/TaxiOutlineButton.dart';
import 'package:flutter/material.dart';

class ConfirmSheet extends StatelessWidget {
  late final String title;
  late final String subtitle;
  final VoidCallback onPressed;

  ConfirmSheet({
    required this.title,
    required this.subtitle,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 15.0,
            spreadRadius: 0.5,
            offset: Offset(0.7, 0.7),
          )
        ],
      ),
      height: 220,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 18),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 22,
                  fontFamily: 'Brand-Bold',
                  color: BrandColors.colorText),
            ),
            SizedBox(
              height: 20,
            ),
            // ignore: prefer_const_constructors
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(color: BrandColors.colorText),
            ),
            // ignore: prefer_const_constructors
            SizedBox(
              height: 20,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: TaxiOutlineButton(
                        title: "ANNULER",
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        color: BrandColors.colorLightGrayFair),
                  ),
                ),
                // ignore: prefer_const_constructors
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Container(
                    child: TaxiButton(
                        title: "CONFIRMER",
                        onPressed: onPressed,
                        color: (title == "PASSER EN LIGNE")
                            ? BrandColors.colorGreen
                            : Colors.red),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
