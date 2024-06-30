import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color whiteUW = Color(0XFFFDFFE2);
const Color blueUW = Color(0XFF83B4FF);
const Color grayUW = Color(0XFF5A72A0);
const Color darkblueUW = Color(0XFF1A2130);

const List<Color> colorThemes = [
  whiteUW,
  blueUW,
  darkblueUW,
  grayUW,
  
];


class  AppTheme {

  final int selectedColor ;

  AppTheme({this.selectedColor = 0}):assert (selectedColor >= 0 && selectedColor<= colorThemes.length -1 , 'From 0 to 3');

  
  ThemeData theme(){
    return ThemeData(
      colorSchemeSeed: colorThemes[selectedColor]  ,
      useMaterial3: true, 
      
      
    );
  }
}





