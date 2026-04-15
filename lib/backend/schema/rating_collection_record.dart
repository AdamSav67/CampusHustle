import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RatingCollectionRecord extends FirestoreRecord {
  RatingCollectionRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user_email" field.
  String? _userEmail;
  String get userEmail => _userEmail ?? '';
  bool hasUserEmail() => _userEmail != null;

  // "app_rating" field.
  int? _appRating;
  int get appRating => _appRating ?? 0;
  bool hasAppRating() => _appRating != null;

  void _initializeFields() {
    _userEmail = snapshotData['user_email'] as String?;
    _appRating = castToType<int>(snapshotData['app_rating']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('rating_collection');

  static Stream<RatingCollectionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RatingCollectionRecord.fromSnapshot(s));

  static Future<RatingCollectionRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => RatingCollectionRecord.fromSnapshot(s));

  static RatingCollectionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RatingCollectionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RatingCollectionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RatingCollectionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RatingCollectionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RatingCollectionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRatingCollectionRecordData({
  String? userEmail,
  int? appRating,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_email': userEmail,
      'app_rating': appRating,
    }.withoutNulls,
  );

  return firestoreData;
}

class RatingCollectionRecordDocumentEquality
    implements Equality<RatingCollectionRecord> {
  const RatingCollectionRecordDocumentEquality();

  @override
  bool equals(RatingCollectionRecord? e1, RatingCollectionRecord? e2) {
    return e1?.userEmail == e2?.userEmail && e1?.appRating == e2?.appRating;
  }

  @override
  int hash(RatingCollectionRecord? e) =>
      const ListEquality().hash([e?.userEmail, e?.appRating]);

  @override
  bool isValidKey(Object? o) => o is RatingCollectionRecord;
}
