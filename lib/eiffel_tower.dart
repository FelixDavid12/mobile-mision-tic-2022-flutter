import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_mission_tic_flutter/models/poi.dart';

class EiffelTower extends StatelessWidget {
  EiffelTower({Key? key}) : super(key: key);

  final POI currentPOI = Get.arguments["currentPOI"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(currentPOI.name),
      ),
      body: Wrap(
        runSpacing: 20,
        children: [
          Image(image: AssetImage('lib/assets/test/' + currentPOI.img + '.jpg')),
          Container(
            margin: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: Wrap(
              runSpacing: 10,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    currentPOI.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    textScaleFactor: 2.0,
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    currentPOI.detail,
                    textScaleFactor: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
