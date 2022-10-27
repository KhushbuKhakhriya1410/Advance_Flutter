
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:otp_plateform/splashscreen.dart';
import 'package:otp_plateform/screens/amazon.dart';
import 'package:otp_plateform/screens/disneyplushostar.dart';
import 'package:otp_plateform/screens/homepage.dart';
import 'package:otp_plateform/screens/netflix.dart';
import 'package:otp_plateform/screens/primevideo.dart';
import 'package:otp_plateform/screens/sonyliv.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'splashscreen',
    routes: {
      '/': (context) => const HomePage(),
      'netflix': (context) => const Netflix(),
      'amazon': (context) => const Amazon(),
      'disneyplushotstar': (context) => const DisneyplusHotstar(),
      'sonyliv': (context) => const SonyLIV(),
      'primevideo': (context) => const PrimeVideo(),
      'splashscreen': (context) => const SplashScreenPage(),
    },
  ));
}

