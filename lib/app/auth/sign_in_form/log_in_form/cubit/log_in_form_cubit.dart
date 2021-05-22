import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'log_in_form_state.dart';
part 'log_in_form_cubit.freezed.dart';

class LogInFormCubit extends Cubit<LogInFormState> {
  LogInFormCubit() : super(LogInFormState.initial());
}
