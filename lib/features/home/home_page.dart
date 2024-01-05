import 'package:cleanning_store_app/core/app_colors.dart';
import 'package:cleanning_store_app/core/models/product_model.dart';
import 'package:cleanning_store_app/core/utitlities.dart';
import 'package:cleanning_store_app/core/view/app_button_widget.dart';
import 'package:cleanning_store_app/core/view/app_dropDown_widget.dart';
import 'package:cleanning_store_app/core/view/app_text_field.dart';
import 'package:cleanning_store_app/core/view/delivery_text_field_title.dart';
import 'package:cleanning_store_app/core/view/loading_widget.dart';
import 'package:cleanning_store_app/features/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class HomePage extends GetView<HomeController>{

  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController quantityController = TextEditingController();


  final _formKey = GlobalKey<FormState>();

  HomePage({super.key});

  
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 9.h , horizontal: 5.3.w),
        child: GetBuilder<HomeController>(
          id: 'new_product',
          builder: (_) {
            return Form(
              key: _formKey,
              child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                        'addProduct'.tr,
                        style: TextStyle(
                        color: AppColors.colorPrimary,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                        ),
                        ),
                      ),
                     SizedBox(height: 3.5.h,),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: AppTextFieldTitle( text:"mainType".tr, isRequired: true,),
                      ),
                      AppDropDownWidget(selectedValue: controller.selectedMainType.value, values: controller.mainTypes,
                       onSelect: (value) => controller.selectMainType(value)),
                     SizedBox(height: 3.5.h,),
                     Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: AppTextFieldTitle( text:"productType".tr, isRequired: true,),
                      ),
                      AppDropDownWidget(selectedValue: controller.selectedProductType.value, values: controller.productTypes,
                       onSelect: (value) => controller.selectProductType(value)),
                     SizedBox(height: 3.5.h,),
                     Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: AppTextFieldTitle( text:"productName".tr, isRequired: true,),
                      ),
                      AppTextField(controller: nameController, validator: (value) => filedRequired(value),),
                      SizedBox(height: 3.5.h,),
                     Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: AppTextFieldTitle( text:"quantity".tr, isRequired: true,),
                      ),
                      AppTextField(controller: quantityController, validator: (value) => validateNumbers(value??""),
                      keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: 3.5.h,),
                     Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: AppTextFieldTitle( text:"price".tr, isRequired: true,),
                      ),
                      AppTextField(controller: priceController, validator: (value) => validateNumbers(value??""),
                      keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: 3.5.h,),
                       AppButtonWidget(text: 'input'.tr, onPressed: ()async {
                               if(_formKey.currentState!.validate() && controller.selectedMainType.value.isNotEmpty 
                               && controller.selectedProductType.value.isNotEmpty){
                               await Get.showOverlay(asyncFunction: ()async {
                              controller.newProduct = Product(name: nameController.text,
                                 mainType: controller.selectedMainType.value,
                                 productType: controller.selectedProductType.value,
                                 price: int.parse(priceController.text),
                                 quantity: int.parse(quantityController.text));
                                await controller.addProduct(controller.newProduct!);
                               },
                               opacity: 0.2,
                               loadingWidget: const LoadingWidget()
                               );
                                Get.showSnackbar( 
                                 const GetSnackBar(message: "Good Job" ,
                                 duration: Duration(
                                  seconds: 3
                                ),
                                backgroundColor: AppColors.colorPrimary,)
                                );
                            }
                        }
                      )
                    ],
                  ),
            );
          }
        )
      ),
    );
  }

}
