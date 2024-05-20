import 'dart:math';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobile/core/constants/icons_manager.dart';
import 'package:mobile/core/extensions/text_theme.dart';
import 'package:mobile/features/opportunity/domain/repositories/organization.dart';
import 'package:provider/provider.dart';

import '../../../../../core/api/providers/user_provider.dart';
import '../../../../../core/constants/assets_manager.dart';
import '../../../../../core/constants/font_manager.dart';
import '../../../../../core/theme/hex_color.dart';
import '../../../../../core/util/location_service.dart';
import '../../../../../routes/class_routes.dart';
import '../../../../auth/domain/entities/user.dart';
import '../../../../live_streaming/presentation/pages/live_streaming.dart';
import 'map_btn.dart';

class OrganizationCard extends StatefulWidget {
  const OrganizationCard({
    Key? key,
    required this.organization,
  }) : super(key: key);

  final Organization organization;

  @override
  State<OrganizationCard> createState() => _OrganizationCardState();
}

class _OrganizationCardState extends State<OrganizationCard> {
  String distanceText = '';
  LatLng? userLocation;
  String realDistance = '';
  LatLng? organizationLocation;

  @override
  void initState() {
    super.initState();
    _initUserLocation();
  }

  Future<void> _initUserLocation() async {
    try {
      final position = await LocationService.determinePosition();
      _updateDistance(position);
    } catch (e) {
      print('Error getting location: $e');
    }
  }

  void _updateDistance(Position position) {
    organizationLocation =
        LatLng(widget.organization.latitude, widget.organization.longitude);
    final distance = _calculateHaversineDistance(
      position.latitude,
      position.longitude,
      organizationLocation!.latitude,
      organizationLocation!.longitude,
    );

    if (mounted) {
      setState(() {
        userLocation = LatLng(position.latitude, position.longitude);
        realDistance = distance.toStringAsFixed(1);
        distanceText = '${distance.toStringAsFixed(1)} km from you';
      });
    }
  }

  double _calculateHaversineDistance(
      double lat1, double lon1, double lat2, double lon2) {
    const R = 6371; // Radius of the Earth in km
    final dLat = _degreesToRadians(lat2 - lat1);
    final dLon = _degreesToRadians(lon2 - lon1);
    final a = sin(dLat / 2) * sin(dLat / 2) +
        cos(_degreesToRadians(lat1)) *
            cos(_degreesToRadians(lat2)) *
            sin(dLon / 2) *
            sin(dLon / 2);
    final c = 2 * atan2(sqrt(a), sqrt(1 - a));
    return R * c;
  }

  double _degreesToRadians(double degrees) {
    return degrees * pi / 180;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 185.h,
          child: _CardWidget(
            liveId: widget.organization.liveStreamingId,
            userLocation: userLocation ?? LatLng(0, 0),
            realDistance: realDistance,
            organizationLocation: organizationLocation ?? LatLng(0, 0),
            title: widget.organization.name,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20).r,
          child: Text(
            widget.organization.name,
            style: context.bodyMedium!.copyWith(
              fontWeight: FontWeightManager.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15).r,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                IconManager.location,
                size: 25.sp,
              ),
              Text(distanceText),
            ],
          ),
        ),
        Gap(10.h),
        Divider(
          color: Colors.black,
          thickness: 1.0.sp,
          indent: 20.r,
          endIndent: 20.r,
        ),
      ],
    );
  }
}

class _CardWidget extends StatelessWidget {
  const _CardWidget({
    Key? key,
    required this.liveId,
    required this.userLocation,
    required this.realDistance,
    required this.organizationLocation,
    required this.title,
  }) : super(key: key);

  final String liveId;
  final LatLng userLocation;
  final String realDistance;
  final LatLng organizationLocation;
  final String title;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context, listen: false).User;
    final String randomUserID = Random().nextInt(10000).toString();
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20).r,
          height: 166.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: HexColor.primaryColor,
            borderRadius: BorderRadius.circular(12).w,
            image: const DecorationImage(
              image: AssetImage(AppImages.imgImg1),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          right: 30.r,
          top: 10.r,
          child: GestureDetector(
            onTap: () => _jumpToLivePage(context, user),
            child: Text(
              'Check Live',
              style: context.bodyMedium!.copyWith(
                fontSize: FontSize.s14,
                color: HexColor.secondaryColor,
                decoration: TextDecoration.underline,
                decorationColor: HexColor.secondaryColor,
                decorationThickness: 1.0.sp,
              ),
            ),
          ),
        ),
        Positioned(
          right: 30.r,
          bottom: 0.r,
          child: MapBtn(
            onPress: () => _openMapPage(context),
          ),
        ),
      ],
    );
  }

  void _jumpToLivePage(BuildContext context, User? user) {
    final String username = user?.firstName ?? "user_${Random().nextInt(10000)}";
    final String userID = user?.id ?? Random().nextInt(10000).toString();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LivePage(
          isHost: false,
          username: username,
          liveId: liveId,
          userID: userID,
        ),
      ),
    );
  }

  void _openMapPage(BuildContext context) {
    context.push(
      '${Routes.mapPage}?longitude=${userLocation.longitude.toString()}&latitude=${userLocation.latitude.toString()}&realDistance=${realDistance.toString()}&organizationLongitude=${organizationLocation.longitude.toString()}&organizationLatitude=${organizationLocation.latitude.toString()}&title=${title}',
    );
  }
}
