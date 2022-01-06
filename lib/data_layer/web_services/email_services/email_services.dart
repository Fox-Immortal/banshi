import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:panshi/business_logic_layer/authentication/data/providers/cart_provider.dart';
import 'package:panshi/business_logic_layer/authentication/data/providers/user_provider.dart';
import 'package:panshi/data_layer/web_services/firebase_firestore_services.dart';
import 'package:panshi/presentation_layer/widgets/popup/popup.dart';
import 'package:provider/provider.dart';
class EmailSignServices {
  User? user = FirebaseAuth.instance.currentUser;
  CollectionReference addUser = FirebaseFirestore.instance.collection("User");


  verifyEmail(
      {var context,
        String? email,
        String? password,
        String? name,
        String? phone}) async {
    if (!user!.emailVerified) {
      await user!.sendEmailVerification().then((value) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return const PopUp(errorText: "Verification email sent");
            });
      });
    }
    addUser.add({
      'email': email,
      'name': name,
      'phone': phone,
      'uid': "",
      'love':[]
    }).then((value) => value.get().then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        addUser
            .doc(documentSnapshot.id)
            .update({'uid': documentSnapshot.id});
      }
    }));

    Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
  }

  registration(
      {var context,
        String? password,
        String? phone,
        String? email,
        String? name}) async {
    if (password!.isNotEmpty) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: email as String, password: password);
        verifyEmail(
          email: email,
          name: name,
          password: password,
          phone: phone,
          context: context,
        );
      } on FirebaseAuthException catch (error) {
        if (error.code == 'weak-password') {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return const PopUp(errorText: "Weak password");
              });
        } else if (error.code == 'email-already-in-use') {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return const PopUp(errorText: "Email already in use");
              });
        }
      }
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return const PopUp(errorText: "Fill the require");
          });
    }
  }

  userLogOut(context) async {
    try {
      await FirebaseAuth.instance.signOut().then((value) {
        Provider.of<CartItemsProvider>(context,listen: false).total=0;
        Provider.of<CartItemsProvider>(context,listen: false).length=0;
        Provider.of<CartItemsProvider>(context,listen: false).cartItems= {};
      });
    } on FirebaseAuthException catch (error) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return const PopUp(errorText: "Log out fail");
          });
    }
  }

  userLogin({var context, String? email, String? password}) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email as String, password: password as String);
      if (user!.emailVerified) {
        await FirebaseFirestore.instance
            .collection('User')
            .get()
            .then((QuerySnapshot querySnapshot) {
          for (var doc in querySnapshot.docs) {
            if (doc['email'] == email) {
              List<String>tempLove=[];
              for (String element in doc['love']) {
                tempLove.add(element);
              }
              Provider.of<UserProvider>(context, listen: false).email =
              doc['email'];
              Provider.of<UserProvider>(context, listen: false).name =
              doc['name'];
              Provider.of<UserProvider>(context, listen: false).uid =
              doc['uid'];
              Provider.of<UserProvider>(context, listen: false).number =
              doc['phone'];
              Provider.of<UserProvider>(context, listen: false).loveId =tempLove;
              Provider.of<UserProvider>(context, listen: false).isVerify = true;
              Provider.of<UserProvider>(context, listen: false).loginType =
              "email";
              break;
            }
          }
        });
        await FirebaseFirestoreServices().getItemsData();
        await FirebaseFirestoreServices().getOrdersData(context);
        Navigator.pushNamedAndRemoveUntil(context, '/controller', (route) => false);
        return true;
      } else {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return const PopUp(errorText: "Verification email was sent");
            });
        return false;
      }
    } on FirebaseAuthException catch (error) {
      if (error.code == 'user-not-found') {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return const PopUp(errorText: "No user found for this email");
            });
      } else if (error.code == 'wrong-password') {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return const PopUp(errorText: "Wrong Password");
            });
      }
      return false;
    }
  }

  verifyEmailWhenSign({var context, String? email}) async {
    if (user != null && !user!.emailVerified) {
      await user!.sendEmailVerification();
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return const PopUp(errorText: "Verification email sent");
          });
    }
  }
}
