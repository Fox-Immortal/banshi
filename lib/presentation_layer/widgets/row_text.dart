import 'package:flutter/material.dart';
class RowText extends StatelessWidget {
  const RowText({
    Key? key,
    required this.height,
    required this.text,
  }) : super(key: key);

  final double height;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Text(
          text,
          style: TextStyle(
              fontSize: height * 0.025,
              color: Colors.black,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}