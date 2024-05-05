import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

import '../../core/constants/map.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  late GoogleMapController mapController;
  final locationController = Location();

  final LatLng _center = const LatLng(33.8547, 35.8623);
  final LatLng _tripoliCoordinates = const LatLng(34.4366, 35.8497);

  LatLng? currentPosition;
  Map<PolylineId, Polyline> polylines = {};



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await initializeMap();
    });
  }
  Future<void> initializeMap() async {
    await fetchLocationUpdates();
    final coordinates = await fetchPolylinePoints();
    generatePolyLineFromPoints(coordinates);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentPosition == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : GoogleMap(
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 13.0,
              ),
              markers: {
                Marker(
                  markerId: const MarkerId('currentLocation'),
                  icon: BitmapDescriptor.defaultMarker,
                  position: currentPosition!,
                  infoWindow: const InfoWindow(
                    title: 'Here you are!',
                    snippet: 'My location',
                  ),
                ),
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
              },
              polylines: Set<Polyline>.of(polylines.values),
            ),
    );
  }

  Future<void> fetchLocationUpdates() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await locationController.serviceEnabled();
    if (serviceEnabled) {
      serviceEnabled = await locationController.requestService();
    } else {
      return;
    }

    permissionGranted = await locationController.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await locationController.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    locationController.onLocationChanged.listen((currentLocation) {
      if (currentLocation.latitude != null &&
          currentLocation.longitude != null) {
        setState(() {
          currentPosition = LatLng(
            currentLocation.latitude!,
            currentLocation.longitude!,
          );
        });
        print(currentPosition);
      }
    });
  }

  Future<List<LatLng>> fetchPolylinePoints() async {
    final polylinePoints = PolylinePoints();

    final result = await polylinePoints.getRouteBetweenCoordinates(
      GOOGLE_API_KEY,
      PointLatLng(_center.latitude, _center.longitude),
      PointLatLng(currentPosition!.latitude, currentPosition!.longitude),
    );

    if (result.points.isNotEmpty) {
      return result.points
          .map((point) => LatLng(point.latitude, point.longitude))
          .toList();
    } else {
      print(result.errorMessage);
      return [];
    }
  }

  Future<void> generatePolyLineFromPoints(
      List<LatLng> polylineCoordinates) async {
    const id = PolylineId('polyline');

    final polyline = Polyline(
      polylineId: id,
      color: Colors.blueAccent,
      points: polylineCoordinates,
      width: 5,
    );

    setState(() => polylines[id] = polyline);
  }
}
