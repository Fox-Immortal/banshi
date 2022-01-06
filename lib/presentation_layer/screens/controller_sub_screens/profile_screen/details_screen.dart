import 'package:flutter/material.dart';
import 'package:panshi/business_logic_layer/authentication/data/providers/user_provider.dart';
import 'package:panshi/constant/my_colors.dart';
import 'package:panshi/presentation_layer/widgets/row_text.dart';
import 'package:provider/provider.dart';



class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title:const Text("Your Profile"),
        centerTitle: false,
        leading: IconButton(onPressed: (){Navigator.of(context).pop();},icon: const Icon(Icons.arrow_back,color: Colors.white,),),
      ),
      body: Column(
        children: [
          RowText(height: height, text: "Your name"),
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              Provider.of<UserProvider>(context,listen: false).name as String,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: MyColors.myGray, fontSize: height * 0.025,fontWeight: FontWeight.bold),
            ),
          ),
          RowText(height: height, text: "Your email"),
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              Provider.of<UserProvider>(context,listen: false).email as String,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: MyColors.myGray, fontSize: height * 0.025,fontWeight: FontWeight.bold),
            ),
          ),
          RowText(height: height, text: "Login type"),
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              Provider.of<UserProvider>(context,listen: false).loginType as String,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: MyColors.myGray, fontSize: height * 0.025,fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
