import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'ask_location_permission.dart';

class Maps extends StatefulWidget {
  final Map<String, dynamic> data;
  const Maps({Key? key, required this.data}) : super(key: key);

  @override
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  late GoogleMapController mapController;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void initState() {
    super.initState();

    // required for geo localization
    determinePosition();
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      onMapCreated: _onMapCreated,
      myLocationButtonEnabled: true,
      myLocationEnabled: true,
      markers: {
        Marker(
          markerId: MarkerId(widget.data["markerId"]),
          position: LatLng(widget.data["lat"], widget.data["lng"])
        )
      },
      initialCameraPosition: CameraPosition(
        target: LatLng(widget.data["lat"], widget.data["lng"]),
        zoom: 13.0
      ),
      padding: const EdgeInsets.only(top: 40.0,),
    );
  }
}
