// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:income_life/ui/common/app_colors.dart';

Future<bool?> baseShowDialog({
  required BuildContext context,
  required String title,
  Widget? widget,
}) async {
  final isConfirm = await showDialog<bool>(
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
            onPressed: () async {
              // Loading
              showProgressDialog(context);
              await Future<dynamic>.delayed(const Duration(seconds: 1));
              Navigator.pop(context);
              Navigator.pop(context, true);
            },
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
  return isConfirm;
}

void showProgressDialog(BuildContext context) {
  showGeneralDialog(
    context: context,
    barrierDismissible: false,
    transitionDuration: const Duration(milliseconds: 300),
    barrierColor: AppColors.black.withOpacity(0.5),
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
