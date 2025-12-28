import 'package:aerium/core/layout/adaptive.dart';
import 'package:aerium/presentation/widgets/logo_ticker.dart';
import 'package:aerium/values/values.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class LogoTickerBar extends StatelessWidget {
  const LogoTickerBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        vertical: responsiveSize(context, 20, 30, md: 25),
      ),
      child: LogoTicker(
        logos: Data.tickerLogos,
        height: responsiveSize(context, 60, 100, md: 80),
        spacing: responsiveSize(context, 80, 160, md: 120),
        duration: Duration(seconds: 15),
      ),
    );
  }
}

