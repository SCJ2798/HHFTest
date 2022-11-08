import 'package:flutter/material.dart';

double prefferedWidth(BuildContext context, double precentage) =>
    MediaQuery.of(context).size.width * precentage;

double prefferedHeight(BuildContext context, double precentage) =>
    MediaQuery.of(context).size.height * precentage;
