import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:outcaster/routes/routesstring.dart';
import 'package:outcaster/screens/whatsapp/whatsapp_app_page/whatsapp_page.dart';
import 'package:outcaster/screens/stepper_registration/stepper/page/stepper_page.dart';
import 'package:outcaster/screens/Cupertino_store/cupertino_page/page/cupertino_store.dart';
import 'package:outcaster/screens/playstore_app/playstoreapp_page/page/page.dart';
import 'package:outcaster/screens/setting_page/page/setting_page.dart';
import 'package:outcaster/screens/registration/page/registration.dart';

Map<String,Widget Function(BuildContext)> approutes = {
  settingpage:(context)=>SettingPage(),
  cupertinoroute:(context)=>CupertinoStorePage(),
  whatsapppage:(context)=>WhatsAppPage(),
  stepperScreen2:(context)=>StepperScreen(),
  playstoreapp:(context)=>play(),
  registration2 :(context)=>registration()

};