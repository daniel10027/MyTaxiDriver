import 'package:flutter/material.dart';
import '../brand_colors.dart';

class AvailabilityButton extends StatelessWidget {
  late final String title;
  late final Color color;
  final VoidCallback onPressed;

  // ignore: non_constant_identifier_names
  AvailabilityButton({
    required this.title,
    required this.onPressed,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                  side: BorderSide(color: color))),
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) return color;
              return color;
            },
          ),
        ),
        child: Container(
          height: 50,
          width: 200,
          child: Center(
            child: Text(
              title,
              style: TextStyle(fontSize: 20, fontFamily: 'Brand-Bold'),
            ),
          ),
        ),
        onPressed: onPressed);
  }
}
