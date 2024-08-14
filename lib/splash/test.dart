import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class Textt extends StatelessWidget {
   Textt(  {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [Container(child:
       OutlinedButton(onPressed: ()async{
final result = await Share.shareXFiles([]);

if (result.status == ShareResultStatus.dismissed) {
    print('Did you not like the pictures?');
}

       }, 
       child: Text("sfddfdfd f ")),)],),
    );
  }
}