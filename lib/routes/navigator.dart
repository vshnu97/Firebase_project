import 'package:flutter/material.dart';

class Routes {
  static final navigationKey = GlobalKey<NavigatorState>();



static pushScreen({required var screen}){
  navigationKey.currentState?.push(MaterialPageRoute(builder: (context)=>screen));
}

static pushReplacementScreen({required var screen}){
  navigationKey.currentState?.pushReplacement(MaterialPageRoute(builder: (context)=>screen));
}

static popScreen(){

  navigationKey.currentState?.pop();

}


}