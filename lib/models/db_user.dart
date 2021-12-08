import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//FirebaseFirestore permite acesso aos dados do banco firebase
FirebaseFirestore _firestore = FirebaseFirestore.instance;

//referencia da coleção chamado academico
CollectionReference _reference = _firestore.collection("users");

//inicialização da instância de autenticação no firebase
FirebaseAuth auth = FirebaseAuth.instance;

class UserDataBase {
  //Criação de usuários na aplicação
  static signUp(
      {required String userId,
      required String password,
      required String userName,
      required String userType,
      required Function onFail,
      required Function onSuccess}) async {
    try {
      User? user = (await auth.createUserWithEmailAndPassword(
              email: userId, password: password))
          .user;

      //Salvando dados do usuário no banco de dados
      DocumentReference documentReference = _reference.doc(userId);

      await documentReference.set({
        'userId': userId,
        'password': password,
        'name': userName,
        'userType': userType
      }).whenComplete(() => print("User saved  successfully."));

      onSuccess();
    } on FirebaseAuthException catch (e) {
      print("Erro de autenticação ${e.toString()}");
      onFail();
    } on PlatformException catch (p) {
      print(p.toString());
      onFail();
    }
  }

  //Autenticação do usuário
  static signIn(
      {required String userId,
      required String password,
      required Function onFail,
      required Function onSuccess}) async {
    try {
      await auth.signInWithEmailAndPassword(email: userId, password: password);
      onSuccess();
    } on FirebaseAuthException catch (e) {
      print("Erro de autenticação ${e.toString()}");

      onFail();
    } on PlatformException catch (p) {
      print(p.toString());
      onFail();
    }
  }

  //LogOut
  static Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  static typeUserLogIn(String userId) async {
    String users = await _reference
        .where('userId', isEqualTo: userId)
        .where('userType', isEqualTo: 'Administrator')
        .toString();

    print(users);
    //return users.size;
  }

  //inicializado base de dados de forma assincrona, podendo executar outros apps
  // ao mesmo tempo que busca no bd
  static Future<FirebaseApp> initializerFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }
}
