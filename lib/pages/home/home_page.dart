import 'package:animated_button_bar/animated_button_bar.dart';
import 'package:appointments_app/pages/controller/home_controller.dart';
import 'package:appointments_app/pages/home/previus.dart';
import 'package:appointments_app/pages/home/today_page.dart';
import 'package:appointments_app/pages/home/upcomming_page.dart';
import 'package:appointments_app/pages/model/today_apmt_res.dart';
import 'package:appointments_app/utils/custom_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:readmore/readmore.dart';
import '../../utils/date_formate.dart';
import '../../widgets/custom_button.dart';
import '../controller/approve_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var selected = 0;

  final controller=Get.put(HomeController());
  final approveController=Get.put(ApproveController());
    PageController pageController = PageController();


    List<Widget> page = <Widget>[
    PreviusPage(),
    TodayPage(),
    UpcommingPage(),
  ];
  @override
  Widget build(BuildContext context) {
    var clr = Theme.of(context).buttonTheme.colorScheme;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
         flex: 1,
            child: AnimatedButtonBar(
              radius: 32.0,
              padding: const EdgeInsets.all(12.0),
              backgroundColor: clr?.background,
              foregroundColor: clr?.primary,
              elevation: 4,
              // borderColor: clr?.background,
              borderWidth: 2,
              innerVerticalPadding: 12,
          
              children: [
                ButtonBarEntry(
                    onTap: () {
                     
                      setState(() {
                        selected = 0;
                        pageController.jumpToPage(0);
                      });
                    },
                    child: Text(
                      "Previous",
                      style: TextStyle(
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
                      "Today",
                      style: TextStyle(
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
                      "Upcomming",
                      style: TextStyle(
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
     







          // MyElevatedContainer(
          //   OnClick: () {
          //     dialog(context);
          //   },
          // ),
          // const MyElevatedContainer(),
        ],
      ),
    );
  }
}

class MyElevatedContainer extends StatelessWidget {
    MyElevatedContainer({super.key,this.isApprove, this.OnClick,this.agenda,this.date,this.mobile,this.name});

  final VoidCallback? OnClick;
  final String? name;
  final String? mobile;
  final String? agenda;
  final String? date;
  final int? isApprove;
 

  @override
  Widget build(BuildContext context) {
    var clr = Theme.of(context).buttonTheme.colorScheme;

    return InkWell(
      onTap:OnClick,
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Container(
          padding: const EdgeInsets.all(4.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color:
                    const Color.fromARGB(255, 171, 189, 203).withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 6,
                offset: const Offset(0, 2), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            // mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     Row(

                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         const CircleAvatar(
                          radius: 24,
                              backgroundImage: AssetImage("assets/user.png"),
                            ), const SizedBox(
                              width: 16,
                            ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                    
                        
                            children: [
                             
                              Text(
                                name??'Abdul rahman ',
                                style: const TextStyle(
                                  fontSize: 14,fontWeight: FontWeight.normal
                                ),
                              ),
                              // SizedBox(
                              //   height: 4,
                              // ),
                              Text(
                                mobile??'0170009090',
                                style: const TextStyle(fontSize: 14,fontWeight: FontWeight.normal),
                              ),
                            ],
                      ),
                    ), const SizedBox(
                      width: 16,
                    ),
                    
                  isApprove== 3?  const Text(
                              "Reject",
                              style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal,color: Colors.red),
                            ):isApprove== 1?const Text(
                              "Approve",
                              style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal,color: Colors.green),
                            ):Container(width: 20,)
                       ],
                     ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      'Agenda : $agenda',
                      maxLines: 2,overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 14,color: Colors.black54),
                    ),
                  ],
                ),
              ),
              const Divider(
                height: 2,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.calendar_month,
                        color: Colors.lime,
                      ),
                      Text(dateConvert("$date").toString()),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

