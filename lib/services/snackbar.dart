import 'package:flutter/material.dart';


showSnackBar(String status, BuildContext context) {
  final snackBar = SnackBar(
      duration: Duration(milliseconds: 1250),
      content: Text(
        status,
            ));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

showSelectPhotoSnackBar(BuildContext context) {
  final snackBar = SnackBar(
    content: Text(
      'Please select a photo!',
      
    ),
    duration: Duration(milliseconds: 750),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

popNavigator(BuildContext context) {
  Navigator.pop(context);
}
