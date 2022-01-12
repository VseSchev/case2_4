import 'package:flutter/material.dart';

ThemeData globalThemeLight() => ThemeData(
      fontFamily: 'Georgia',
      splashColor: Colors.yellow,
      colorScheme: ColorScheme.fromSwatch(
        brightness: Brightness.light,
        primarySwatch: Colors.lightBlue,
      ).copyWith(
        secondary: Colors.green,
      ),
      textTheme: const TextTheme(
        headline1: TextStyle(
          fontWeight: FontWeight.bold,
        ),
        headline6: TextStyle(
          fontStyle: FontStyle.italic,
        ),
        bodyText2: TextStyle(
          fontFamily: 'Hind',
        ),
        headline5: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );

ThemeData globalThemeDark() => ThemeData(
      fontFamily: 'Georgia',
      splashColor: Colors.yellow,
      colorScheme: ColorScheme.fromSwatch(
        brightness: Brightness.dark,
        primarySwatch: Colors.red,
      ).copyWith(
        secondary: Colors.green,
      ),
      textTheme: const TextTheme(
        headline1: TextStyle(
          fontWeight: FontWeight.bold,
        ),
        headline6: TextStyle(
          fontStyle: FontStyle.italic,
        ),
        bodyText2: TextStyle(
          fontFamily: 'Hind',
        ),
        headline5: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );

final ButtonStyle buyBtnStyle = ButtonStyle(
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(18.0),
      side: BorderSide(color: Colors.red),
    ),
  ),
);
