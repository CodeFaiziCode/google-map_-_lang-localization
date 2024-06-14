import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapView extends StatefulWidget {
  const GoogleMapView({super.key});

  @override
  State<GoogleMapView> createState() => _GoogleMapViewState();
}

class _GoogleMapViewState extends State<GoogleMapView> {
  GoogleMapController? mapController;

  final LatLng _markerLocation = LatLng(24.923231, 67.057816);
  // final LatLng _center = const LatLng(24.923231, 67.057816);

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Google Map"),
        ),
        body: Container(
          child: GoogleMap(
            onMapCreated: onMapCreated,
            markers: Set<Marker>.of([
              Marker(
                markerId: MarkerId('marker_1'),
                position: _markerLocation,
                infoWindow: InfoWindow(
                  title: 'Marker Title',
                  snippet: 'Marker Snippet',
                ),
              ),
            ]),
            initialCameraPosition: CameraPosition(
              target: _markerLocation,
              zoom: 18.0,
            ),
          ),
        ));
  }
}
