import 'package:daladala_smart/routes/route-names.dart';
import 'package:daladala_smart/src/service/map-serivces.dart';
import 'package:daladala_smart/src/utils/app_const.dart';
import 'package:daladala_smart/src/widgets/app-map.dart';
import 'package:daladala_smart/src/widgets/app_base_screen.dart';
import 'package:daladala_smart/src/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class searchBus extends StatefulWidget {
  var destination;
  var dire;
  var route;
  searchBus(
      {Key? key,
      required this.destination,
      required this.dire,
      required this.route,})
      : super(key: key);

  @override
  State<searchBus> createState() => _searchBusState();
}

class _searchBusState extends State<searchBus> {
  Position? position;
  @override
  void initState() {
    super.initState();
    _navigatortohome();
  }

  Future getHome() async {
    final mapService _mapService = await mapService();
    position = await _mapService.determinePosition();
  }

  _navigatortohome() async {
    await getHome().whenComplete(() async {
      await Future.delayed(Duration(seconds: 5), () {});
      Navigator.pushNamed(context, RouteNames.buses);
    });
  }

  TextEditingController search = TextEditingController();
  bool marked = true;
  bool marked1 = false;
  @override
  Widget build(BuildContext context) {
    return AppBaseScreen(
      isvisible: false,
      backgroundImage: false,
      backgroundAuth: false,
      padding: EdgeInsets.all(0),
      child: Stack(
        children: [
          FutureBuilder(
            future: getHome(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                return SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: CustomGoogleMap(
                    initialCameraPosition:
                        LatLng(position!.latitude, position!.longitude),
                    markers: Set<Marker>.of([
                      Marker(
                        markerId: MarkerId("Userlocation"),
                        position:
                            LatLng(position!.latitude, position!.longitude),
                        icon: BitmapDescriptor.defaultMarker,
                        infoWindow: InfoWindow(
                          title: 'Your Location',
                          onTap: () => null,
                        ),
                      ),
                    ]),
                  ),
                );
              }
            },
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height,
            child: Container(
              decoration: BoxDecoration(
                color: AppConst.whiteOpacity,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 2,
                  ),
                  SpinKitCircle(
                    size: 70,
                    color: AppConst.black,
                  ),
                  AppText(
                    txt: 'Searching for Provider',
                    size: 15,
                    color: AppConst.black,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
