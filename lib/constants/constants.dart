import 'package:flutter/material.dart';
import 'package:housy_task/constants/size_config.dart';

const kPrimaryColor = Color.fromRGBO(254, 205, 0, 1);
const kPrimaryLightColor = Colors.white;
const kTextColor = Colors.black;
const Color appColor = Colors.orange;
Color? darkOrange = Colors.deepOrange[800];
Color? swiggyOrange = Colors.orange[900];
final RegExp emailValidatorRegExp =
RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";
final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);