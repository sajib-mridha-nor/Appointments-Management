import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'package:flutter_search_bar/flutter_search_bar.dart' as search;
import '../controller/approve_controller.dart';
import '../controller/search_controller.dart';
import '../model/today_apmt_res.dart';
import '../home/home_page.dart';


class PreviusPage extends StatefulWidget {
    PreviusPage({super.key});

  @override
  State<PreviusPage> createState() => _PreviusPageState();
}

class _PreviusPageState extends State<PreviusPage> {
  

  var selected = 0;
   late search.SearchBar searchBar;

  final controller=Get.put(Searchcontroller());

   final approveController=Get.put(ApproveController());
       AppBar buildAppBar(BuildContext context) {
    return AppBar(title: const Text("Search"),
        // backgroundColor: Color.fromARGB(255, 147, 192, 244),
        actions: [
          searchBar.getSearchAction(context),
        ]);
  }

     @override
  void dispose() {
    controller.dispose();
    // controller.pagingController.dispose();
    // controller.pagingController.refresh();
    // TODO: implement dispose
    super.dispose();
  }

  void onSubmitted(String value) {
    controller.query(value);
    controller.pagingController.refresh();
  }

  @override
  void initState() {
    searchBar = search.SearchBar(
        inBar: true,
        buildDefaultAppBar: buildAppBar,
        setState: setState,
        onSubmitted: onSubmitted,
        clearOnSubmit: false,
        closeOnSubmit: false,
        onCleared: () {
          debugPrint("Search bar has been cleared");
        },
        onClosed: () {
          debugPrint("Search bar has been closed");
        });
    Future.delayed(const Duration(milliseconds: 500), () {
      searchBar.beginSearch(context);
    });
    super.initState();
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  PagedListView<int, ToDayApmt>(
              shrinkWrap: true,
            pagingController: controller.pagingController,
            builderDelegate: PagedChildBuilderDelegate<ToDayApmt>(
                itemBuilder: (context, item, index) =>  MyElevatedContainer(
                  name: item.name,agenda: item.agenda,date: item.appDate,mobile: item.mobile,isApprove: item.isApprove,
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