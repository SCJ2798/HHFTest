import 'package:flutter/material.dart';

class Space extends SizedBox {
  // ignore: use_key_in_widget_constructors
  Space.a(double size) : super(height: size, width: size);
  // ignore: use_key_in_widget_constructors
  Space.w(double size) : super(width: size);
  // ignore: use_key_in_widget_constructors
  Space.h(double size) : super(height: size);
}
