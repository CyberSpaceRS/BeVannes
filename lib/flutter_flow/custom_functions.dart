import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

bool? dateIsThisDay(String? date) {
  // return true si le parametre date est du même jour que celui d'aujourdhui
  if (date == null) return null;
  final now = DateTime.now();
  final parsedDate = DateTime.parse(date);
  return parsedDate.year == now.year &&
      parsedDate.month == now.month &&
      parsedDate.day == now.day;
}

bool compareLatLng(
  LatLng latLng1,
  LatLng latLng2,
) {
  //  // Créer une fonction qui compare deux cordonnées (lat lng), si identique a 1km près, return true
  final latDiff = (latLng1.latitude - latLng2.latitude).abs();
  final lngDiff = (latLng1.longitude - latLng2.longitude).abs();
  return latDiff < 0.0009 && lngDiff < 0.00127;
}

bool sameDay(
  DateTime? date1,
  DateTime? date2,
) {
  // compare arguments date1 and date2, return true if the same date
  if (date1 == null || date2 == null) return false;
  return date1.year == date2.year &&
      date1.month == date2.month &&
      date1.day == date2.day;
}
