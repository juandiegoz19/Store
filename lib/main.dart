import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/presentation/home/view/HomePage.dart';
import 'package:store/presentation/main/view/MainPage.dart';
import 'package:store/presentation/shopping/view_model/shopping_vm.dart';
import 'package:store/presentation/utils/theme/palette.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch : Palette.whiteToDark,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.light, 
      home: MainPage(),
      debugShowCheckedModeBanner: false,
      
      onInit: () {
        
      },
    );
  }
}
