import 'dart:html';

import 'package:dartz/dartz.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shop_application/data/auth/models/create_user.dart';
import 'package:shop_application/domain/authintication/repository/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shop_application/presentation/authintication/pages/sign_up%20_page.dart';

abstract class AuthFirebaseService{
  Future<Either>signUp(UserCreateReq user);
  Future<Either>getAges();
}
class AuthFirebaseServiceImpl extends AuthFirebaseService{
  @override
  Future<Either> signUp(UserCreateReq user) async{
    try{
      final returnedData=await FirebaseAuth.instance.createUserWithEmailAndPassword(email: user.email, password: user.password);
      await FirebaseFirestore.instance.collection('users').doc(returnedData.user!.uid).set({
        'firstname':user.firstName,
        'lastname':user.lastName,
        'emailaddress':user.email,
        'gender':user.gender,
        'age':user.age
      });
      return right('you creating email successfully');

    }
    on FirebaseAuthException catch(e){
      String message='';
      if (e.code == 'weak-password') {
        message= 'the password provided is too weak';
      } else if (e.code == 'email-already-in-use') {
        message='an account already exist with that email';
      }
      return left(message);
    }
    }

  @override
  Future<Either> getAges() async{
   try{
    QuerySnapshot querySnapshot= await FirebaseFirestore.instance.collection('ages').get();
    return right(querySnapshot.docs);
   }
   on FirebaseException catch(e){
     return left('please try again');
   }
  }
  }