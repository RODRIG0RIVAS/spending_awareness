import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:spending_awareness/app/app_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  var path = await getApplicationDocumentsDirectory();
  Hive.init(path.path.toString());

  runApp(ModularApp(module: AppModule()));
}
