// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:google_mobile_ads/google_mobile_ads.dart';

// Project imports:
import 'flavor_text.dart';

class Admob {
  String _getBannerAdUnitId() {
    String? bannerUnitId;
    if (Platform.isAndroid) {
      // Android のとき（テスト用広告）
      bannerUnitId = 'ca-app-pub-3940256099942544/6300978111';
    } else if (Platform.isIOS) {
      // iOSのとき
      bannerUnitId = admobId;
    }
    return bannerUnitId ?? '';
  }

  Future<Widget> getBannerWidget() async {
    final bannerAd = BannerAd(
      adUnitId: _getBannerAdUnitId(),
      size: AdSize.banner,
      request: const AdRequest(),
      listener: const BannerAdListener(),
    );

    await bannerAd.load();

    return Container(
      constraints: BoxConstraints(
        maxHeight: AdSize.banner.height.toDouble(),
        minWidth: double.infinity,
      ),
      child: AdWidget(ad: bannerAd),
    );
  }
}
