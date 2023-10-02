import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {


  static double avgMovieRating(List<num> ratinglist){
    double avgRating = 0;
    for(int rating=0;rating<ratinglist.length;rating++){
      avgRating +=ratinglist[rating];
    }
    return double.parse((avgRating/ratinglist.length).toStringAsFixed(1));
  }

  static void fieldFocusChange(
      BuildContext context, FocusNode current, FocusNode next) {
    current.unfocus();
    FocusScope.of(context).requestFocus(next);
  }

  static toastMessage(String message) {
    Fluttertoast.showToast(msg: message, toastLength: Toast.LENGTH_SHORT);
  }

  static void flushbarMessage(BuildContext context, String message) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        message: message,
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 2),
        flushbarPosition: FlushbarPosition.TOP,
        animationDuration: const Duration(seconds: 1),
        icon: const Icon(Icons.error),
        forwardAnimationCurve: Curves.bounceInOut,
        borderRadius: BorderRadius.circular(30),
        borderColor: Colors.black,
        margin: const EdgeInsets.all(10),
        messageColor: Colors.black,
      )..show(context),
    );
  }

  static snackbarMessage(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.green,
      content: Text(message),
      duration: const Duration(seconds: 1),
      padding: const EdgeInsets.all(20),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.zero,
              bottomRight: Radius.zero,
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15))),
    ));
  }
}
