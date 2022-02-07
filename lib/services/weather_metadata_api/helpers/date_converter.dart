import 'package:intl/intl.dart';

/*
* Get utc date outputs day abbreviation.
* Example: '2022-02-05 18:00:00' => 'Saturday'.
* - - - -
* If the input utcDate == utc current date, the mthod will return abbreviation 'Today'.
*/

String getDayAbbr({required String utcDate}){
    final currentDay = DateTime.now();
    final dateFormat = DateFormat("EEEE");

    final dateAbbr = dateFormat.format(DateTime.parse(utcDate));
    final currentDateAbbr = dateFormat.format(currentDay);

    return dateAbbr == currentDateAbbr ? 'Today' : dateAbbr;
}

/*
* Get utc date outputs 24 hours format.
* Example: '2022-02-05 18:00:00' => '18:00'.
*/

String getHours({required String utcDate}){
    final DateFormat hoursFormat = DateFormat("Hm");
    final String hours = hoursFormat.format(DateTime.parse(utcDate));

    return hours;
}





