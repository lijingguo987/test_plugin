
import 'package:flutter/material.dart';

class MinePageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        
        title: Text('从原生返回跳转的'),
        centerTitle: true,
      ),
      body: Container(
      
      child: Text('我是从ISO页面跳转过来的'),

    ),
    );
  }
}
