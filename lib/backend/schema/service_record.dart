import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ServiceRecord extends FirestoreRecord {
  ServiceRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "service_name" field.
  String? _serviceName;
  String get serviceName => _serviceName ?? '';
  bool hasServiceName() => _serviceName != null;

  // "service_desc" field.
  String? _serviceDesc;
  String get serviceDesc => _serviceDesc ?? '';
  bool hasServiceDesc() => _serviceDesc != null;

  // "service_price" field.
  String? _servicePrice;
  String get servicePrice => _servicePrice ?? '';
  bool hasServicePrice() => _servicePrice != null;

  // "service_filter" field.
  String? _serviceFilter;
  String get serviceFilter => _serviceFilter ?? '';
  bool hasServiceFilter() => _serviceFilter != null;

  // "service_image" field.
  String? _serviceImage;
  String get serviceImage => _serviceImage ?? '';
  bool hasServiceImage() => _serviceImage != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "service_price_num" field.
  double? _servicePriceNum;
  double get servicePriceNum => _servicePriceNum ?? 0.0;
  bool hasServicePriceNum() => _servicePriceNum != null;

  void _initializeFields() {
    _serviceName = snapshotData['service_name'] as String?;
    _serviceDesc = snapshotData['service_desc'] as String?;
    _servicePrice = snapshotData['service_price'] as String?;
    _serviceFilter = snapshotData['service_filter'] as String?;
    _serviceImage = snapshotData['service_image'] as String?;
    _user = snapshotData['user'] as DocumentReference?;
    _servicePriceNum = castToType<double>(snapshotData['service_price_num']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Service');

  static Stream<ServiceRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ServiceRecord.fromSnapshot(s));

  static Future<ServiceRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ServiceRecord.fromSnapshot(s));

  static ServiceRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ServiceRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ServiceRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ServiceRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ServiceRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ServiceRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createServiceRecordData({
  String? serviceName,
  String? serviceDesc,
  String? servicePrice,
  String? serviceFilter,
  String? serviceImage,
  DocumentReference? user,
  double? servicePriceNum,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'service_name': serviceName,
      'service_desc': serviceDesc,
      'service_price': servicePrice,
      'service_filter': serviceFilter,
      'service_image': serviceImage,
      'user': user,
      'service_price_num': servicePriceNum,
    }.withoutNulls,
  );

  return firestoreData;
}

class ServiceRecordDocumentEquality implements Equality<ServiceRecord> {
  const ServiceRecordDocumentEquality();

  @override
  bool equals(ServiceRecord? e1, ServiceRecord? e2) {
    return e1?.serviceName == e2?.serviceName &&
        e1?.serviceDesc == e2?.serviceDesc &&
        e1?.servicePrice == e2?.servicePrice &&
        e1?.serviceFilter == e2?.serviceFilter &&
        e1?.serviceImage == e2?.serviceImage &&
        e1?.user == e2?.user &&
        e1?.servicePriceNum == e2?.servicePriceNum;
  }

  @override
  int hash(ServiceRecord? e) => const ListEquality().hash([
        e?.serviceName,
        e?.serviceDesc,
        e?.servicePrice,
        e?.serviceFilter,
        e?.serviceImage,
        e?.user,
        e?.servicePriceNum
      ]);

  @override
  bool isValidKey(Object? o) => o is ServiceRecord;
}
