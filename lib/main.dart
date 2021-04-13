import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'app/common/const.dart';
import 'app/routes/app_pages.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: primaryColor,
    ),
  );

  runApp(
    GetMaterialApp(
      title: "AutoFarmer",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(
        primaryColor: primaryColor,
        accentColor: primaryColor,
        primaryColorBrightness: Brightness.dark,
        colorScheme: ColorScheme.light(primary: primaryColor),
        appBarTheme: AppBarTheme(
          brightness: Brightness.dark,
        ),
      ),
    ),
  );
}
