import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:xyloteka/data/repository/shared_preference_repository.dart';
import 'package:xyloteka/domain/auth/i_auth_facade.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthFacade _authFacade;
  final SharedPreferenceRepository sharedPreferenceRepository;
  AuthBloc(this._authFacade, this.sharedPreferenceRepository)
      : super(const AuthState.initial());
  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    yield* event.map(
      authCheckRequested: (e) async* {
        var isLogIn = await sharedPreferenceRepository.getBoolFromSF('login');
        if (isLogIn == null && isLogIn == false) {
          yield const AuthState.unauthenticated();
        } else {
          yield const AuthState.authenticated();
        }
      },
      signedOut: (e) async* {
        await _authFacade.signOut();
        sharedPreferenceRepository.addBoolToSF(
          'login',
          true,
        );
        yield const AuthState.unauthenticated();
      },
    );
  }
}
