// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<bool?> baseShowDialog({
  required BuildContext context,
  required String title,
  Widget? widget,
}) async {
  return showDialog(
    context: context,
    builder: (context) {
      return CupertinoAlertDialog(
        title: Text(title),
        content: widget,
        actions: <Widget>[
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () => Navigator.pop(context, false),
            child: const Text('キャンセル'),
          ),
          CupertinoDialogAction(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}

void showProgressDialog(BuildContext context) {
  showGeneralDialog(
    context: context,
    barrierDismissible: false,
    transitionDuration: const Duration(milliseconds: 300),
    barrierColor: Colors.black.withOpacity(0.5),
    pageBuilder: (
      BuildContext context,
      Animation<dynamic> animation,
      Animation<dynamic> secondaryAnimation,
    ) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    },
  );
}
