import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "userRole" field.
  String? _userRole;
  String get userRole => _userRole ?? '';
  bool hasUserRole() => _userRole != null;

  // "password" field.
  String? _password;
  String get password => _password ?? '';
  bool hasPassword() => _password != null;

  // "isGuest" field.
  bool? _isGuest;
  bool get isGuest => _isGuest ?? false;
  bool hasIsGuest() => _isGuest != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "number_picture" field.
  int? _numberPicture;
  int get numberPicture => _numberPicture ?? 0;
  bool hasNumberPicture() => _numberPicture != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "picture_user" field.
  String? _pictureUser;
  String get pictureUser => _pictureUser ?? '';
  bool hasPictureUser() => _pictureUser != null;

  // "coordonee_picture" field.
  LatLng? _coordoneePicture;
  LatLng? get coordoneePicture => _coordoneePicture;
  bool hasCoordoneePicture() => _coordoneePicture != null;

  // "day_picture" field.
  DateTime? _dayPicture;
  DateTime? get dayPicture => _dayPicture;
  bool hasDayPicture() => _dayPicture != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _userRole = snapshotData['userRole'] as String?;
    _password = snapshotData['password'] as String?;
    _isGuest = snapshotData['isGuest'] as bool?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _numberPicture = castToType<int>(snapshotData['number_picture']);
    _createdTime = snapshotData['created_time'] as DateTime?;
    _pictureUser = snapshotData['picture_user'] as String?;
    _coordoneePicture = snapshotData['coordonee_picture'] as LatLng?;
    _dayPicture = snapshotData['day_picture'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  String? userRole,
  String? password,
  bool? isGuest,
  String? phoneNumber,
  int? numberPicture,
  DateTime? createdTime,
  String? pictureUser,
  LatLng? coordoneePicture,
  DateTime? dayPicture,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'userRole': userRole,
      'password': password,
      'isGuest': isGuest,
      'phone_number': phoneNumber,
      'number_picture': numberPicture,
      'created_time': createdTime,
      'picture_user': pictureUser,
      'coordonee_picture': coordoneePicture,
      'day_picture': dayPicture,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.userRole == e2?.userRole &&
        e1?.password == e2?.password &&
        e1?.isGuest == e2?.isGuest &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.numberPicture == e2?.numberPicture &&
        e1?.createdTime == e2?.createdTime &&
        e1?.pictureUser == e2?.pictureUser &&
        e1?.coordoneePicture == e2?.coordoneePicture &&
        e1?.dayPicture == e2?.dayPicture;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.userRole,
        e?.password,
        e?.isGuest,
        e?.phoneNumber,
        e?.numberPicture,
        e?.createdTime,
        e?.pictureUser,
        e?.coordoneePicture,
        e?.dayPicture
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
