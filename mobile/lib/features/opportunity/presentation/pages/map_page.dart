import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(33.8547, 35.8623);
  final LatLng _tripoliCoordinates = const LatLng(34.4366, 35.8497);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 13.0,
            ),
            markers: {
          Marker(
            markerId: const MarkerId('1'),
            icon: BitmapDescriptor.defaultMarker,
            position: _center,
            infoWindow: const InfoWindow(
              title: 'Central City Blood Donation Center',
              snippet: 'Lebanon, Beirut - 1.1 km from you',
            ),
          ),
          Marker(
            markerId: const MarkerId('2'),
            icon: BitmapDescriptor.defaultMarker,
            position: _tripoliCoordinates,
            infoWindow: const InfoWindow(
              title: 'Central City Blood Donation Center',
              snippet: 'Lebanon, Beirut - 1.1 km from you',
            ),
          ),
        }));
  }
}
