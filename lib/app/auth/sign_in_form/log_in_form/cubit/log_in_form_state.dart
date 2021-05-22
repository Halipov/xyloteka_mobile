part of 'log_in_form_cubit.dart';

@freezed
abstract class LogInFormState with _$LogInFormState {
  const factory LogInFormState.initial() = _Initial;
  const factory LogInFormState.emailChange(String emailStr) = EmailChange;
  const factory LogInFormState.passwordChange(String emailStr) = PasswordChange;
  const factory LogInFormState.registerWithEmailAndPasswordPressed(
      String emailStr) = RegisterWithEmailAndPasswordPressed;
  const factory LogInFormState.signInWithEmailAndPasswordPressed(
      String emailStr) = SignInWithEmailAndPasswordPressed;
  const factory LogInFormState.signInWithGooglePressed(String emailStr) =
      SignInWithGooglePressed;
}
