import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DataDayRecord extends FirestoreRecord {
  DataDayRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "idDay" field.
  int? _idDay;
  int get idDay => _idDay ?? 0;
  bool hasIdDay() => _idDay != null;

  // "timeDay" field.
  DateTime? _timeDay;
  DateTime? get timeDay => _timeDay;
  bool hasTimeDay() => _timeDay != null;

  // "imageDay" field.
  String? _imageDay;
  String get imageDay => _imageDay ?? '';
  bool hasImageDay() => _imageDay != null;

  // "CoordonneeDay" field.
  LatLng? _coordonneeDay;
  LatLng? get coordonneeDay => _coordonneeDay;
  bool hasCoordonneeDay() => _coordonneeDay != null;

  // "TexteDay" field.
  String? _texteDay;
  String get texteDay => _texteDay ?? '';
  bool hasTexteDay() => _texteDay != null;

  void _initializeFields() {
    _idDay = castToType<int>(snapshotData['idDay']);
    _timeDay = snapshotData['timeDay'] as DateTime?;
    _imageDay = snapshotData['imageDay'] as String?;
    _coordonneeDay = snapshotData['CoordonneeDay'] as LatLng?;
    _texteDay = snapshotData['TexteDay'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('data_day');

  static Stream<DataDayRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DataDayRecord.fromSnapshot(s));

  static Future<DataDayRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DataDayRecord.fromSnapshot(s));

  static DataDayRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DataDayRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DataDayRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DataDayRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DataDayRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DataDayRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDataDayRecordData({
  int? idDay,
  DateTime? timeDay,
  String? imageDay,
  LatLng? coordonneeDay,
  String? texteDay,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'idDay': idDay,
      'timeDay': timeDay,
      'imageDay': imageDay,
      'CoordonneeDay': coordonneeDay,
      'TexteDay': texteDay,
    }.withoutNulls,
  );

  return firestoreData;
}

class DataDayRecordDocumentEquality implements Equality<DataDayRecord> {
  const DataDayRecordDocumentEquality();

  @override
  bool equals(DataDayRecord? e1, DataDayRecord? e2) {
    return e1?.idDay == e2?.idDay &&
        e1?.timeDay == e2?.timeDay &&
        e1?.imageDay == e2?.imageDay &&
        e1?.coordonneeDay == e2?.coordonneeDay &&
        e1?.texteDay == e2?.texteDay;
  }

  @override
  int hash(DataDayRecord? e) => const ListEquality()
      .hash([e?.idDay, e?.timeDay, e?.imageDay, e?.coordonneeDay, e?.texteDay]);

  @override
  bool isValidKey(Object? o) => o is DataDayRecord;
}
