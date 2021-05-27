import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:xyloteka/consts/http_consts.dart';
import 'package:xyloteka/data/models/auth_model.dart';
import 'package:xyloteka/data/repository/shared_preference_repository.dart';
import 'package:xyloteka/domain/auth/auth_failure.dart';
import 'package:xyloteka/domain/auth/i_auth_facade.dart';
import 'package:xyloteka/domain/auth/user.dart';
import 'package:xyloteka/domain/auth/value_objects.dart';
import 'package:http/http.dart' as http;
import './firebase_user_mapper.dart';

@LazySingleton(as: IAuthFacade)
class FirebaseAuthFacade implements IAuthFacade {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  FirebaseAuthFacade(
    this._firebaseAuth,
    this._googleSignIn,
  );

  @override
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
    required String username,
  }) async {
    final emailAddressStr = emailAddress.getOrCrash();
    final passwordStr = password.getOrCrash();
    var signUpRequest = SignUpRequest(
      username: username,
      email: emailAddressStr,
      password: passwordStr,
    );
    print(signUpRequest.toJson());
    await http.post(
      Uri.parse('${HttpConsts.url}/api/auth/signup'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: signUpRequest.toJson(),
    );
    return right(unit);
  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
    required String username,
  }) async {
    var sharedPreferenceRepository = SharedPreferenceRepository();

    final passwordStr = password.getOrCrash();

    var loginRequest = LoginRequest(
      username: username,
      password: passwordStr,
    );
    print(loginRequest);
    final response = await http.post(
      Uri.parse('${HttpConsts.url}/api/auth/signin'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: loginRequest.toJson(),
    );
    if (response.statusCode == 200) {
      var loginResponse =
          LoginResponse.fromMap(jsonDecode((utf8.decode(response.bodyBytes))));
      sharedPreferenceRepository
        ..addKeyToSF(loginResponse.accessToken)
        ..addBoolToSF(
          'login',
          true,
        );
    } else {
      throw Exception('Failed to load post');
    }
    return right(unit);
  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return left(const AuthFailure.cancelledByUser());
      }

      final googleAuthentication = await googleUser.authentication;

      final authCredential = GoogleAuthProvider.credential(
        idToken: googleAuthentication.idToken,
        accessToken: googleAuthentication.accessToken,
      );

      await _firebaseAuth.signInWithCredential(authCredential);
      return right(unit);
    } on FirebaseAuthException catch (_) {
      return left(const AuthFailure.serverError());
    }
  }

  @override
  Future<void> signOut() => Future.wait([
        _googleSignIn.signOut(),
        _firebaseAuth.signOut(),
      ]);

  @override
  Future<Option<User>> getSignedInUser() async =>
      optionOf(_firebaseAuth.currentUser?.toDomain());
}
