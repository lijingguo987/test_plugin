import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_plugin1/flutter_plugin1.dart';
import 'package:flutter_plugin1_example/mine.dart';

void main() {
  runApp(NewMyApp());
}

class NewMyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {'/mine':(BuildContext context)=>MinePageWidget()},
      home: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.pushNamed(context, '/mine');
      }),
        body: InkWell(
          onTap: () async{
          var result = await FlutterPlugin1.platformVersion;
          print(result);
          },
                  child: Container(

                  margin: EdgeInsets.only(top:100),
            child: Column(
              children: [
                Text('点我跳转'),
                SizedBox(height: 20),
                InkWell(
                  onTap:() async{

                    var result = await FlutterPlugin1.gotoDetiale;
                    print('=========$result');
                    if (result == '跳转到flutter原生页面') {
                      
                           Navigator.pushNamed(context, '/mine');
                    } 
                  },
                  child: Text('点我调到详情')
                ),
                SizedBox(height: 20),
                  GestureDetector(
                  onTap:(){

                  
                     Navigator.pushNamed(context, '/mine');
                    
                  },
                  child: Text('点我调到详情')
                )
              ],
            )
          ),
      ),
      );
  }
}
