import 'package:flutter/material.dart';

// If someone is free and seeing this then please fill in questions[] with some real questions and the solutions[] with corresponding solutions. Thank you.

List<bool> solutions = [
  true,
  false,
  true,
  false,
  true,
  false,
  true,
];

Icon wrongWidget() {
  return Icon(
    Icons.close,
    color: Colors.red,
  );
}

Icon trueWidget() {
  return Icon(
    Icons.done,
    color: Colors.green,
  );
}
