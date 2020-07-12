import 'package:flutter/material.dart';
import 'input.dart';

void main() => runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple
      ),
      home:  InputData(),
    )
);