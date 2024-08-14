import 'package:appointments_app/pages/main_page.dart';
import 'package:appointments_app/utils/network/dio_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../utils/constant.dart';
import 'package:dio/dio.dart' as dio;

import '../../utils/custom_dialog.dart';

class AuthController   extends GetxController with StateMixin<bool>{
  RxBool isLoding=false.obs;
String?  email;
String?  password;

GetStorage box=GetStorage();

DioClient dioClient=DioClient(BASE_URL, Dio());

  @override
  void onInit() {
   email= box.read("email");
   password= box.read("password");
    // TODO: implement onInit
    super.onInit();
  }




login()async{

  try {
    isLoding(true);
                  print(email);


    change(null,status: RxStatus.loading());
   final formData = dio.FormData.fromMap({
        "email": email,
        "password": password,
       
      });
                  print(formData);


    var response=await dioClient.post("login",data: formData);
    print("respo: $response");
    print(response["token"]);
    box.write("email", email);
    box.write("password", password);
    box.write("token", response["token"]);


    Get.offAll(MainPage());


              customDialog("Succesfull","Welcome to Appointment Schedule App");

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