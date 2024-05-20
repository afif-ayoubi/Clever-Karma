import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/map_page/map_form.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late GoogleMapController mapController;

  // final locationController = Location();

  final LatLng _center = const LatLng(33.8547, 35.8623);
  final LatLng _tripoliCoordinates = const LatLng(34.4366, 35.8497);

  LatLng? currentPosition;
  Map<PolylineId, Polyline> polylines = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(Duration(milliseconds: 0));
      await initializeMap();    });
  }

  Future<void> initializeMap() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    currentPosition = LatLng(
      prefs.getDouble('currentLat') ?? 0.0,
      prefs.getDouble('currentLng') ?? 0.0,
    );

    print('currentPosition: $currentPosition');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _map(),
    );
  }

  Widget _map() {
    return MapForm(
      center: _center,
      currentPosition: currentPosition,
      tripoliCoordinates: _tripoliCoordinates,
    );
  }
}
