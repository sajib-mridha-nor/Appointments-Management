import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'history/history/history_page.dart';
import 'home/home_page.dart';



class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int bottomIndex = 0;

  final screens = [
    HomePage(),
    AllApmtPage(),
    HomePage(),
 
  ];
 

  @override
  Widget build(BuildContext context) {
    final colorSchema = Theme.of(context).colorScheme;

     

    return Scaffold(
       appBar: AppBar(
        title: const Text("Schedule"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {
           

            ;
          }, icon: const Icon(Icons.search))
        ],
      ),
        body:  screens[ bottomIndex],
        bottomNavigationBar: 
        NavigationBar(
            surfaceTintColor: Colors.white,
            backgroundColor: Colors.white,
            selectedIndex: bottomIndex,
            onDestinationSelected: (index) {
              bottomIndex=index;
              
              setState(() {
                bottomIndex = index;
              });
            },
            destinations: <NavigationDestination>[
              NavigationDestination(
                  icon: const Icon(
                 CupertinoIcons.house_alt
                  ),
                  selectedIcon: Icon(
                                 CupertinoIcons.house_alt_fill,

                    color: colorSchema.primary,
                  ),
                  label: "Home"),
              NavigationDestination(
                  icon: const Icon(
                    FluentIcons.timeline_20_regular,
                  ),
                  selectedIcon: Icon(
                    FluentIcons.timeline_20_filled,
                    color: colorSchema.primary,
                  ),
                  label: "History"),
           
              
              NavigationDestination(
                  icon: const Icon(
                    FluentIcons.more_vertical_28_regular,
                  ),
                  selectedIcon: Icon(
                    FluentIcons.more_vertical_28_filled,
                    color: colorSchema.primary,
                  ),
                  label: "More")
            ],
          ),
        );
    
  }
}
