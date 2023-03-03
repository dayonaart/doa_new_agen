import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:mobilenew/pages/account_type.dart';
import 'package:mobilenew/pages/input_phone_number.dart';
import 'package:mobilenew/pages/ktp_registration.dart';
import 'package:mobilenew/pages/onboarding.dart';
import 'package:mobilenew/pages/opening_account.dart';
import 'package:mobilenew/pages/opening_tnc.dart';
import 'package:mobilenew/pages/preregister.dart';

List<GetPage> get routePage {
  return [
    GetPage(name: '/', page: () => OnBoarding()),
    GetPage(name: '/preRegister', page: () => const PreRegister()),
    GetPage(name: '/openingAccount', page: () => const OpeningAccount()),
    GetPage(name: '/openingTnc', page: () => OpeningTnc()),
    GetPage(name: '/inputPhoneNumber', page: () => InputPhoneNumber()),
    GetPage(name: '/account_type', page: () => AccountType()),
    GetPage(name: '/ktpRegistration', page: () => KtpRegistration()),
  ];
}
