import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CollectionToFixBugRecord extends FirestoreRecord {
  CollectionToFixBugRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "owner" field.
  String? _owner;
  String get owner => _owner ?? '';
  bool hasOwner() => _owner != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  void _initializeFields() {
    _owner = snapshotData['owner'] as String?;
    _date = snapshotData['date'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('collection_toFixBug');

  static Stream<CollectionToFixBugRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CollectionToFixBugRecord.fromSnapshot(s));

  static Future<CollectionToFixBugRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => CollectionToFixBugRecord.fromSnapshot(s));

  static CollectionToFixBugRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CollectionToFixBugRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CollectionToFixBugRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CollectionToFixBugRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CollectionToFixBugRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CollectionToFixBugRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCollectionToFixBugRecordData({
  String? owner,
  DateTime? date,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'owner': owner,
      'date': date,
    }.withoutNulls,
  );

  return firestoreData;
}

class CollectionToFixBugRecordDocumentEquality
    implements Equality<CollectionToFixBugRecord> {
  const CollectionToFixBugRecordDocumentEquality();

  @override
  bool equals(CollectionToFixBugRecord? e1, CollectionToFixBugRecord? e2) {
    return e1?.owner == e2?.owner && e1?.date == e2?.date;
  }

  @override
  int hash(CollectionToFixBugRecord? e) =>
      const ListEquality().hash([e?.owner, e?.date]);

  @override
  bool isValidKey(Object? o) => o is CollectionToFixBugRecord;
}
