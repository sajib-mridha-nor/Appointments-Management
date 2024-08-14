import 'package:appointments_app/pages/model/today_apmt_res.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:dio/dio.dart' as dio;
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../utils/constant.dart';
import '../../utils/custom_dialog.dart';
import '../../utils/network/dio_client.dart';

class HomeController   extends GetxController with StateMixin<bool>{

 RxBool isLoding=false.obs;
String?  email;
String?  password;

GetStorage box=GetStorage();

DioClient dioClient=DioClient(BASE_URL, Dio());



  static const _pageSize = 10;
 

  final PagingController<int, ToDayApmt> pagingController =
      PagingController(firstPageKey: 1);

 



  @override
  void onInit() {
   
     pagingController.addPageRequestListener((pageKey) {
      toDayFetchPage(pageKey);
    });
    super.onInit();
  }

      Future<void> toDayFetchPage(int pageKey) async {
    debugPrint("stater notification");
    try {
      final res =
          await dioClient.get("/today-appointment?page=$pageKey&limit=$_pageSize");
      debugPrint("responswe   $res");

      final fullres = TodayApmtResponse.fromJson(res);
      debugPrint("end noti $fullres ");
    

      // final isLastPage = newItems!.length < _pageSize;
      // if (fullres.lastPage) {
      //   pagingController.appendLastPage(newItems);
      // } else {
      //   final nextPageKey = pageKey + newItems.length;
      //   pagingController.appendPage(newItems, nextPageKey);
      // }
       if (fullres.nextPageUrl == null) {
        pagingController.appendLastPage(fullres.data ?? []);
      } else {
        final nextPageKey = pageKey + 1;
        pagingController.appendPage(fullres.data ?? [], nextPageKey);
      }










    } catch (error) {
      debugPrint(error.toString());
      pagingController.error = error;
    }
  }

      Future<void> previusFetchPage(int pageKey) async {
    debugPrint("stater notification");
    try {
      final res =
          await dioClient.get("/today-appointment?page=$pageKey&limit=$_pageSize");
      debugPrint("responswe   $res");

      final fullres = TodayApmtResponse.fromJson(res);
      debugPrint("end noti $fullres ");
    

      // final isLastPage = newItems!.length < _pageSize;
      // if (fullres.lastPage) {
      //   pagingController.appendLastPage(newItems);
      // } else {
      //   final nextPageKey = pageKey + newItems.length;
      //   pagingController.appendPage(newItems, nextPageKey);
      // }
       if (fullres.nextPageUrl == null) {
        pagingController.appendLastPage(fullres.data ?? []);
      } else {
        final nextPageKey = pageKey + 1;
        pagingController.appendPage(fullres.data ?? [], nextPageKey);
      }










    } catch (error) {
      debugPrint(error.toString());
      pagingController.error = error;
    }
  }

      Future<void> upCommingFetchPage(int pageKey) async {
    debugPrint("stater notification");
    try {
      final res =
          await dioClient.get("/upcoming-appointment?page=$pageKey&limit=$_pageSize");
      debugPrint("responswe   $res");

      final fullres = TodayApmtResponse.fromJson(res);
      debugPrint("end noti $fullres ");
    

      // final isLastPage = newItems!.length < _pageSize;
      // if (fullres.lastPage) {
      //   pagingController.appendLastPage(newItems);
      // } else {
      //   final nextPageKey = pageKey + newItems.length;
      //   pagingController.appendPage(newItems, nextPageKey);
      // }
       if (fullres.nextPageUrl == null) {
        pagingController.appendLastPage(fullres.data ?? []);
      } else {
        final nextPageKey = pageKey + 1;
        pagingController.appendPage(fullres.data ?? [], nextPageKey);
      }










    } catch (error) {
      debugPrint(error.toString());
      pagingController.error = error;
    }
  }


previusApmt()async{

  try {
    isLoding(true);
                  print(email);

    change(null,status: RxStatus.loading());

    var response=await dioClient.get("previous-appointment");
   isLoding(false);

change(true,status: RxStatus.success());
    
  } catch (e) {
    isLoding(false);

change(false,status: RxStatus.error());

    debugPrint("Something wrong with $e");

    
  }
}

 
  @override
  void dispose() {
    pagingController.dispose();

    super.dispose();
  }


}