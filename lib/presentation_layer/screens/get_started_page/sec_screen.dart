import 'package:flutter/material.dart';
import 'package:panshi/constant/my_colors.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    TextStyle boldTextStyle = TextStyle(
        color: MyColors.myWhite,
        fontSize: height * 0.045,
        overflow: TextOverflow.ellipsis,
        fontWeight: FontWeight.w600);
    TextStyle normalTextStyle = TextStyle(
        color: MyColors.myWhite,
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
              image: AssetImage("assets/images/first.jpg"),
              fit: BoxFit.fitHeight,
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: height * 0.35,
            ),
            Text(
              "Security",
              style: boldTextStyle,
            ),
            SizedBox(
              height: height * 0.05,
            ),
            Text(
              "We deliver the goods safe and sound,\n you don't have to worry about your money",
              maxLines: 3,
              textAlign: TextAlign.center,
              style: normalTextStyle,
            ),
            SizedBox(
              height: height * 0.35,
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
                            context, '/thirdScreen');
                      },
                      child: Text(
                        "NEXT",
                        style:TextStyle(
                            color: MyColors.myBlack,
                            fontSize: height * 0.025,
                            letterSpacing: 2,
                            inherit: true,
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: MyColors.myWhite,
                          elevation: 10,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),

                          shadowColor:MyColors.myWhite
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
