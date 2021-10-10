import 'package:mobile_mission_tic_flutter/models/poi.dart';

class POIList {

  final List<POI> pois;

  POIList({
    required this.pois
  });

  factory POIList.fromJson(List<dynamic> json) {

    List<POI> pois = <POI>[];
    pois = json.map((i) => POI.fromJson(i)).toList();

    return POIList(
        pois: pois
    );
  }

  @override
  String toString() {
    return 'POIList{pois: $pois}';
  }


}
