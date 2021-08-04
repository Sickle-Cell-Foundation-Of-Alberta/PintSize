// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';


// class Firebase extends StatelessWidget {
//   // This should be the path of the document that you created
// final DocumentReference cacheDocRef = Firestore.instance.doc('status/status');

// // This should be the timestamp field in that document
// final String cacheField = 'updatedAt';

// final Query query = Firestore.instance.collection('collection');
// final QuerySnapshot snapshot = await FirestoreCache.getDocuments(
//     query: query,
//     cacheDocRef: cacheDocRef,
//     firestoreCacheField: cacheField,
// );


//   final databaseReference = FirebaseFirestore.instance;

//   @override
//   Widget build(BuildContext context) {
//     getData();
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Firebase Connect'),
//       ),
//       body: Center(
//           child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//       )), //center
//     );
//   }

//   void getData() {
//     databaseReference.once().then((DataSnapshot snapshot) {
//       print('Data : ${snapshot.value}');
//     });
//   }
// }
// // 