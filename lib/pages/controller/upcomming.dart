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

class UpCommingController   extends GetxController with StateMixin<bool>{

 RxBool isLoding=false.obs;


GetStorage box=GetStorage();

DioClient dioClient=DioClient(BASE_URL, Dio());


  static const _pageSize = 10;
 

  final PagingController<int, ToDayApmt> pagingController =
      PagingController(firstPageKey: 1);


  @override
  void onInit() {
   
     pagingController.addPageRequestListener((pageKey) {
      UpcommingFetchPage(pageKey);
    });
    // TODO: implement onInit
    super.onInit();
  }

      Future<void> UpcommingFetchPage(int pageKey) async {
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

    
 
  @override
  void dispose() {
    pagingController.dispose();

    super.dispose();
  }


}