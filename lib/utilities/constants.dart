import 'package:flutter/material.dart';

const kBackgroundColor = Color(0xFF121212);
const kPrimaryColor = Color(0xFFFFBD73);

const kCityNameTextStyle = TextStyle(
  fontFamily: 'OpenSans',
  fontWeight: FontWeight.bold,
  fontSize: 48.0,
  color: Colors.black,
);

const kTimeTextStyle = TextStyle(
  fontFamily: 'OpenSans',
  fontSize: 32.0,
  color: Colors.black,
);

const kTemperatureTextStyle = TextStyle(
  fontFamily: 'OpenSans',
  fontWeight: FontWeight.bold,
  fontSize: 80.0,
  color: Colors.black,
);

const kConditionTextStyle = TextStyle(
  fontFamily: 'OpenSans',
  fontSize: 24.0,
  color: Colors.black,
);

const kSmallTemperatureTextStyle = TextStyle(
  fontFamily: 'OpenSans',
  fontSize: 32.0,
  color: Colors.black,
);

const kButtonTextStyle = TextStyle(
  fontFamily: 'OpenSans',
  fontSize: 32.0,
  color: Colors.black,
);

const kTextFieldInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.black,
  prefixIcon: Icon(
    Icons.place,
    color: Colors.black,
  ),
  hintText: 'City Name',
  hintStyle: TextStyle(
    color: Colors.black,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
    borderSide: BorderSide.none,
  ),
);
