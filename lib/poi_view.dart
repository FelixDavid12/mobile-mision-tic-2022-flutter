import 'package:flutter/material.dart';
import 'package:mobile_mission_tic_flutter/models/poi.dart';
import 'package:get/get.dart';

class POIView extends StatelessWidget {
  POIView({Key? key}) : super(key: key);

  final POI currentPOI = Get.arguments["currentPOI"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(currentPOI.name)
        ),
        body: ListView(
          children: [
            Image.asset('lib/assets/test/' + currentPOI.img + ".jpg", width: 400, height: 200, fit: BoxFit.cover),
            galleryPOI(context),
            infoPOI(currentPOI),
            descriptionPOI(currentPOI),
            mapPOI(currentPOI),
          ],
        )
    );
  }




}

Widget infoPOI(POI currentPOI){
  return Container(
    margin: const EdgeInsets.all(16),
    child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Text(
                    currentPOI.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  currentPOI.location,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          const Text('4.5'),
        ]
    ),
  );
}

Widget descriptionPOI(POI currentPOI){
  return Container(
    margin: const EdgeInsets.all(16),
    child: Text(currentPOI.detail),
  );

}

Widget mapPOI(POI currentPOI){
  return Container(
    margin: const EdgeInsets.all(16),
    child: Image.asset('lib/assets/' + currentPOI.img + ".jpg", width: 400, height: 200, fit: BoxFit.cover),
  );
}

Widget galleryPOI(context){
  bool isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

  return Container(
    height: isLandscape ? 100 : 60,
    margin: const EdgeInsets.all(16),
    child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Image.asset('lib/assets/versailles_0.jpg', fit: BoxFit.fill),
          ),
          Expanded(
            child: Image.asset('lib/assets/versailles_1.jpg', fit: BoxFit.fill),
          ),
          Expanded(
            child: Image.asset('lib/assets/versailles_2.jpg', fit: BoxFit.fill),
          ),
          Expanded(
            child: Image.asset('lib/assets/versailles_3.jpg', fit: BoxFit.fill),
          ),
        ]
    ),
  );
}