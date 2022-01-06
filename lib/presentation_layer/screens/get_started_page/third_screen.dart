import 'package:flutter/material.dart';
import 'package:panshi/constant/my_colors.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    TextStyle boldTextStyle = TextStyle(
        color: MyColors.myBlack,
        fontSize: height * 0.045,
        overflow: TextOverflow.ellipsis,
        fontWeight: FontWeight.w600);
    TextStyle normalTextStyle = TextStyle(
        color: MyColors.myBlack,
        fontSize: height * 0.024,
        letterSpacing: 2,
        inherit: true,
        overflow: TextOverflow.ellipsis,
        fontWeight: FontWeight.w500);
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/third.jpg"),
              fit: BoxFit.fitHeight,
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: height * 0.45,
            ),
            Text(
              "Add point in life",
              style: boldTextStyle,
            ),
            SizedBox(
              height: height * 0.05,
            ),
            Text(
              "We will make you even brighter and more\n stunning. Get high from life with us!",
              maxLines: 3,
              textAlign: TextAlign.center,
              style: normalTextStyle,
            ),
            SizedBox(
              height: height * 0.25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: width*0.8,
                    height: height*0.06,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(
                            context, '/log');
                      },
                      child: Text(
                        "LET'S GO",
                        style:TextStyle(
                            color: MyColors.myWhite,
                            fontSize: height * 0.025,
                            letterSpacing: 2,
                            inherit: true,
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: MyColors.myBlack,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                          elevation: 5,
                          shadowColor:MyColors.myOrange
                      ),
                    ),
                  ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
