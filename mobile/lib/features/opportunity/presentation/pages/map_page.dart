import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../auth/presentation/widgets/common_widgets/app_bar.dart';
import '../widgets/map_page/map_form.dart';

class MapPage extends StatefulWidget {
  const MapPage(
      {super.key,
      required this.longitude,
      required this.latitude,
      required this.realDistance,
      required this.organizationLongitude,
      required this.organizationLatitude,
      required this.title});

  final String realDistance;
  final String organizationLongitude;
  final String organizationLatitude;
  final String longitude;
  final String latitude;
  final String title;

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late GoogleMapController mapController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            _map(),
            Padding(
                padding: EdgeInsets.only(left: 23.w, top: 23.h),
              child: CustomAppBar(),
            ),

          ],
        ),
      ),
    );
  }

  Widget _map() {
    return MapForm(
      center: LatLng(double.parse(widget.organizationLatitude),
          double.parse(widget.organizationLongitude)),
      currentPosition:
          LatLng(double.parse(widget.latitude), double.parse(widget.longitude)),
      title: widget.title,
      snippet: widget.realDistance,
    );
  }
}
