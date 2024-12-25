import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:wtf_sliding_sheet/wtf_sliding_sheet.dart';

import '../controllers/slider_provider.dart';
import '../controllers/user_controller.dart';
import 'destination_entry.dart';

class RouteSetUp extends StatefulWidget {
  const RouteSetUp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RouteSetUpState createState() => _RouteSetUpState();
}

class _RouteSetUpState extends State<RouteSetUp> {
  late GoogleMapController googleMapController;
  SheetController destinationSheetController = SheetController();
  SliderProviderService sliderProviderService = SliderProviderService();

  late BuildContext sliderContext;
  late String mapStyle;

//slider sheet listner
  void _sliderlistner(SheetState sheetState) {
    if (sheetState.isExpanded) {
      if (sliderProviderService.isPickUpDestinationExpanded == false) {
        sliderProviderService.isPickUpDestinationExpanded = true;
        sliderProviderService.notify();
      }
    } else if (sheetState.isCollapsed) {
      if (sliderProviderService.isPickUpDestinationExpanded) {
        sliderProviderService.isPickUpDestinationExpanded = false;
        sliderProviderService.notify();
      }
    } else {}
  }

  @override
  void initState() {
    super.initState();

    sliderProviderService.destinationSheetController =
        destinationSheetController;
    sliderProviderService.createRamdomTkn();
    sliderProviderService.instance = sliderProviderService;
  }

  @override
  void dispose() {
    googleMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ChangeNotifierProvider.value(
      value: sliderProviderService,
      child: SlidingSheet(
        elevation: 8,
        listener: _sliderlistner,
        controller: destinationSheetController,
        closeOnBackButtonPressed: true,
        addTopViewPaddingOnFullscreen: true,
        cornerRadius: 16,
        minHeight: 0.4,
        openDuration: Duration(milliseconds: 300),
        snapSpec: const SnapSpec(
          snap: true,
          snappings: [0.3, 0.7, double.infinity],
          positioning: SnapPositioning.relativeToAvailableSpace,
        ),
        body: SafeArea(
            child: Container(
          height: MediaQuery.of(context).size.height * 0.7,
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                  child: GoogleMap(
                zoomGesturesEnabled: true,
                indoorViewEnabled: true,
                zoomControlsEnabled: false,
                myLocationButtonEnabled: false,
                myLocationEnabled: true,
                buildingsEnabled: true,
                trafficEnabled: false,
                initialCameraPosition: CameraPosition(
                  target: LatLng(
                      Provider.of<UserController>(context, listen: false)
                          .currentLocation!
                          .latitude,
                      Provider.of<UserController>(context, listen: false)
                          .currentLocation!
                          .longitude),
                  zoom: 17,
                ),
                mapType: MapType.normal,
                onMapCreated: (controller) {
                  googleMapController = controller;
                },
              )),
              Positioned(
                top: 10,
                left: 10,
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Card(
                    elevation: 1.0,
                    shadowColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                      ),
                      child: Container(
                        margin: EdgeInsets.all(10),
                        child: Center(
                          child: Icon(
                            FontAwesomeIcons.arrowLeft,
                            size: 22,
                            color: Colors.black.withOpacity(0.6),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 10,
                bottom: 10,
                child: Card(
                  elevation: 1.0,
                  shadowColor: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                    ),
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: Center(
                        child: GestureDetector(
                          child: Icon(
                            Icons.my_location,
                            size: 22,
                            color: Colors.black.withOpacity(0.6),
                          ),
                          onTap: () {
                            googleMapController.animateCamera(
                                CameraUpdate.newCameraPosition(CameraPosition(
                                    zoom: 16,
                                    target: LatLng(
                                        Provider.of<UserController>(context,
                                                listen: false)
                                            .currentLocation!
                                            .latitude,
                                        Provider.of<UserController>(context,
                                                listen: false)
                                            .currentLocation!
                                            .longitude))));
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        )),
        builder: (mcontext, state) {
          sliderContext = mcontext;

          sliderContext = context;
          return Consumer<SliderProviderService>(builder: (context, model, _) {
            if (model.isPickUpDestinationExpanded) {
              return const DestinationEntry();
            } else {
              return Container(
                color: Colors.red,
                height: 100,
                width: double.infinity,
              );
            }
          });
        },
      ),
    ));
  }
}
