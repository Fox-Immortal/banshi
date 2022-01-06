import 'package:flutter/material.dart';
import 'package:panshi/data_layer/web_services/google_services/google_services.dart';

class OptionButton extends StatelessWidget {
  final String optionText;
  final IconData optionIcon;
  final int optionType;
  const OptionButton(
      {Key? key,
      required this.optionText,
      required this.optionIcon,
      required this.optionType})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height * 0.07,
      width: width * 0.7,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: Colors.black,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            elevation: 10),
        onPressed:optionType==0?(){
          Navigator.pushNamed(context, '/login');
        }:
            ()async {
              await GoogleService().signInWithGoogle(context);
            },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(optionIcon),
            const SizedBox(
              width: 10,
            ),
            Text(
              optionText,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: height * 0.025),
            ),
          ],
        ),
      ),
    );
  }
}
