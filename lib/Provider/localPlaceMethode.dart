import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:geolocator/geolocator.dart';

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
      try {
        PlacesDetailsResponse detail =
            await _places.getDetailsByPlaceId(p.placeId);
        final lat = detail.result.geometry.location.lat;
        final lng = detail.result.geometry.location.lng;
        print("${p.description} => $lat,$lng");
        return {"lat": lat, "long": lng, "address": p.description};
      } catch (e) {
        print("Error to get Position ");
        return null;
      }
    }
    return null;
  }

  Future<Map<String, dynamic>> getCurrentLocation() async {
    print("Géolocator");
    try {
      Position position = await geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
      print("Get Pos user ");
      print(position.latitude);
      print(position.longitude);
      print("poss");
      Map<String,dynamic> placeString = await getAddressFromLatLng(position);
      Map<String, dynamic> result = {
        "place": [position.latitude, position.longitude],
        "address": placeString["plassComplet"],
        "ville":placeString["ville"]
      };
      return result;
    } catch (e) {
      print("Error geolocation ${e.toString()}");
      return null;
    }
  }

  Future<Map<String, dynamic>> getAddressFromLatLng(Position pos) async {
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          pos.latitude, pos.longitude);
      Placemark place = p[0];
      final currentAddress =
          "${place.name}, ${place.locality}, ${place.country} ";
      print("=> Current Adresse");
      print(currentAddress);
      Map<String, dynamic> result = {
        "plassComplet": currentAddress,
        "ville": place.locality
      };
      return result;
    } catch (e) {
      print("Error geolocation $e");
      return null;
    }
  }
}
