// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Project imports:
import 'app_colors.dart';

Future<bool?> baseShowDialog({
  required BuildContext context,
  required String title,
  GlobalKey<FormState>? formKey,
  Widget? widget,
}) async {
  final isConfirm = await showDialog<bool>(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      final navigator = Navigator.of(context);
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
              if (formKey?.currentState!.validate() ?? false) {
                showProgressDialog(context);
                await Future<dynamic>.delayed(const Duration(seconds: 1));
                navigator
                  ..pop()
                  ..pop(true);
              }
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
