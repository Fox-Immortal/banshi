
import 'package:flutter/material.dart';
import 'package:panshi/business_logic_layer/authentication/data/providers/user_provider.dart';
import 'package:panshi/constant/my_colors.dart';
import 'package:panshi/data_layer/web_services/email_services/email_services.dart';
import 'package:panshi/data_layer/web_services/google_services/google_services.dart';
import 'package:panshi/presentation_layer/screens/controller_sub_screens/profile_screen/details_screen.dart';
import 'package:panshi/presentation_layer/screens/controller_sub_screens/profile_screen/order_screen.dart';
import 'package:panshi/presentation_layer/screens/log_option/log_option_screen/log_option_screen.dart';
import 'package:panshi/presentation_layer/widgets/row_text.dart';
import 'package:provider/provider.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return  Scaffold(
      body: Column(
        children: [
          SizedBox(height:height*0.01 ,),
          profileOption(width, height*0.1,"Your Details",height*0.025,onPressDetails),
          profileOption(width, height*0.1,"Your Orders",height*0.025,onPressOrder),
          profileOption(width, height*0.1,"Log Out",height*0.025,onPressLogout),
        ],
      ),
    );
  }
  onPressDetails(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>const DetailsScreen()));
  }
  onPressOrder(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>const OrderScreen()));
  }
  onPressLogout()async{
    if(Provider.of<UserProvider>(context,listen: false).loginType=="Google"){
      await GoogleService().signOutGoogle(context).then((value) async {
        removeProviderData(context);
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) =>
            const LoginOptionScreen()));
      });
    }else{
      await EmailSignServices().userLogOut(context).then((value) async {
        removeProviderData(context);
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) =>
            const LoginOptionScreen()));
      });
    }
  }
  Widget profileOption(double width,double height,String text,double fontSize,VoidCallback onPress){
    return Container(
      padding:const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      height: height,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.black,
          elevation: 10
        ),
        onPressed: onPress,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(text,style: TextStyle(fontSize: fontSize),)
            ],
          ),
        ),
      ),
    );
  }
  removeProviderData(context) {
    setState(() {
      Provider.of<UserProvider>(context, listen: false).email = "";
      Provider.of<UserProvider>(context, listen: false).isVerify = false;
      Provider.of<UserProvider>(context, listen: false).uid = "";
      Provider.of<UserProvider>(context, listen: false).name = "";
      Provider.of<UserProvider>(context, listen: false).number = "";
      Provider.of<UserProvider>(context, listen: false).loginType = "";
    });
  }
}
