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

    bool isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

    Widget galleryPOIs = Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: generateImagesWidgets(currentPOI.gallery, context)
      ),
    );

    Widget descriptionPOI(POI currentPOI) {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 16),
        child: Text(currentPOI.detail),
      );
    }

    return Scaffold(
        appBar: AppBar(title: Text(currentPOI.name)),
        body: Flex(
          direction: isLandscape ? Axis.horizontal : Axis.vertical,
          children: [
            Image.asset('lib/assets/' + currentPOI.img + ".jpg",
                width: isLandscape ? 200 : double.infinity,
                height: isLandscape ? double.infinity : 200,
                fit: BoxFit.cover
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
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
              ),
            )
          ],
        )
    );
  }
}

Flexible _imageGallery(String urlImg, context) {
  bool isLandscape =
      MediaQuery.of(context).orientation == Orientation.landscape;

  return Flexible(
      flex: 1,
      child: Container(
        height: isLandscape ? 80 : 50,
        width: isLandscape ? 100 : 60,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(urlImg),
              fit: BoxFit.fill,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(5))),
      ));
}

List<Widget> generateImagesWidgets(List<dynamic> gallery, BuildContext context){
  return gallery.map((e) {
    return _imageGallery('lib/assets/' + e +  '.jpg', context);
  }).toList();
}
