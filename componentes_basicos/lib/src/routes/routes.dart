import 'package:flutter/material.dart';
import 'package:componentes_basicos/src/pages/alert_page.dart';
import 'package:componentes_basicos/src/pages/avatar_page.dart';
import 'package:componentes_basicos/src/pages/home_page.dart';
import 'package:componentes_basicos/src/pages/card_page.dart';
import 'package:componentes_basicos/src/pages/animated_container_page.dart';
import 'package:componentes_basicos/src/pages/input_page.dart';
import 'package:componentes_basicos/src/pages/slider_page.dart';
import 'package:componentes_basicos/src/pages/list_page.dart';


Map<String, WidgetBuilder> getApplicationRoutes(){
  return <String, WidgetBuilder>{
        '/'       : (BuildContext context) => HomePage(),
        'alert'   : (BuildContext context) => AlertPage(),
        'avatar'  : (BuildContext context) => AvatarPage(),
        'card'    : (BuildContext context) => CardPage(),
        'animatedContainer'  : (BuildContext context) => AnimatedContainerPage(),
        'inputs'  : (BuildContext context) => InputPage(),
        'slider'  : (BuildContext context) => SliderPage(),
        'list'    : (BuildContext context) => ListPage()
  };
}