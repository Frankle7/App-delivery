import 'package:flutter/material.dart';
import 'app/core/config/env/env.dart';
import 'app/fk7_delivery_app.dart';

void main() async{
  await Env.i.load();
  runApp(const Fk7DeliveryApp());
}
