import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:smart_watch_ui/data/bloc/bloc_widget.dart';
import 'package:smart_watch_ui/presentation/smart_watch_home/layout/smart_watch_home.dart';
import 'package:smart_watch_ui/utils/colors.dart';
import 'package:smart_watch_ui/utils/constant.dart';

import 'model/cart_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(CartModelAdapter());
  await Hive.openBox<CartModel>(databaseName);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocWidget(
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: ColorPicker.seedColor),
        ),
        debugShowCheckedModeBanner: false,
        home: const SmartWatchHomeScreen(),
      ),
    );
  }
}
