import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const primaryColor = Color.fromRGBO(67, 2, 63, 1);


List<String> userDefaultImageUrl = [
  "https://cdn.pixabay.com/photo/2016/11/14/04/45/elephant-1822636__480.jpg",
  "https://cdn.pixabay.com/photo/2016/11/12/11/51/forest-1818690__480.jpg",
  "https://cdn.pixabay.com/photo/2017/02/20/18/03/cat-2083492__480.jpg",
  "https://cdn.pixabay.com/photo/2017/10/31/07/49/horses-2904536__480.jpg",
  "https://cdn.pixabay.com/photo/2017/01/14/12/59/iceland-1979445__480.jpg",
  "https://cdn.pixabay.com/photo/2016/01/08/11/57/butterfly-1127666__480.jpg",
  "https://cdn. DateTime now = DateTime.now();pixabay.com/photo/2017/12/11/15/34/lion-3012515__480.jpg",
  "https://cdn.pixabay.com/photo/2018/07/31/22/08/lion-3576045__480.jpg",
  "https://cdn.pixabay.com/photo/2014/08/29/03/02/horses-430441__480.jpg",
];




class DateFormatter {

  static String getVerboseDateTimeRepresentation(DateTime dateTime,DateTime now) {

    DateTime justNow = now.subtract(Duration(minutes: 1));
    DateTime localDateTime = dateTime.toLocal();

    if (!localDateTime.difference(justNow).isNegative) {
      return "à l'instant";
    }

    String roughTimeString = DateFormat('Hm').format(dateTime);
    if (localDateTime.day == now.day && localDateTime.month == now.month && localDateTime.year == now.year) {
      return roughTimeString;
    }

    DateTime yesterday = now.subtract(Duration(days: 1));
    if (localDateTime.day == yesterday.day && localDateTime.month == yesterday.month && localDateTime.year == yesterday.year) {
      return 'Hier, ' + roughTimeString;
    }

    if (now.difference(localDateTime).inDays < 4) {
      String weekday = DateFormat('EEEE').format(localDateTime);
      return '$weekday, $roughTimeString';
    }

    return '${DateFormat('yMd').format(dateTime)}, $roughTimeString';


  }
}

class FormaterdateTo{

  static String getVerboseDateTime(DateTime dateTime,DateTime now) {

    DateTime justNow = now.subtract(Duration(minutes: 1));
    DateTime localDateTime = dateTime.toLocal();

    String roughTimeString = DateFormat('Hm').format(dateTime);
    if (localDateTime.day == now.day && localDateTime.month == now.month && localDateTime.year == now.year) {
      return roughTimeString;
    }

  }

}