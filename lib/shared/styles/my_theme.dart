import 'package:flutter/material.dart';

class MyThemeData{
  static ThemeData lightTheme =ThemeData(
    appBarTheme: const AppBarTheme(
      color: Color(0xff9CF1FD) ,
      elevation:0
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color.fromRGBO(93, 156, 236, 1.0),
      elevation: 0,
    ),
    bottomNavigationBarTheme:  const BottomNavigationBarThemeData(
      elevation: 5,
       selectedIconTheme: IconThemeData(color:  Color.fromRGBO(93, 156, 236, 1.0) ),

    ),
    textTheme: const TextTheme(

        headlineLarge: TextStyle(
        color:Color.fromRGBO(20, 25, 34, 1.0)
        ,fontSize:22 ,
        fontWeight: FontWeight.bold),
      headlineMedium: TextStyle(
          color:Colors.white
          ,fontSize:22 ,
          fontWeight: FontWeight.bold),
        headlineSmall: TextStyle(
            color:Color.fromRGBO(97, 231, 87, 1.0)
            ,fontSize:18 ,
            fontWeight: FontWeight.bold),
        titleLarge: TextStyle(
            color: Color.fromRGBO(93, 156, 236, 1.0)
        ,fontSize:18 ,
            fontWeight: FontWeight.bold)
    ),
    scaffoldBackgroundColor: const Color.fromRGBO(223, 236, 219, 1.0),
        primaryColor:const Color.fromRGBO(93, 156, 236, 1.0)  ,//Color.fromRGBO(93, 156, 236, 1.0)
    colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary:Color.fromRGBO(93, 156, 236, 1.0) ,
        onPrimary: Colors.white,//#61E757
        secondary:Color.fromRGBO(97, 231, 87, 1.0) ,//#EC4B4B
        onSecondary: Color.fromRGBO(20, 25, 34, 1.0),// Color.fromRGBO(97, 231, 87, 1.0)
        error: Colors.redAccent,
        onError: Colors.white,
        surface: Colors.white,
        onSurface: Color.fromRGBO(6, 14, 30, 1.0),

    )//#363636
  );
  static ThemeData darkTheme =ThemeData(
      scaffoldBackgroundColor:const Color.fromRGBO(6, 14, 30, 1.0),
      primaryColor:const Color.fromRGBO(93, 156, 236, 1.0) ,
      colorScheme: const ColorScheme(
          brightness:Brightness.dark ,
          primary: Color.fromRGBO(93, 156, 236, 1.0) ,//#060E1E
          onPrimary: Color.fromRGBO(6, 14, 30, 1.0) ,
          secondary:Color.fromRGBO(93, 156, 236, 1.0)  ,
          onSecondary:Color.fromRGBO(6, 14, 30, 1.0) ,//#141922
          error:Color.fromRGBO(93, 156, 236, 1.0),
          onError:Colors.white ,
          surface:Color.fromRGBO(6, 14, 30, 1.0) ,
          onSurface:Colors.white )
  );
}