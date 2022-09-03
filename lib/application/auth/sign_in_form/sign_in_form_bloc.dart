import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/auth/auth_failure.dart';
import '../../../domain/auth/i_auth_facade.dart';
import '../../../domain/auth/value_objects.dart';

part 'sign_in_form_bloc.freezed.dart';
part 'sign_in_form_event.dart';
part 'sign_in_form_state.dart';

class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  final IAuthFacade _authFacade;

  SignInFormBloc(this._authFacade) : super(SignInFormState.initial()) {
    on<EmailChanged>(
      (event, emit) {
        emit(
          state.copyWith(
            emailAddress: EmailAddress(event.emailStr),
            authFailureOrSuccess: none(),
          ),
        );
      },
    );

    on<PasswordChanged>(
      (event, emit) {
        emit(
          state.copyWith(
            password: Password(event.passwordStr),
            authFailureOrSuccess: none(),
          ),
        );
      },
    );

    on<SignInWithGooglePressed>(
      (event, emit) async {
        emit(
          state.copyWith(
            isLoading: true,
            authFailureOrSuccess: none(),
          ),
        );
        final failureOrSuccess = await _authFacade.signInWithGoogle();
        emit(
          state.copyWith(
            isLoading: false,
            authFailureOrSuccess: some(failureOrSuccess),
          ),
        );
      },
    );

    on<RegisterWithEmailAndPasswordPressed>(
      (event, emit) async {
        Either<AuthFailure, Unit>? failureOrSuccess;

        final isEmailAddressValid = state.emailAddress.isValid;
        final isPasswordValid = state.password.isValid;

        if (isEmailAddressValid && isPasswordValid) {
          emit(
            state.copyWith(
              isLoading: true,
              authFailureOrSuccess: none(),
            ),
          );

          failureOrSuccess = await _authFacade.registerWithEmailAndPassword(
            emailAddress: state.emailAddress,
            password: state.password,
          );
        }

        emit(
          state.copyWith(
            isLoading: false,
            showErrorMessages: true,
            authFailureOrSuccess: optionOf(failureOrSuccess),
          ),
        );
      },
    );

    on<SignInWithEmailAndPasswordPressed>(
      (event, emit) async {
        Either<AuthFailure, Unit>? failureOrSuccess;

        final isEmailAddressValid = state.emailAddress.isValid;
        final isPasswordValid = state.password.isValid;

        if (isEmailAddressValid && isPasswordValid) {
          emit(
            state.copyWith(
              isLoading: true,
              authFailureOrSuccess: none(),
            ),
          );

          failureOrSuccess = await _authFacade.signInWithEmailAndPassword(
            emailAddress: state.emailAddress,
            password: state.password,
          );
        }

        emit(
          state.copyWith(
            isLoading: false,
            showErrorMessages: true,
            authFailureOrSuccess: optionOf(failureOrSuccess),
          ),
        );
      },
    );
  }
}
