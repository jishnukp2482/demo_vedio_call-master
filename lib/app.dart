import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'presentation/routes/app_Pages.dart';
import 'presentation/routes/app_routes.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: AppRoutes.routes,
      initialRoute: AppPages.signin,
    );
  }
}
