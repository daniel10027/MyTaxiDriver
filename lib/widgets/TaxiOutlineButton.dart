import 'package:flutter/material.dart';
import '../brand_colors.dart';

class TaxiOutlineButton extends StatelessWidget {
  late final String title;
  late final Color color;
  final VoidCallback onPressed;

  // ignore: non_constant_identifier_names
  TaxiOutlineButton({
    required this.title,
    required this.onPressed,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  side: BorderSide(color: Colors.white))),
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) return Colors.white;
              return Colors.white;
            },
          ),
        ),
        child: Container(
          height: 50,
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 18.0,
                  fontFamily: 'Brand-Bold',
                  color: Colors.black),
            ),
          ),
        ),
        onPressed: onPressed);
  }
}
