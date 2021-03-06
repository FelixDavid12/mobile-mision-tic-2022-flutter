import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_mission_tic_flutter/models/poi_list.dart';
import 'package:mobile_mission_tic_flutter/ui/poi_view.dart';
import 'package:mobile_mission_tic_flutter/remote/api.dart';

import 'package:get/get.dart';
import 'package:mobile_mission_tic_flutter/ui/settings.dart';
import 'package:mobile_mission_tic_flutter/widgets/info_poi.dart';

import 'package:mobile_mission_tic_flutter/models/poi.dart';

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
        actions: [
          IconButton(
              onPressed: () {
                Get.to(const Settings());
              },
              icon: const Icon(Icons.settings))
        ],
      ),
      body: FutureBuilder(
        future: futureList,
        builder: (context, AsyncSnapshot<POIList> snapshot) {
          if (snapshot.hasData) {
            List<Widget> elements = <Widget>[];

            for (var element in snapshot.data!.pois) {
              elements.add(itemCard(element));
            }

            if (MediaQuery.of(context).orientation == Orientation.landscape){
              return GridView.count(
                crossAxisCount: 2,
                children: elements,
              );
            }
            else{
              return SingleChildScrollView(
                child: Wrap(
                  runSpacing: 10,
                  children: elements,
                )
              );
            }
          }

          return const CircularProgressIndicator();
        },
      ),
    );
  }
}

Widget itemCard(POI cardContent) {
  return Card(
    margin: const EdgeInsets.all(10),
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
            image: AssetImage("lib/assets/" + cardContent.img + ".jpg"),
            fit: BoxFit.fill,
            height: 225,
          ),
          Container(
            margin: const EdgeInsets.all(20.0),
            child: Wrap(
              runSpacing: 10,
              children: [
                InfoPOI(
                    name: cardContent.name,
                    location: cardContent.location,
                    rating: cardContent.rating
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
