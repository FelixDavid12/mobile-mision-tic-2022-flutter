import 'package:flutter/material.dart';
import 'package:mobile_mission_tic_flutter/models/poi_list.dart';
import 'package:mobile_mission_tic_flutter/poi_view.dart';
import 'package:mobile_mission_tic_flutter/remote/api.dart';

import 'package:get/get.dart';

import 'models/poi.dart';

class POISListView extends StatefulWidget {
  const POISListView({Key? key}) : super(key: key);

  @override
  _POISListViewState createState() => _POISListViewState();
}

class _POISListViewState extends State<POISListView> {
  late Future<POIList> futureList;


  @override
  void initState() {
    super.initState();
    futureList = fetchPOIs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("POIS List View"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: FutureBuilder(
          future: futureList,
          builder: (context, AsyncSnapshot<POIList> snapshot) {
            if (snapshot.hasData) {
              List<Widget> elements = <Widget>[];
              snapshot.data!.pois.forEach((element) {
                elements.add(itemCard(element, context));
              });
              return Wrap(
                runSpacing: 10,
                children: elements,
              );
            }

            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

Widget itemCard(POI cardContent, BuildContext context) {
  return Card(
    elevation: 5.0,
    clipBehavior: Clip.antiAlias,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0),
    ),
    child: InkWell(
      splashColor: Colors.black.withAlpha(30),
      onTap: () {
        Get.to(() => POIView(), arguments: cardContent);
      },
      child: Column(
        children: [
          Image(
            image: cardContent.img != 'louvre11'
                ? AssetImage("lib/assets/test/" + cardContent.img + ".jpg")
                : const AssetImage("lib/assets/test/tower_eiffel.jpg"),
            fit: BoxFit.fill,
          ),
          Container(
            margin: const EdgeInsets.all(20.0),
            child: Wrap(
              runSpacing: 10,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    cardContent.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    textScaleFactor: 1.5,
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    cardContent.detail,
                    textScaleFactor: 1.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}