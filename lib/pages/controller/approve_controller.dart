import 'package:appointments_app/pages/main_page.dart';
import 'package:appointments_app/utils/network/dio_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../utils/constant.dart';
import 'package:dio/dio.dart' as dio;

import '../../utils/custom_dialog.dart';

class ApproveController   extends GetxController with StateMixin<bool>{
  RxBool isLoding=false.obs;
String?  email;
String?  password;

GetStorage box=GetStorage();

Map map={};

DioClient dioClient=DioClient(BASE_URL, Dio());

  @override
  void onInit() {
   email= box.read("email");
   password= box.read("password");
    // TODO: implement onInit
    super.onInit();
  }




approveSubmite(id,date,time,massage,is_approve)async{

  try {
    isLoding(true);
                  print(email);


    change(null,status: RxStatus.loading());
   final formData = dio.FormData.fromMap({
        "date": date,
        "time": time,
        "massage": massage??"",
        "is_approve": is_approve,
       
      });
                  print(formData);


    var response=await dioClient.post("appointments/$id/confirm",data: formData);


    Get.offAll(()=>MainPage());


              customDialog("Succesfull","Approve");

    isLoding(false);

change(true,status: RxStatus.success());
    
  } catch (e) {
    isLoding(false);

change(false,status: RxStatus.error());

              customDialog("Opps!!","Fail to login Please try again ");



    debugPrint("Something wrong with $e");

    
  }


}





}