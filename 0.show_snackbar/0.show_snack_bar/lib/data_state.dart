import 'package:flutter/material.dart';

@immutable
abstract class DataState {}

class Initial extends DataState {}

class Loading extends DataState {}

class Success extends DataState {}
