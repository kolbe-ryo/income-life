// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Project imports:
import '../../generated/l10n.dart';

Future<bool?> baseShowDialog({
  required BuildContext context,
  required String title,
  GlobalKey<FormState>? formKey,
  Widget? widget,
  bool isSimpleDialog = false,
  bool isOnlyClose = false,
}) async {
  final isConfirm = await showDialog<bool>(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return CupertinoAlertDialog(
        title: Text(title),
        content: widget,
        actions: [
          if (!isOnlyClose)
            CupertinoDialogAction(
              isDestructiveAction: true,
              onPressed: () => Navigator.pop(context, false),
              child: Text(S.of(context).cancel),
            ),
          if (!isOnlyClose)
            CupertinoDialogAction(
              onPressed: () {
                if (formKey?.currentState!.validate() ?? false || isSimpleDialog) {
                  Navigator.pop(context, true);
                }
              },
              child: Text(S.of(context).ok),
            ),
          if (isOnlyClose)
            CupertinoDialogAction(
              onPressed: () => Navigator.pop(context, true),
              child: Text(S.of(context).close),
            ),
        ],
      );
    },
  );
  return isConfirm;
}
