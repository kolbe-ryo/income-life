// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<bool?> baseShowDialog({
  required BuildContext context,
  required String title,
  GlobalKey<FormState>? formKey,
  Widget? widget,
  bool isSimpleDialog = false,
}) async {
  final isConfirm = await showDialog<bool>(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return CupertinoAlertDialog(
        title: Text(title),
        content: widget,
        actions: [
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () => Navigator.pop(context, false),
            child: const Text('キャンセル'),
          ),
          CupertinoDialogAction(
            onPressed: () {
              if (formKey?.currentState!.validate() ?? false || isSimpleDialog) {
                Navigator.pop(context, true);
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
