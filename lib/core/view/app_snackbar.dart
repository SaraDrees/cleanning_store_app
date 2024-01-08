import 'package:cleanning_store_app/core/app_colors.dart';
import 'package:get/get.dart';

class AppSnackbar{
  static show({required String message , bool error = false }) {
  return Get.showSnackbar( 
           GetSnackBar(message: message ,
          duration: const Duration(
          seconds: 3
        ),
        backgroundColor: error ? AppColors.redColor : AppColors.colorPrimary,)
        );
}
}