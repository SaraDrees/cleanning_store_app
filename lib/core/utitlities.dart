import 'package:get/get.dart';

String? filedRequired(String? value) {
  if (value?.isEmpty ?? true) return 'thisFiledIsRequired'.tr;
  return null;
}


String? validateNumbers(String number) {
  if (!isNumeric(number)){
    return 'validateNumber'.tr;
  }
  return null ;
}
bool isNumeric(String s) {
  return double.tryParse(s) != null;
}