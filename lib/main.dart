import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter jump Native'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //平台通道1––––获取电池电量
  static const platform = const MethodChannel('samples.flutter.dev/battery');
  //平台通道2––––跳转到iOS页面
  static const platform2 = const MethodChannel('samples.flutter.jumpto.iOS');
  //平台通道3––––跳转到Android页面
  static const platform3 = const MethodChannel('samples.flutter.jumpto.android');


  String _batteryLevelStr = 'Unknown battery level.';



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(onPressed: _getBatteryLevelMethod, child: Text('获取电池电量')),
            Text(_batteryLevelStr),
            SizedBox(height: 20,),


            TextButton(onPressed: _jumpToIosMethod, child: Text('跳转到iOS页面')),
            TextButton(onPressed: _jumpToAndroidMethod, child: Text('跳转到Android页面')),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  //获取电池电量
  Future<Null> _getBatteryLevelMethod() async {
    String batteryLevel;
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');

      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      _batteryLevelStr = batteryLevel;
    });
  }

  //跳转到iOS页面
  Future<Null> _jumpToIosMethod() async {
    final String result = await platform2.invokeMethod('jumpToIosPage');
    print('result===$result');

  }
  //跳转到Android页面
  Future<Null> _jumpToAndroidMethod() async {
    final String result = await platform3.invokeMethod('jumpToAndroidPage');
    print('result===$result');

  }


}
