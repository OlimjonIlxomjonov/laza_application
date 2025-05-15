import 'package:flutter/material.dart';
import 'package:laza_applicaiton/bloc_provider.dart';
import 'package:laza_applicaiton/core/di/service_locator.dart';

import 'features/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  runApp(MyBlocProvider(child: const MyApp()));
}
