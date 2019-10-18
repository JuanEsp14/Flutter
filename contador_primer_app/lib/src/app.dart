//Contiene toda la lógica de MaterialAPP
//Widget
import 'package:flutter/material.dart';

//importaciones propias
import 'package:contador_primer_app/src/pages/home_page.dart';
import 'package:contador_primer_app/src/pages/contador_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Center(
        //child: HomePage(),
        child: ContadorPage(),
      ),
    );
  }
}