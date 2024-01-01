import 'package:get/get.dart';

class HomeController extends GetxController{

RxString? selectedMainType;
RxString? selectedProductType;

List<String> mainTypes = ["A" , "B", "c" , "D"];
List<String> productTypes = ["a" , "b", "c" , "d"];


@override
  void onInit() {
    // TODO: implement onInit
    selectedMainType?.value = mainTypes.first;
    selectedProductType?.value = productTypes.first;
    super.onInit();
  }

void selectMainType(String value){
  selectedMainType?.value = value ; 
}

void selectProductType(String value){
  selectedProductType?.value = value ; 
}


}