import 'package:cleanning_store_app/core/firebase_store_manager.dart';
import 'package:cleanning_store_app/core/models/product_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{

HomeController({required this.firebaseStore});


RxString selectedMainType = ''.obs;
RxString selectedProductType = ''.obs;

List<String> mainTypes = ["A" , "B", "c" , "D"];
List<String> productTypes = ["a" , "b", "c" , "d"];

Product? newProduct ;
FirebaseStoreManager firebaseStore;


@override
  void onInit() {
    // TODO: implement onInit
    selectedMainType.value = mainTypes.first;
    selectedProductType.value = productTypes.first;
    super.onInit();
  }

void selectMainType(String value){
  selectedMainType.value = value ; 
  update(['new_product']);
}

void selectProductType(String value){
  selectedProductType.value = value ; 
  update(['new_product']);
}

Future addProduct() async {
 await Future.delayed(const Duration(seconds: 2));
// await firebaseStore.addData(newProduct?.toJson(), Constant.productCollectionPath);

}


}