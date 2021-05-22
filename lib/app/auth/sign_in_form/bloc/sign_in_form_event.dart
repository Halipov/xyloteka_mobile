part of 'sign_in_form_bloc.dart';

@freezed
class SignInFormEvent with _$SignInFormEvent {
  const factory SignInFormEvent.emailChange(String emailStr) = EmailChange;
  const factory SignInFormEvent.passwordChange(String emailStr) =
      PasswordChange;
  const factory SignInFormEvent.registerWithEmailAndPasswordPressed(
      String emailStr) = RegisterWithEmailAndPasswordPressed;
  const factory SignInFormEvent.signInWithEmailAndPasswordPressed(
      String emailStr) = SignInWithEmailAndPasswordPressed;
  const factory SignInFormEvent.signInWithGooglePressed(String emailStr) =
      SignInWithGooglePressed;
}
