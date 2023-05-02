import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:appComida/src/app_module.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'app_widget.dart';

bool? seenOnboard;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
 
  SharedPreferences pref = await SharedPreferences.getInstance();
  seenOnboard = pref.getBool('seenOnboard') ?? false;
  runApp(
    ModularApp(module: AppModule(), child: const AppWidget()),
  );

}