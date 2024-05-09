import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapForm extends StatefulWidget {
  const MapForm({
    super.key,
    required LatLng center,
    required this.currentPosition,
    required LatLng tripoliCoordinates,
    required this.polylines,
  }) : _center = center, _tripoliCoordinates = tripoliCoordinates;

  final LatLng _center;
  final LatLng? currentPosition;
  final LatLng _tripoliCoordinates;
  final Map<PolylineId, Polyline> polylines;

  @override
  State<MapForm> createState() => _MapFormState();
}

class _MapFormState extends State<MapForm> {
  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: widget._center,
        zoom: 13.0,
      ),
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
      markers: {
        Marker(
          markerId: const MarkerId('currentLocation'),
          icon: BitmapDescriptor.defaultMarker,
          position: widget.currentPosition!,
          infoWindow: const InfoWindow(
            title: 'Here you are!',
            snippet: 'My location',
          ),
        ),
        Marker(
          markerId: const MarkerId('1'),
          icon: BitmapDescriptor.defaultMarker,
          position: widget._center,
          infoWindow: const InfoWindow(
            title: 'Central City Blood Donation Center',
            snippet: 'Lebanon, Beirut - 1.1 km from you',
          ),
        ),
        Marker(
          markerId: const MarkerId('2'),
          icon: BitmapDescriptor.defaultMarker,
          position: widget._tripoliCoordinates,
          infoWindow: const InfoWindow(
            title: 'Central City Blood Donation Center',
            snippet: 'Lebanon, Beirut - 1.1 km from you',
          ),
        ),
      },
      // polylines: Set<Polyline>.of(widget.polylines.values),
    );
  }
}
