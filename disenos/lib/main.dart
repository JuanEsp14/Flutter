import 'package:disenos/src/pages/basico_page.dart';
import 'package:disenos/src/pages/compuesto_page.dart';
import 'package:disenos/src/pages/scroll_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Disenos',
      initialRoute: 'compuesto',

      routes: {
        'basico'    : (BuildContext context) => BasicoPage(),
        'scroll'    :(BuildContext context) => ScrollPage(),
        'compuesto'    :(BuildContext context) => CompuestoPage(),
      },
    );
  }
}