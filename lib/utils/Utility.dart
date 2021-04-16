
import 'package:aesthenics/providers/tab_provider.dart';
import 'package:aesthenics/utils/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Utility {
  static showLoaderDialogDismissible(BuildContext context, String message) {
    AlertDialog alert = AlertDialog(
      content: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(),
          Container(
              margin: EdgeInsets.all(
                  MediaQuery.of(context).size.width * (2.66 / 100)),
              child: Text(
                message,
                textAlign: TextAlign.center,
              )),
        ],
      ),
    );
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  static showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(),
          Container(
              margin: EdgeInsets.all(
                  MediaQuery.of(context).size.width * (2.66 / 100)),
              child: Text(Constants.loading)),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  static showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
    );
  }

  static bool isValidEmail(String emailText) {
    if (emailText.isEmpty) {
      return false;
    }
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = new RegExp(p);

    return regExp.hasMatch(emailText);
  }

  static hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(new FocusNode());
  }

  static bool isValidPassword(String passwordText) {
    if (passwordText.length >= 5) {
      return true;
    }
    return false;
  }

  static bool isValidChangePassword(
      String currentPasswordText, String passwordText) {
    if (currentPasswordText.length >= 5 &&
        currentPasswordText == passwordText) {
      return true;
    }
    return false;
  }

  static bool isValidMobile(String mobileText) {
    if (mobileText.trim().length == 10) {
      return true;
    }
    return false;
  }

  static bool isValidOtp(String otpText) {
    if (otpText.trim().length == 6) {
      return true;
    }
    return false;
  }

  static bool isValidAadhar(String otpText) {
    if (otpText.trim().length == 12) {
      return true;
    }
    return false;
  }

  static bool isValidName(String name) {
    if (name.length > 2) {
      return true;
    } else {
      return false;
    }
  }

/*  static void clearData(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    Provider.of<TabIndex>(context,listen: false).setIndex(2);
    Navigator.pushReplacement(
        context, new MaterialPageRoute(builder: (context) => LoginPage()));
  }

  static void launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw Constants.could_not_launch + url;
    }
  }*/

  static String imageDir(BuildContext context, String fileName) {
    // String prefix = Constants.asset_path;
    MediaQueryData data = MediaQuery.of(context);
    double pixelRatio = data.devicePixelRatio;
    bool isIOS = Theme.of(context).platform == TargetPlatform.iOS;
    String directory = '/';
    if (!isIOS) {
      if (pixelRatio >= 1.5) {
        directory = '/2.0x/';
      } else if (pixelRatio >= 2.0) {
        directory = '/3.0x/';
      }
      /*
      else if (pixelRatio >= 2.5) {
        directory = '/4.0x/';
      }
      else if (pixelRatio >= 3.5) {
        directory = '/5.0x/';
      }*/
    }
    // return '$prefix$directory$fileName';
    return Constants.asset_path + directory + fileName;
  }

  static double getVerticalValue(var _data, double _value) {
    return _data * ((_value * 100) / 947 / 100);
  }

  static double getHorizontalValue(var _data, double _value) {
    return _data * ((_value * 100) / 375 / 100);
  }

  static double getPercent(var _data, double _value) {
    return _data * (_value / 100);
  }

  static double getBmiRange(double weight, double height) {
    return weight / ((height * 0.01) * (height * 0.01));
  }
}
