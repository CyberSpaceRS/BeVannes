import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _photoDejaPrise = prefs.getBool('ff_photoDejaPrise') ?? _photoDejaPrise;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _ImagaSearch =
      'https://i.pinimg.com/originals/67/56/66/675666d840a9c8fa1c61eaf584ff2a50.gif';
  String get ImagaSearch => _ImagaSearch;
  set ImagaSearch(String _value) {
    _ImagaSearch = _value;
  }

  LatLng? _CoordonneeSearch = LatLng(47.65861659999999, -2.7599022);
  LatLng? get CoordonneeSearch => _CoordonneeSearch;
  set CoordonneeSearch(LatLng? _value) {
    _CoordonneeSearch = _value;
  }

  String _TexteSearch = 'Loading...';
  String get TexteSearch => _TexteSearch;
  set TexteSearch(String _value) {
    _TexteSearch = _value;
  }

  LatLng? _coordonneDay = LatLng(47.65861659999999, -2.7599022);
  LatLng? get coordonneDay => _coordonneDay;
  set coordonneDay(LatLng? _value) {
    _coordonneDay = _value;
  }

  LatLng? _cordonneePicture = LatLng(0, 0);
  LatLng? get cordonneePicture => _cordonneePicture;
  set cordonneePicture(LatLng? _value) {
    _cordonneePicture = _value;
  }

  DateTime? _date1 = DateTime.fromMillisecondsSinceEpoch(1061640000000);
  DateTime? get date1 => _date1;
  set date1(DateTime? _value) {
    _date1 = _value;
  }

  DateTime? _date2 = DateTime.fromMillisecondsSinceEpoch(1703415600000);
  DateTime? get date2 => _date2;
  set date2(DateTime? _value) {
    _date2 = _value;
  }

  bool _photoDejaPrise = false;
  bool get photoDejaPrise => _photoDejaPrise;
  set photoDejaPrise(bool _value) {
    _photoDejaPrise = _value;
    prefs.setBool('ff_photoDejaPrise', _value);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
