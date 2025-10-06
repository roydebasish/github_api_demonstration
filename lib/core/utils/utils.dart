import 'package:intl/intl.dart';

String formatDateTime(String? dateTime) {
   if (dateTime == null || dateTime.isEmpty) return "No date";
   try {
     final date = DateTime.tryParse(dateTime);
     if (date == null) return "Invalid date";
     return DateFormat('MM-dd-yyyy HH:mm').format(date);
   } catch (_) {
     return "Invalid date";
   }
 }