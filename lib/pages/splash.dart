import 'dart:async';

import 'package:flavor/utilities/AppSettings.dart';
import 'package:flavor/web/components/Page/Page.dart';
import 'package:saucetv/main.dart';

import '../assets.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class SauceSplash extends StatefulWidget {
  @override
  _SauceSplashState createState() => _SauceSplashState();
}

class _SauceSplashState extends State<SauceSplash> {
  SauceSettings appset;

  @override
  Widget build(BuildContext context) {
    appset = Provider.of<SauceSettings>(context);
    appset.addListener(() {
      // print(appset.token);

      if (!appset.isLoading && appset.token == null) {
        // print('Not logged in...');
        // return OnBoarding();

        Timer(Duration(seconds: 0), () {
          Navigator.of(context).pushReplacementNamed('onboarding');
        });
      }

      if (!appset.isLoading && appset.token != null) {
        //
        // return SauceHome();

        Timer(Duration(seconds: 0), () {
          Navigator.of(context)
              // .pushNamedAndRemoveUntil('home', (Route<dynamic> route) => false);
              .pushReplacementNamed('home');
        });
      }
    });

    return PageShell(
      color: Colors.red,
      statusbarColor: Colors.transparent,
      safeArea: false,
      child: Center(
        child: Hero(
          tag: 'saucetvlogo',
          child: Container(
            height: 60,
            child: ImageAssets.sauceTvLogo,
          ),
        ),
      ),
    );
  }
}
