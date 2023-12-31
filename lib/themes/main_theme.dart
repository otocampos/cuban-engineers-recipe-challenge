import 'package:flutter/material.dart';

final ThemeData mainTheme = ThemeData(
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      side: BorderSide(color: Colors.black, width: 2),

      foregroundColor: Colors.black, shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(8.0), // Ajuste o raio conforme desejado
      ),
      backgroundColor: Colors.white,
    ),
  ),
  scaffoldBackgroundColor: Colors.grey.shade50,
  textTheme: const TextTheme(
    headlineSmall: TextStyle(
      fontSize: 17,
      color: Colors.black54,
    ),
    headlineLarge: TextStyle(
      fontSize: 30, // Tamanho da fonte para headline1
      fontWeight: FontWeight.bold, // Peso da fonte
      color: Colors.black, // Cor do texto
    ),
    titleMedium: TextStyle(
      fontSize: 16, // Tamanho da fonte para headline1
      fontWeight: FontWeight.bold, // Peso da fonte
      color: Colors.black, // Cor do texto
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(8.0), // Ajuste o raio conforme desejado
      ),
      foregroundColor: Colors.white,
      backgroundColor: Colors.black,
    ),
  ),
  appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      iconTheme: IconThemeData(color: Colors.black),
      actionsIconTheme: IconThemeData(color: Colors.black45),
      centerTitle: true,
      elevation: 0,
      titleTextStyle: TextStyle(color: Colors.black)),

  hintColor: Colors.green,
  colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
      .copyWith(background: Colors.white),
);
