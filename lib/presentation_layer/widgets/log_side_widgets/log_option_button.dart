
import 'package:flutter/material.dart';

class LogOptionButton extends StatelessWidget {
  const LogOptionButton({
    Key? key,
    required this.width,
    required this.height,
    required this.context,
    required this.text,
    required this.type,
    required this.primary,
    required this.onPrimary,
  }) : super(key: key);

  final double width;
  final double height;
  final BuildContext context;
  final String text;
  final int type;
  final Color primary;
  final Color onPrimary;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width * 0.8,
      height: height * 0.06,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/log1');
        },
        child: Text(
          text,
          style: TextStyle(
              color: onPrimary,
              fontSize: height * 0.025,
              letterSpacing: 2,
              inherit: true,
              overflow: TextOverflow.ellipsis,
              fontWeight: FontWeight.w500),
        ),
        style: ElevatedButton.styleFrom(
            primary: primary,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            elevation: 5,
            shadowColor: onPrimary),
      ),
    );
  }
}
