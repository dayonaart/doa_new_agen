import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:mobilenew/pages/account_type.dart';
import 'package:mobilenew/pages/input_phone_number.dart';
import 'package:mobilenew/pages/ktp_registration.dart';
import 'package:mobilenew/pages/onboarding.dart';
import 'package:mobilenew/pages/opening_account.dart';
import 'package:mobilenew/pages/opening_tnc.dart';
import 'package:mobilenew/pages/preregister.dart';
import 'package:mobilenew/pages/registration_form.dart';
import 'package:mobilenew/pages/take_camera_ktp.dart';

enum ROUTE {
  onBoarding,
  preRegister,
  openingAccount,
  openingTnc,
  inputPhoneNumber,
  accountType,
  ktpRegistration,
  takeCameraKtp,
  registrationForm,
}

extension Page on ROUTE {
  String get name {
    switch (this) {
      case ROUTE.onBoarding:
        return '/';
      case ROUTE.preRegister:
        return '/preRegister';
      case ROUTE.openingAccount:
        return '/openingAccount';
      case ROUTE.openingTnc:
        return '/openingTnc';
      case ROUTE.inputPhoneNumber:
        return '/inputPhoneNumber';
      case ROUTE.accountType:
        return '/accountType';
      case ROUTE.ktpRegistration:
        return '/ktpRegistration';
      case ROUTE.takeCameraKtp:
        return '/takeCameraKtp';
      case ROUTE.registrationForm:
        return '/registrationForm';
      default:
        return "";
    }
  }
}

List<GetPage> get routePage {
  return [
    GetPage(name: ROUTE.onBoarding.name, page: () => OnBoarding()),
    GetPage(name: ROUTE.preRegister.name, page: () => const PreRegister()),
    GetPage(
        name: ROUTE.openingAccount.name, page: () => const OpeningAccount()),
    GetPage(name: ROUTE.openingTnc.name, page: () => OpeningTnc()),
    GetPage(name: ROUTE.inputPhoneNumber.name, page: () => InputPhoneNumber()),
    GetPage(name: ROUTE.accountType.name, page: () => AccountType()),
    GetPage(name: ROUTE.ktpRegistration.name, page: () => KtpRegistration()),
    GetPage(name: ROUTE.takeCameraKtp.name, page: () => TakeCameraKtp()),
    GetPage(name: ROUTE.registrationForm.name, page: () => RegistrationForm()),
  ];
}
