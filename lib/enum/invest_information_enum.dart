import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum InvestInfoEnum {
  income,
  totalInvest,
  stocks,
}

extension InvestInfoEnumExt on InvestInfoEnum {
  FaIcon get icon {
    switch (this) {
      case InvestInfoEnum.income:
        return const FaIcon(
          FontAwesomeIcons.handHoldingDollar,
          size: 40,
        );
      case InvestInfoEnum.totalInvest:
        return const FaIcon(
          FontAwesomeIcons.sackDollar,
          size: 40,
        );
      case InvestInfoEnum.stocks:
        return const FaIcon(
          FontAwesomeIcons.file,
          size: 40,
        );
    }
  }
}
