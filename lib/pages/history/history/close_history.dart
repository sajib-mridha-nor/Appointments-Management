
import 'package:appointments_app/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../controller/all_approinmen_controller.dart';
import '../../controller/approve_controller.dart';
import '../../controller/close_controller_page.dart';
import '../../model/today_apmt_res.dart';

class ClosePageHistory extends StatelessWidget {
    ClosePageHistory({
    super.key,
   
  });
    final controller=Get.put(CloseController());
   final approveController=Get.put(ApproveController());
 

  @override
  Widget build(BuildContext context) {
    return PagedListView<int, ToDayApmt>(
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
                );
  }
}


