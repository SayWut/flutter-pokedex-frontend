import 'package:flutter/material.dart';
import 'package:flutter_pokedex_frontend/routes/app_pages.dart';
import 'package:flutter_pokedex_frontend/core/config/environment.dart';
import 'package:flutter_pokedex_frontend/ingection_controller.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() async {
  await Environment.init();
  await initIngection();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      builder: (context, widget) => ResponsiveWrapper.builder(
        ClampingScrollWrapper.builder(context, widget!),
        breakpoints: const [
          ResponsiveBreakpoint.resize(1, name: MOBILE),
          ResponsiveBreakpoint.autoScale(360, name: MOBILE),
          ResponsiveBreakpoint.autoScale(768, name: TABLET),
          ResponsiveBreakpoint.autoScale(1024, name: DESKTOP),
          ResponsiveBreakpoint.resize(1280, name: DESKTOP),
        ],
      ),
      title: 'Pokedex',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: AppPages.pages,
    );
  }
}