dialog(context, ToDayApmt item,ApproveController controller) {
  controller.map={};
  var time;
  var clr;
  Get.dialog(
    StatefulBuilder(
       builder: (BuildContext context, StateSetter setState) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Material(
                  child: Column(
                    children: [
                      const SizedBox(height: 8),
                        Text(
                       item.name?? "Abdul Ahad",
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                        Text(
                         item.mobile?? "01755324588",
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 8),
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.calendar_month,
                                        color: Colors.lime,
                                      ),
                                      Text( controller.map["date"]==null?  dateConvert(  item.appDate??"1969-07-20 20:18:04Z").toString():
                                         dateConvert(controller.map["date"]) .toString()),
                                      
                                    ],
                                  ),
                                controller.map["time"]==null?Container():  Row(
                                    children: [
                                      const Icon(
                                        Icons.access_time,
                                        color: Colors.lime,
                                      ),
                                      Text( 
                                         controller.map["time"] .toString()),
                                      
                                    ],
                                  )
                         
                                ],
                              ),
                         item.isApprove!=3?     Material(
                                 color: Colors.blue,
                                      borderRadius: BorderRadius.circular(8.0),
                                      shadowColor:   
                                              const Color.fromARGB(255, 171, 189, 203)
                                                  .withOpacity(0.5),
                                  
                                child: InkWell(
                                  //  color: Colors.blue,
                                  splashColor: Colors.grey,
                                      borderRadius: BorderRadius.circular(8.0),
                                  onTap: (){print("object");
                                   DatePicker.showDatePicker(context,
                                showTitleActions: true,
                              
                                minTime: DateTime(2020, 1, 1),
                                maxTime: DateTime(2040, 12, 31), 
                                onChanged: (date) {

                            print('confirm $date');

                              setState(() => controller.map["date"]=date.toString());

                              
                            }, onConfirm: (date) {
                            print('confirm d: $date');

                              setState(() => controller.map["date"]=date.toString());

                              DatePicker.showTime12hPicker(context,
                              showTitleActions: true,
                              onChanged: (time) {
                            print('confirm ti $time');
                            print('confirm time o ${onlyTime(time)}');
                          

                              setState(() => controller.map["time"]=onlyTime(time));

                            
                            
                          }, onConfirm: (time) {
                          print("c t $date");
                          setState(() => controller.map["time"]=onlyTime(time));
                              

                           
                            print('confirm time $date');
                          }, currentTime: DateTime.now(), locale: LocaleType.en);
                            }, currentTime:  DateTime.parse(item.appDate.toString()), locale: LocaleType.en);
    
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 6, horizontal: 8),
                                    decoration: BoxDecoration(
                                     
                                      // color: Colors.blue,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: const Text(
                                      'Proposal time',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ):Container()
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Divider(
                        height: 2,
                      ),
                      const SizedBox(height: 8),
            
                        ReadMoreText(
                       item.agenda?? 'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
                        trimLines: 2,
                        colorClickableText: Colors.pink,
                        trimMode: TrimMode.Line,
                        trimCollapsedText: 'Show more',
                        trimExpandedText: 'Show less',
                        moreStyle:
                            const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                        lessStyle:
                            const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 10),
    
                      const SizedBox(height: 20),
                      //Buttons
                 item.isApprove==3? Container() :    Row(
                        children: [
                          const SizedBox(width: 8),
                          Expanded(
                            child: Material(
                              color: const Color.fromARGB(255, 223, 74, 60),
                                    borderRadius: BorderRadius.circular(8.0),
                                    shadowColor:   const Color.fromARGB(255, 171, 189, 203)
                                                .withOpacity(0.5),
    
                              child: InkWell(
                                    borderRadius: BorderRadius.circular(8.0),
    
                                onTap: () {
     controller.approveSubmite(item.id,controller.map["date"]??item.appDate,controller.map["time"],controller.map["massage"],3);
    
    
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 4),
                                  decoration: BoxDecoration(
                                   
                                    // color: const Color.fromARGB(255, 223, 74, 60),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child:     Center(
                                    child: Text(
                                     'Reject',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 24),
                          Expanded(
                            child: Material(
                            
                              shadowColor: const Color.fromARGB(255, 171, 189, 203)
                                                .withOpacity(0.5),
                               color: const Color.fromARGB(255, 115, 219, 119),
                                    borderRadius: BorderRadius.circular(8.0),
                              child: InkWell(
                                    borderRadius: BorderRadius.circular(8.0),
    
                                onTap: () {
                                  

                                    if (controller.map["date"]==null) {
                                    print("kok");
                                    Get.snackbar(
                                      snackPosition:SnackPosition.BOTTOM,
                                      
                                      "Please selecte time", "By Clicking proposal time");
                                    
                                  } else {
                            item.isApprove==0?  controller.approveSubmite(item.id,controller.map["date"]??item.appDate,controller.map["time"],"",1):null;
                                    
                                  }

                                    if ( item.isApprove==1 ) {
                                     DatePicker.showDatePicker(context,
                                showTitleActions: true,
                              
                                minTime: DateTime(2020, 1, 1),
                                maxTime: DateTime(2040, 12, 31), 
                                onChanged: (date) {

                            print('confirm $date');

                              setState(() => controller.map["date"]=date.toString());

                              
                            }, onConfirm: (date) {
                            print('confirm d: $date');

                              setState(() => controller.map["date"]=date.toString());

                              DatePicker.showTime12hPicker(context,
                              showTitleActions: true,
                              onChanged: (time) {
                            print('confirm ti $time');
                            print('confirm time o ${onlyTime(time)}');
                          

                              setState(() => controller.map["time"]=onlyTime(time));

                            
                            
                          }, onConfirm: (time) {
                          print("c t $date");
                          setState(() => controller.map["time"]=onlyTime(time));
                              

                           
                            print('confirm time $date');
                          }, currentTime: DateTime.now(), locale: LocaleType.en);
                            }, currentTime:  DateTime.parse(item.appDate.toString()), locale: LocaleType.en);
    
                                    
                                  } else {
                            item.isApprove==0?  controller.approveSubmite(item.id,controller.map["date"]??item.appDate,controller.map["time"],"",1):null;
                                    
                                  }
                                         
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 4),
                                  decoration: BoxDecoration(
                                 
                             
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child:   Center(
                                    child: Text(
                                     item.isApprove==0? 'Approve':'ReShedule',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                        ],
                      )
                  ],
                  ),
                ),
              ),
            ),
          ),
        ],
      );
}),
  );
}

showTimePicker(context ,controller){
    DatePicker.showTime12hPicker(context,
                              showTitleActions: true,
                              onChanged: (date) {
                            controller.map["time"]=date.toString();
                            
                          }, onConfirm: (date) {
                           
                            print('confirm $date');
                          }, currentTime: DateTime.now(), locale: LocaleType.en);
                                
   
}