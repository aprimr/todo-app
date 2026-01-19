import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class BannerAdsWidget extends StatefulWidget {
  const BannerAdsWidget({super.key});

  @override
  State<BannerAdsWidget> createState() => _BannerAdsWidgetState();
}

class _BannerAdsWidgetState extends State<BannerAdsWidget> {
  BannerAd? _bannerAd;
  bool _isLoaded = false;
  // Ad Unit ID
  final String adUnitId = "ca-app-pub-3940256099942544/9214589741";
  // final String adUnitId = "ca-app-pub-7096527730985352/3968476578";

  @override
  void initState() {
    super.initState();
    _loadAd();
  }

  // Load Ad
  void _loadAd() {
    _bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: adUnitId,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            _isLoaded = true;
          });
          print("Banner Ad loaded");
        },
        onAdFailedToLoad: (ad, error) {
          setState(() {
            _isLoaded = false;
          });
          ad.dispose();
          print("Banner Ad failed to load");
        },
      ),
    );
    _bannerAd!.load();
  }

  @override
  void dispose() {
    _bannerAd!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_bannerAd != null && _isLoaded) {
      return SizedBox(
        height: AdSize.banner.height.toDouble(),
        width: double.infinity,
        child: Center(child: AdWidget(ad: _bannerAd!)),
      );
    } else {
      return SizedBox(
        height: AdSize.banner.height.toDouble(),
        width: double.infinity,
        child: Center(
          child: Text(
            "Banner Ad Failed",
            style: TextStyle(
              fontFamily: GoogleFonts.poppins().fontFamily,
              fontSize: 14,
            ),
          ),
        ),
      );
    }
  }
}
