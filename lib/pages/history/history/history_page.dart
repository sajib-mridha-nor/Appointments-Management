import 'package:animated_button_bar/animated_button_bar.dart';
import 'package:appointments_app/pages/history/history/close_history.dart';
import 'package:appointments_app/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../controller/all_approinmen_controller.dart';
import '../../controller/approve_controller.dart';
import '../../controller/home_controller.dart';
import '../../model/today_apmt_res.dart';
import 'approve_history.dart';
import 'reject_history.dart';


class AllApmtPage extends StatefulWidget {
    AllApmtPage({super.key});

  @override
  State<AllApmtPage> createState() => _AllApmtPageState();
}

class _AllApmtPageState extends State<AllApmtPage> {
  var selected = 0;

  final controller=Get.put(AllApmtController());

   final approveController=Get.put(ApproveController());

     Future<void> _pullRefresh() async {
    controller.pagingController.refresh();
  }

    PageController pageController = PageController();

    List<Widget> page = <Widget>[
    ApprovePageHistory(),
    
    RejectPageHistory(),
    ClosePageHistory(),
  ];

  @override
  Widget build(BuildContext context) {
    var clr = Theme.of(context).buttonTheme.colorScheme;

    return Scaffold(
     
      body:  RefreshIndicator(
        onRefresh: _pullRefresh,
        child: Column(
          children: [
               Expanded(
         flex: 1,
            child: AnimatedButtonBar(
              radius: 32.0,
              padding: const EdgeInsets.all(16.0),
              // backgroundColor: Colors.white,
              // foregroundColor: clr?.primary,
              // elevation: 4,
              // borderColor: clr?.background,
              borderWidth: 2,
              innerVerticalPadding: 4,
          
              children: [
                ButtonBarEntry(
                    onTap: () {
                     
                      setState(() {
                        selected = 0;
                        pageController.jumpToPage(0);
                      });
                    },
                    child: Text(
                      "Approved",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: selected == 0 ? Colors.white : clr?.primary,
                      ),
                    )),
                ButtonBarEntry(
                    onTap: () {
                      setState(() {
                        selected = 1;
                        pageController.jumpToPage(1);

                      });
                    },
                    child: Text(
                      "Reject",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: selected == 1 ? Colors.white : clr?.primary,
                      ),
                    )),
                ButtonBarEntry(
                    onTap: () {
                      setState(() {
                        selected = 2;
                        pageController.jumpToPage(2);

                      });
                    },
                    child: Text(
                      "Close",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: selected == 2 ? Colors.white : clr?.primary,
                      ),
                    )),
              ],
            ),
          ),
            Expanded(
            flex: 6,
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (num) {
                setState(() {
                         
                  selected = num;
                });
              },
              scrollDirection: Axis.horizontal,
              controller: pageController,
              children: page),     ),

        
            
          ],
        ),
      ),
    );
  }
}
