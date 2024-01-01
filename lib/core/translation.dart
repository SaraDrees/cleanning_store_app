import 'package:get/get.dart';

class Translation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'login': 'Log in',
          'password': 'Your Password',
          'nameHint' : 'Your Name',
          'thisFiledIsRequired':'This filed is required.'

        },
        'ar_SA': {
        }
      };
}