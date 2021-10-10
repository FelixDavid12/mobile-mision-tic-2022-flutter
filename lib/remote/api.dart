import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobile_mission_tic_flutter/models/poi_list.dart';

Future<POIList> fetchPOIs() async {
  final response = await http.get(Uri.parse('https://my-json-server.typicode.com/FelixDavid12/mobile-mision-tic-2022/pois'));

  if (response.statusCode == 200){
    return POIList.fromJson(jsonDecode(response.body));
  }
  else{
    throw Exception('Failed to load POIs');
  }
}




