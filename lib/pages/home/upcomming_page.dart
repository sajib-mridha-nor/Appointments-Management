import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../controller/approve_controller.dart';
import '../controller/home_controller.dart';
import '../controller/upcomming.dart';
import '../model/today_apmt_res.dart';
import 'home_page.dart';

class UpcommingPage extends StatelessWidget {
    UpcommingPage({super.key});

  var selected = 0;

  final controller=Get.put(UpCommingController());
   final approveController=Get.put(ApproveController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  PagedListView<int, ToDayApmt>(
              shrinkWrap: true,
            pagingController: controller.pagingController,
            builderDelegate: PagedChildBuilderDelegate<ToDayApmt>(
                itemBuilder: (context, item, index) =>  MyElevatedContainer(
                  name: item.name,agenda: item.agenda,date: item.appDate,mobile: item.mobile,
              OnClick: () {
                 dialog(context,item,approveController);
              },
            ),),
            // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //     crossAxisCount: 2,
            //     crossAxisSpacing: 8.0,
            //     mainAxisSpacing: 0,
            //     mainAxisExtent: 150),
                  ),
    );
  }
}