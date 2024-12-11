import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PlacesRecord extends FirestoreRecord {
  PlacesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "location" field.
  String? _location;
  String get location => _location ?? '';
  bool hasLocation() => _location != null;

  // "img" field.
  String? _img;
  String get img => _img ?? '';
  bool hasImg() => _img != null;

  // "Cordonates" field.
  LatLng? _cordonates;
  LatLng? get cordonates => _cordonates;
  bool hasCordonates() => _cordonates != null;

  // "uid_places" field.
  int? _uidPlaces;
  int get uidPlaces => _uidPlaces ?? 0;
  bool hasUidPlaces() => _uidPlaces != null;

  void _initializeFields() {
    _location = snapshotData['location'] as String?;
    _img = snapshotData['img'] as String?;
    _cordonates = snapshotData['Cordonates'] as LatLng?;
    _uidPlaces = castToType<int>(snapshotData['uid_places']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('places');

  static Stream<PlacesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PlacesRecord.fromSnapshot(s));

  static Future<PlacesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PlacesRecord.fromSnapshot(s));

  static PlacesRecord fromSnapshot(DocumentSnapshot snapshot) => PlacesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PlacesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PlacesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PlacesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PlacesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPlacesRecordData({
  String? location,
  String? img,
  LatLng? cordonates,
  int? uidPlaces,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'location': location,
      'img': img,
      'Cordonates': cordonates,
      'uid_places': uidPlaces,
    }.withoutNulls,
  );

  return firestoreData;
}

class PlacesRecordDocumentEquality implements Equality<PlacesRecord> {
  const PlacesRecordDocumentEquality();

  @override
  bool equals(PlacesRecord? e1, PlacesRecord? e2) {
    return e1?.location == e2?.location &&
        e1?.img == e2?.img &&
        e1?.cordonates == e2?.cordonates &&
        e1?.uidPlaces == e2?.uidPlaces;
  }

  @override
  int hash(PlacesRecord? e) => const ListEquality()
      .hash([e?.location, e?.img, e?.cordonates, e?.uidPlaces]);

  @override
  bool isValidKey(Object? o) => o is PlacesRecord;
}
