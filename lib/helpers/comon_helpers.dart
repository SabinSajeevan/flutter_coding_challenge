import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

showLog(String msg) {
  debugPrint(msg);
}

showMessage(BuildContext context, String msg, {String type = "red"}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: type == "success" ? Colors.green : Colors.red,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      content: Text(
        msg,
        textAlign: TextAlign.center,
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
      ),
    ),
  );
}

Future<void> showProgress(BuildContext context) async {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const Center(
          child: CupertinoActivityIndicator(radius: 20),
        );
      });
}
