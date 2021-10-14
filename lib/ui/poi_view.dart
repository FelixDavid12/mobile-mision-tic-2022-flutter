import 'package:flutter/material.dart';
import 'package:mobile_mission_tic_flutter/models/poi.dart';
import 'package:get/get.dart';
import 'package:mobile_mission_tic_flutter/widgets/info_poi.dart';

import '../widgets/maps.dart';

class POIView extends StatelessWidget {
  POIView({Key? key}) : super(key: key);

  final POI currentPOI = Get.arguments;

  @override
  Widget build(BuildContext context) {
    Widget galleryPOIs = Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        _imageGallery('lib/assets/versailles_0.jpg', context),
        _imageGallery('lib/assets/versailles_1.jpg', context),
        _imageGallery('lib/assets/versailles_2.jpg', context),
        _imageGallery('lib/assets/versailles_3.jpg', context),
      ]),
    );

    Widget descriptionPOI(POI currentPOI) {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 16),
        child: Text(currentPOI.detail),
      );
    }

    return Scaffold(
        appBar: AppBar(title: Text(currentPOI.name)),
        body: ListView(
          children: [
            Image.asset('lib/assets/test/' + currentPOI.img + ".jpg",
                width: double.infinity, height: 200, fit: BoxFit.cover),
            Container(
              margin: const EdgeInsets.all(16),
              child: Wrap(
                runSpacing: 10,
                children: [
                  galleryPOIs,
                  InfoPOI(
                      name: currentPOI.name,
                      location: currentPOI.location,
                      rating: currentPOI.rating),
                  descriptionPOI(currentPOI),
                  SizedBox(
                    height: MediaQuery.of(context).size.width / 2,
                    width: MediaQuery.of(context).size.width,
                    child: Maps(data: {
                      "lat": currentPOI.lat,
                      "lng": currentPOI.long,
                      "markerId": currentPOI.name
                    }),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}

Flexible _imageGallery(String urlImg, context) {
  bool isLandscape =
      MediaQuery.of(context).orientation == Orientation.landscape;

  return Flexible(
      flex: 1,
      child: Container(
        height: isLandscape ? 100 : 50,
        margin: const EdgeInsets.only(right: 5.0),
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(urlImg),
              fit: BoxFit.fill,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(5))),
      ));
}

/*Widget galleryPOI(context){
  bool isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

  return Container(
    height: isLandscape ? 100 : 60,
    margin: const EdgeInsets.only(bottom: 16),
    child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
        Flexible(
        flex: 1,
        child: Container(
          height: 50,
          margin: const EdgeInsets.only(right: 5.0),
          decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/assets/versailles_1.jpg'),
                fit: BoxFit.fitHeight,
              ),
              borderRadius: BorderRadius.all(Radius.circular(5))),
        )
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
}*/
