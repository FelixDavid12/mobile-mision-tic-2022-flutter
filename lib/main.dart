import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'eiffel_tower.dart';
import 'poi_view.dart';
import 'pois_lits_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const POISListView(),
        '/palacio_de_versalles': (context) => POIView(),
        '/torre_eiffel': (context) => EiffelTower(),
        '/puente_de_las_artes': (context) => POIView(),
        '/museo_del_louvre': (context) => POIView(),
        '/catedral_de_notre_dame': (context) => POIView(),
      },
    );
  }
}
