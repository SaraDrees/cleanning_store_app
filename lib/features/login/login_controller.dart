import 'package:get/get.dart';

class LoginController extends GetxController{
  
 RxInt x = 0.obs;

  @override
  void onInit() {
    super.onInit();
    //Change x to 5
    x.value = 5;
  }

 
 increseValue()=> x.value++;


}