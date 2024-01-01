import 'package:get/get.dart';

String? filedRequired(String? value) {
  if (value?.isEmpty ?? true) return 'thisFiledIsRequired'.tr;
  return null;
}