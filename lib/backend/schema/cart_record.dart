import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CartRecord extends FirestoreRecord {
  CartRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "service_price" field.
  String? _servicePrice;
  String get servicePrice => _servicePrice ?? '';
  bool hasServicePrice() => _servicePrice != null;

  // "service_name" field.
  String? _serviceName;
  String get serviceName => _serviceName ?? '';
  bool hasServiceName() => _serviceName != null;

  // "serviceId" field.
  String? _serviceId;
  String get serviceId => _serviceId ?? '';
  bool hasServiceId() => _serviceId != null;

  // "service_desc" field.
  String? _serviceDesc;
  String get serviceDesc => _serviceDesc ?? '';
  bool hasServiceDesc() => _serviceDesc != null;

  // "serviceImage" field.
  String? _serviceImage;
  String get serviceImage => _serviceImage ?? '';
  bool hasServiceImage() => _serviceImage != null;

  void _initializeFields() {
    _userId = snapshotData['userId'] as String?;
    _servicePrice = snapshotData['service_price'] as String?;
    _serviceName = snapshotData['service_name'] as String?;
    _serviceId = snapshotData['serviceId'] as String?;
    _serviceDesc = snapshotData['service_desc'] as String?;
    _serviceImage = snapshotData['serviceImage'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('cart');

  static Stream<CartRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CartRecord.fromSnapshot(s));

  static Future<CartRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CartRecord.fromSnapshot(s));

  static CartRecord fromSnapshot(DocumentSnapshot snapshot) => CartRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CartRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CartRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CartRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CartRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCartRecordData({
  String? userId,
  String? servicePrice,
  String? serviceName,
  String? serviceId,
  String? serviceDesc,
  String? serviceImage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userId': userId,
      'service_price': servicePrice,
      'service_name': serviceName,
      'serviceId': serviceId,
      'service_desc': serviceDesc,
      'serviceImage': serviceImage,
    }.withoutNulls,
  );

  return firestoreData;
}

class CartRecordDocumentEquality implements Equality<CartRecord> {
  const CartRecordDocumentEquality();

  @override
  bool equals(CartRecord? e1, CartRecord? e2) {
    return e1?.userId == e2?.userId &&
        e1?.servicePrice == e2?.servicePrice &&
        e1?.serviceName == e2?.serviceName &&
        e1?.serviceId == e2?.serviceId &&
        e1?.serviceDesc == e2?.serviceDesc &&
        e1?.serviceImage == e2?.serviceImage;
  }

  @override
  int hash(CartRecord? e) => const ListEquality().hash([
        e?.userId,
        e?.servicePrice,
        e?.serviceName,
        e?.serviceId,
        e?.serviceDesc,
        e?.serviceImage
      ]);

  @override
  bool isValidKey(Object? o) => o is CartRecord;
}
