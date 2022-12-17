// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:google_mobile_ads/google_mobile_ads.dart';

class Admob {
  String _getBannerAdUnitId() {
    String? bannerUnitId;
    if (Platform.isAndroid) {
      // Android のとき（テスト用広告）
      bannerUnitId = 'ca-app-pub-3940256099942544/6300978111';
    } else if (Platform.isIOS) {
      // iOSのとき
      // bannerUnitId = 'ca-app-pub-4793779857582845/6824830701';
      // iOSのとき（テスト用広告）
      bannerUnitId = 'ca-app-pub-3940256099942544/2934735716';
    }
    return bannerUnitId ?? '';
  }

  Future<void> _updateRequestConfig({required bool isSimulator}) async {
    await MobileAds.instance.updateRequestConfiguration(
      RequestConfiguration(
        testDeviceIds: [isSimulator ? '6C7C4087-223C-44A3-B167-EFF0E69CD532' : '00008030-000125641491802E'],
      ),
    );
  }

  Future<Widget> getBannerWidget() async {
    final bannerAd = BannerAd(
      adUnitId: _getBannerAdUnitId(),
      size: AdSize.banner,
      request: const AdRequest(),
      listener: const BannerAdListener(),
    );

    await _updateRequestConfig(isSimulator: true);

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
