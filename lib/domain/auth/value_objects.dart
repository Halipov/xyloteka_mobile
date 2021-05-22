import 'package:dartz/dartz.dart';
import 'package:xyloteka/domain/core/failures.dart';
import 'package:xyloteka/domain/core/value_objects.dart';
import 'package:xyloteka/domain/core/value_validators.dart';

class EmailAddress extends ValueObject<String> {
  factory EmailAddress(String input) {
    return EmailAddress._(
      validateEmailAddress(input),
    );
  }
  const EmailAddress._(this.value);

  @override
  final Either<ValueFailure<String>, String> value;
}

class Password extends ValueObject<String> {
  factory Password(String input) {
    return Password._(
      validateEmailAddress(input),
    );
  }
  const Password._(this.value);

  @override
  final Either<ValueFailure<String>, String> value;
}
