import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../controller/approve_controller.dart';
import '../controller/home_controller.dart';
import '../model/today_apmt_res.dart';
import 'home_page.dart';

class TodayPage extends StatelessWidget {
    TodayPage({super.key});

  var selected = 0;

  final controller=Get.put(HomeController());
   final approveController=Get.put(ApproveController());

    Future<void> _pullRefresh() async {
    controller.pagingController.refresh();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body:  RefreshIndicator(
        onRefresh: _pullRefresh,
        child: PagedListView<int, ToDayApmt>(
                shrinkWrap: true,
              pagingController: controller.pagingController,
              builderDelegate: PagedChildBuilderDelegate<ToDayApmt>(
                  itemBuilder: (context, item, index) =>  MyElevatedContainer(isApprove: item.isApprove,
                    name: item.name,agenda: item.agenda,date: item.appDate,mobile: item.mobile,
                OnClick: () {
                                dialog(
                                  
                                  
                                  context,item,approveController);
      
                },
              ),),
              // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              //     crossAxisCount: 2,
              //     crossAxisSpacing: 8.0,
              //     mainAxisSpacing: 0,
              //     mainAxisExtent: 150),
                    ),
      ),
    );
  }
}