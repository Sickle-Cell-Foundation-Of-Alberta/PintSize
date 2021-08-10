// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:json_annotation/json_annotation.dart';
// part 'example.g.dart';

// /// Deserialize Firebase DocumentReference data type from Firestore
// DocumentReference firestoreDocRefFromJson(dynamic value) {
//   if (value is DocumentReference) {
//     return Firestore.instance.document(value.path);
//   } else if (value is String) {
//     return Firestore.instance.document(value);
//   }
//   return null;
// }

// /// This method only stores the "relation" data type back in the Firestore
// dynamic firestoreDocRefToJson(dynamic value) => value;

// /// Deserialize Firebase Timestamp data type from Firestore
// Timestamp firestoreTimestampFromJson(dynamic value) {
//   return value != null ? Timestamp.fromMicrosecondsSinceEpoch(value) : value;
// }

// /// This method only stores the "timestamp" data type back in the Firestore
// dynamic firestoreTimestampToJson(dynamic value) => value;

// @JsonSerializable()
// class Example {
//   String name;

//   @JsonKey(
//     fromJson: firestoreTimestampFromJson,
//     toJson: firestoreTimestampToJson,
//   )
//   Timestamp timestamp;

//   @JsonKey(
//     toJson: firestoreDocRefToJson,
//     fromJson: firestoreDocRefFromJson,
//   )
//   DocumentReference reference;

//   Example();

//   /// Create a Example from JSON format
//   factory Example.fromJson(Map<String, dynamic> json) =>
//       json == null ? null : _$ExampleFromJson(json);

//   /// Convert an Example to JSON format
//   Map<String, dynamic> toJson() => _$ExampleToJson(this);
// }