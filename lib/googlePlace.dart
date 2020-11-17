// import 'package:flutter/material.dart';
// import 'package:flutter_google_places/flutter_google_places.dart';
// import 'package:google_maps_webservice/places.dart';
// import 'package:geolocator/geolocator.dart';

// const kGoogleApiKey = "AIzaSyCk77TfuPCTmAYFGMB2sF27Tb3LhJYHt7Q";
// GoogleMapsPlaces _places = GoogleMapsPlaces(apiKey: kGoogleApiKey);

// class GooglePlace extends StatefulWidget {
//   GooglePlace({Key key}) : super(key: key);

//   @override
//   _GooglePlaceState createState() => _GooglePlaceState();
// }

// class _GooglePlaceState extends State<GooglePlace> {
//   TextEditingController _placeControleur = TextEditingController();
//   Mode _mode = Mode.overlay;
//   final homeScaffoldKey = GlobalKey<ScaffoldState>();
//   Position _currentPosition;
//   String _currentAddress;

//   final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

//   Future<void> _handlePressButton() async {
//     Prediction p = await PlacesAutocomplete.show(
//       context: context,
//       apiKey: kGoogleApiKey,
//       onError: onError,
//       mode: _mode,
//       language: "fr",
//       components: [Component(Component.country, "ci")],
//     );

//     displayPrediction(p, homeScaffoldKey.currentState);
//   }

//   //End chanp de recherche widget
//   void onError(PlacesAutocompleteResponse response) {
//     print(response.errorMessage);
//     homeScaffoldKey.currentState.showSnackBar(
//       SnackBar(content: Text(response.errorMessage)),
//     );
//   }

//   Future<Null> displayPrediction(Prediction p, ScaffoldState scaffold) async {
//     if (p != null) {
//       PlacesDetailsResponse detail =
//           await _places.getDetailsByPlaceId(p.placeId);
//       final lat = detail.result.geometry.location.lat;
//       final lng = detail.result.geometry.location.lng;

//       print(p.description);
//       print("${p.description} => $lat,$lng");
//       setState(() {
//         _placeControleur.text = p.description;
//       });
//     }
//   }

//   _getCurrentLocation() {
//     print("Géolocator");
//     geolocator
//         .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
//         .then((Position position) {
//       setState(() {
//         _currentPosition = position;
//       });
//       print(
//           "=> Longitude ${_currentPosition.latitude} ${_currentPosition.longitude}");
//       _getAddressFromLatLng();
//     }).catchError((e) {
//       print("Error");
//       print(e);
//     });
//   }

//   _getAddressFromLatLng() async {
//     try {
//       List<Placemark> p = await geolocator.placemarkFromCoordinates(
//           _currentPosition.latitude, _currentPosition.longitude);
//       Placemark place = p[0];
//       setState(() {
//         _currentAddress =
//             "${place.locality}, ${place.postalCode}, ${place.country} ";
//       });
//       print("=> Current Adresse");
//       print(_currentAddress);
//     } catch (e) {
//       print(e);
//     }
//   }
//   // Cocody, Abidjan, Côte d'Ivoire => -3.9674371/5.3602164
//   // Angré, Abidjan, Côte d'Ivoire => -3.982740499999999/5.3862285
//   // Station Pétro Ivoire Angré BD Latrille, L 160, Abidjan, Côte d'Ivoire => -3.991009/5.4047008
//   // Abobo, Abidjan, Côte d'Ivoire => 5.432887099999999,-4.0388918
//   //  Abobo Pk18, Abidjan, Côte d'Ivoire => 5.4101225,-4.007531699999999

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Test google place "),
//         centerTitle: true,
//       ),
//       body: Column(
//         children: <Widget>[
//           Container(
//             child: Container(
//               margin: EdgeInsets.symmetric(horizontal: 5),
//               padding: EdgeInsets.symmetric(horizontal: 15),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(5),
//                 // color: Colors.grey,
//               ),
//               child: TextField(
//                 onTap: () {
//                   _handlePressButton();
//                 },
//                 controller: _placeControleur,
//                 cursorColor: Colors.amber,
//                 decoration: InputDecoration(
//                     border: InputBorder.none,
//                     hintText: 'Adresse ou quartier ',
//                     icon: Icon(
//                       Icons.place,
//                       color: Colors.amber,
//                     )),
//                 onSubmitted: (val) {
//                   print("Soumissions du form ");
//                 },
//               ),
//             ),
//           ),
//           Container(
//             child: IconButton(
//               icon: Icon(Icons.location_on),
//               onPressed: _getCurrentLocation,
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
