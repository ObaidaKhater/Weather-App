import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:weather_app/pages/choose_location_service_page/widgets/custom_service_location_data_sheet.dart';
import 'package:weather_app/providers/location_service_provider.dart';

class ChooseLocationServicePage extends StatefulWidget {
  const ChooseLocationServicePage({
    Key? key,
  }) : super(key: key);

  @override
  State<ChooseLocationServicePage> createState() =>
      _ChooseLocationServicePageState();
}

class _ChooseLocationServicePageState extends State<ChooseLocationServicePage> {
  // value padding map
  EdgeInsets padding = EdgeInsets.only(bottom: 100.h);
  // panel controller service map page
  PanelController panelControllerServiceMapPage = PanelController();

  @override
  Widget build(BuildContext context) {
    return Consumer<LocationServiceProvider>(
        builder: (context, providerLocationService, x) {
      return Scaffold(
        body: SlidingUpPanel(
          panelSnapping: true,
          defaultPanelState: PanelState.OPEN,
          controller: panelControllerServiceMapPage,
          color: Colors.transparent,
          maxHeight: 250.h,
          minHeight: 100.h,
          parallaxEnabled: false,
          parallaxOffset: 1,
          panel: const ClipRRect(
            child: CustomServiceLocationDataSheet(),
          ),
          body: Stack(
            alignment: Alignment.topCenter,
            children: [
              GoogleMap(
                myLocationEnabled: true,
                padding: padding,
                markers: providerLocationService.markers,
                initialCameraPosition: CameraPosition(
                  target: providerLocationService.currentServicePosition,
                  zoom: providerLocationService.zoomMap,
                ),
                onTap: (position) {
                  // set new location
                  providerLocationService.clickOnServicesMap(
                    position: position,
                  );
                  // open sheet add data branch
                  panelControllerServiceMapPage.open();
                  // set padding map value
                  setState(() {
                    padding = EdgeInsets.only(
                      bottom: 100.h,
                      top: 0.65.sh,
                    );
                  });
                },
                onCameraMove: (position) {
                  // providerMap.customInfoWindowController.onCameraMove!();
                },
                onMapCreated: (GoogleMapController controller) {
                  providerLocationService.googleMapController = controller;
                },
              ),
            ],
          ),
        ),
      );
    });
  }
}
