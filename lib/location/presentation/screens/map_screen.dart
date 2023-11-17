import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:roya_center/core/presentation/styles/app_images.dart';
import '../../../core/presentation/styles/sizes.dart';
import '../widgets/location_card.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  bool? isFirstLocation;
  bool? isSecondLocation;
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(25.1187158, 55.3157923),
    zoom: 11,
  );

  static const CameraPosition _firstLocation = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(25.1111658, 55.2179403),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);
  static const CameraPosition _secondLocation = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(25.2342244, 55.2700174),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  GoogleMap(
                    mapType: MapType.hybrid,
                    initialCameraPosition: _kGooglePlex,
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                    markers: {
                      Marker(
                          markerId: const MarkerId('_firstLocation'),
                          icon: BitmapDescriptor.defaultMarker,
                          position: _firstLocation.target),
                      Marker(
                          markerId: const MarkerId('_secondLocation'),
                          icon: BitmapDescriptor.defaultMarker,
                          position: _secondLocation.target),
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.arrow_circle_right,
                          size: Sizes.icon44, color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
            Column(
              children: [
                const SizedBox(height: Sizes.paddingV4),
                InkWell(
                  onTap: () {
                    setState(() {
                      isFirstLocation = true;
                      isSecondLocation = false;
                    });
                    _goToFirstLocation();
                  },
                  child: SizedBox(
                    height: Sizes.imageH110,
                    child: LocationCard(
                      isSelected: isFirstLocation,
                      image: AppImages.locationImage1,
                      name: 'Roya Medical Center\n( Jumeirah Branch)',
                      rating: '4.8',
                      time: 'Open 9 AM–8 PM',
                    ),
                  ),
                ),
                const SizedBox(height: Sizes.paddingV4),
                InkWell(
                  onTap: () {
                    setState(() {
                      isSecondLocation = true;
                      isFirstLocation = false;
                    });
                    _goTosecondLocation();
                  },
                  child: SizedBox(
                    height: Sizes.imageH110,
                    child: LocationCard(
                      isSelected: isSecondLocation,
                      image: AppImages.locationImage2,
                      name:
                          'Roya Medical Center\n( Al Barsha 2 , Street 1 - villa 1\nUmm suqaym Road )',
                      rating: '4.8',
                      time: 'Open 11 AM–7 PM',
                    ),
                  ),
                ),
                
              ],
            )
          ],
        ),
      ),
    
    );
  }

  Future<void> _goToFirstLocation() async {
    final GoogleMapController controller = await _controller.future;
    await controller
        .animateCamera(CameraUpdate.newCameraPosition(_firstLocation));
  }

  Future<void> _goTosecondLocation() async {
    final GoogleMapController controller = await _controller.future;
    await controller
        .animateCamera(CameraUpdate.newCameraPosition(_secondLocation));
  }
}
