// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'constants.dart';

abstract class BaseCard extends StatelessWidget {
  const BaseCard({super.key});

  void Function()? onTap(BuildContext context);

  Widget? innerTextWidget();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Card(
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kBorder),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(kBorder),
          onTap: onTap(context),
          child: Padding(
            padding: const EdgeInsets.all(kPadding / 2),
            child: innerTextWidget(),
          ),
        ),
      ),
    );
  }
}
