import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_webservice/places.dart';

const kGoogleApiKey = "AIzaSyCk77TfuPCTmAYFGMB2sF27Tb3LhJYHt7Q";
GoogleMapsPlaces _places = GoogleMapsPlaces(apiKey: kGoogleApiKey);

class LocalPlaceMethode {
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

  Future<Map<String, dynamic>> handlePressButton(BuildContext context) async {
    Prediction p = await PlacesAutocomplete.show(
      context: context,
      apiKey: kGoogleApiKey,
      onError: onError,
      mode: Mode.overlay,
      language: "fr",
      components: [Component(Component.country, "ci")],
    );
    return await displayPrediction(p);
  }

  //End chanp de recherche widget
  void onError(PlacesAutocompleteResponse response) {
    print("Error get Gooplace ");
    print(response.errorMessage);
  }

  Future<Map<String, dynamic>> displayPrediction(Prediction p) async {
    if (p != null) {
      PlacesDetailsResponse detail =
          await _places.getDetailsByPlaceId(p.placeId);
      final lat = detail.result.geometry.location.lat;
      final lng = detail.result.geometry.location.lng;
      print(p.description);
      print("${p.description} => $lat,$lng");
      GeoPoint place = GeoPoint(lat, lng);
      return {"place": place, "address": p.description};
    }
    return null;
  }

  getCurrentLocation() {
    print("Géolocator");
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      print("=> Longitude ${position.latitude} ${position.longitude}");
      _getAddressFromLatLng(position);
    }).catchError((e) {
      print("Error");
      print(e);
    });
  }

  _getAddressFromLatLng(Position pos) async {
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          pos.latitude, pos.longitude);
      Placemark place = p[0];
      final currentAddress =
          "${place.locality}, ${place.postalCode}, ${place.country} ";
      print("=> Current Adresse");
      print(currentAddress);
    } catch (e) {
      print(e);
    }
  }
}
