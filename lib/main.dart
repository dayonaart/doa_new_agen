import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:mobilenew/pages/unknown_route.dart';
import 'package:mobilenew/routes.dart';

Future<void> main() async {
  await initializeDateFormatting().then((value) {
    Intl.defaultLocale = "in";
  });
  runApp(GetMaterialApp(
      defaultTransition: Transition.size,
      transitionDuration: const Duration(milliseconds: 500),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'montserrat'),
      initialRoute: ROUTE.onBoarding.name,
      getPages: routePage,
      unknownRoute: GetPage(
        name: '/notfound',
        page: () => const UnknownRoute(),
      )));
}
