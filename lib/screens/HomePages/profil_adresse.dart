import 'dart:async';

import'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:mynan/Constantes/customeTheme.dart';

const kGoogleApiKey = "AIzaSyCk77TfuPCTmAYFGMB2sF27Tb3LhJYHt7Q";
GoogleMapsPlaces _places = GoogleMapsPlaces(apiKey: kGoogleApiKey);

class ProfilAdresse extends StatefulWidget {

  static const routeName = 'profilAdresse';

  @override
  _ProfilAdresseState createState() => _ProfilAdresseState();
}

class _ProfilAdresseState extends State<ProfilAdresse> {

  CameraPosition _newCoordonnee;

  final homeScaffoldKey = GlobalKey<ScaffoldState>();

  Mode _mode = Mode.overlay;

  bool getPosloader = false;

  TextEditingController _placeControleur = TextEditingController();

  Completer<GoogleMapController> _controller = Completer();

  final Map<String, Marker> _markers = {};

  static LatLng _center = LatLng(5.432887099999999, -4.0388918);

  _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  Future<void> _handlePressButton() async {
    Prediction p = await PlacesAutocomplete.show(
      context: context,
      apiKey: kGoogleApiKey,
      onError: onError,
      mode: _mode,
      language: "fr",
      components: [Component(Component.country, "ci")],
    );
    await displayPrediction(p, homeScaffoldKey.currentState);
  }

  void onError(PlacesAutocompleteResponse response) {
    print(response.errorMessage);
    homeScaffoldKey.currentState.showSnackBar(
      SnackBar(content: Text(response.errorMessage)),
    );
  }

  void _getLocation(String strLieux, final lat, final lng) async {
    setState(() {
      getPosloader = true;
    });


    setState(() {
      getPosloader = false;
      _markers.clear();
      final marker = Marker(
        markerId: MarkerId("curr_loc"),
        position: LatLng(lat, lng),
        infoWindow: InfoWindow(title: '$strLieux'),
      );
      _markers['Current Location'] = marker;
    });
  }

  Future<Null> displayPrediction(Prediction p, ScaffoldState scaffold) async {
    if (p != null) {
      PlacesDetailsResponse detail =
      await _places.getDetailsByPlaceId(p.placeId);
      final lat = detail.result.geometry.location.lat;
      final lng = detail.result.geometry.location.lng;

      _newCoordonnee = CameraPosition(
          bearing: 192.8334901395799,
          target: LatLng(lat, lng),
          tilt: 59.440717697143555,
          zoom: 19.151926040649414);

      print(p.description);
      _goToTheNewposision();
      _getLocation(p.description, lat, lng);
      print("${p.description} - $lat/$lng");
      setState(() {
        _placeControleur.text = p.description;
        _center = LatLng(lat, lng);
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: primaryColor,
        title: Text('myNaN', style: TextStyle(
          fontFamily: 'Barlow', fontSize: 20
        ),),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: deviceHeight,
            width: deviceWidth,
            child: GoogleMap(
                mapType: MapType.normal,
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 11.0,
              ),
              markers: _markers.values.toSet(),
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(
                top: deviceHeight * .05,
                left: deviceWidth * .1,
                right: deviceWidth * .1),
            height: deviceHeight * .07,
            width: deviceWidth / 1.2,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5)),
            child: TextField(
              onTap: () {
                _handlePressButton();
              },
              cursorColor: Colors.grey,
              controller: _placeControleur,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.location_on,
                  color: primaryColor,
                  size: 20,
                ),
                hintText: "cocody",
                hintStyle: TextStyle(),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
          onPressed: () {
            print('esthy est une star');
          },
        child: Icon(Icons.map)
      ),
    );
  }

  Future<void> _goToTheNewposision() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_newCoordonnee));
  }
}
