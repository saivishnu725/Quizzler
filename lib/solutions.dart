import 'package:flutter/material.dart';

List<bool> solutions = [
  true,
  false,
  true,
  false,
  true,
  false,
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
