import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

//FirebaseFirestore permite acesso aos dados do banco firebase
FirebaseFirestore _firestore = FirebaseFirestore.instance;

//referencia da coleção chamado academico
CollectionReference _reference = _firestore.collection("library");

class BookDataBase {
  //método para adicionar dados no Firebase
  static addBook({
    required String name,
    required String author,
    required String volume,
    required String edition,
    required String numberPage,
    required String publishingCompany,
    required String yearPublishing,
    String? image,
  }) async {
    DocumentReference documentReference = _reference.doc();

    Map<String, dynamic> data = <String, dynamic>{
      "name": name,
      "author": author,
      "volume": volume,
      "edition": edition,
      "numberPage": numberPage,
      "publishingCompany": publishingCompany,
      "yearPublishing": yearPublishing,
      "image": image,
    };

    await documentReference
        .set(data)
        .whenComplete(() => print("Book saved successfully."));
  }

  //Return books list
  static Stream<QuerySnapshot> booksList() {
    return _reference.snapshots();
  }

  //Update books
  static Future<void> updateBook(
    dynamic uid,
    String name,
    String author,
    String volume,
    String edition,
    String numberPage,
    String publishingCompany,
    String yearPublishing,
  ) async {
    DocumentReference documentReference = _reference.doc(uid);

    Map<String, dynamic> data = <String, dynamic>{
      "name": name,
      "author": author,
      "volume": volume,
      "edition": edition,
      "numberPage": numberPage,
      "publishingCompany": publishingCompany,
      "yearPublishing": yearPublishing,
      "image": null,
    };
    await documentReference
        .update(data)
        .whenComplete(() => print("Update Successful"));
  }

  //Delete books
  static deleteBook(
      {required String uid,
      required Function onSuccess,
      required Function onFail}) {
    DocumentReference documentReference = _reference.doc(uid);

    documentReference
        .delete()
        .whenComplete(() => onSuccess())
        .catchError((e) => onFail());
  }

  static Future<FirebaseApp> initializerFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }
}
