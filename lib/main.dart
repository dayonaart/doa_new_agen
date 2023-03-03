import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:mobilenew/pages/unknown_route.dart';
import 'package:mobilenew/routes.dart';

void main() {
  runApp(GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'montserrat'),
      initialRoute: '/inputPhoneNumber',
      getPages: routePage,
      unknownRoute: GetPage(
        name: '/notfound',
        page: () => const UnknownRoute(),
      )));
}
