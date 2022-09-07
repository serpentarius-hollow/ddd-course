import 'package:another_flushbar/flushbar_helper.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/auth/auth_bloc.dart';
import '../../../application/auth/sign_in_form/sign_in_form_bloc.dart';
import '../../loading/loading_screen.dart';
import '../../routes/router.gr.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInFormBloc, SignInFormState>(
      listener: (context, state) {
        if (state.isLoading) {
          LoadingScreen.instance().show(
            context: context,
            text: 'Loading...',
          );
        } else {
          LoadingScreen.instance().hide();
        }

        state.authFailureOrSuccess.fold(
          () => null,
          (either) => either.fold(
            (failure) {
              FlushbarHelper.createError(
                message: failure.map(
                  cancelledByUser: (_) => 'Cancelled',
                  serverError: (_) => 'Server Error',
                  emailAlreadyInUse: (_) => 'Email Already In Use',
                  invalidEmailAndPasswordCombination: (_) =>
                      'Invalid Email And Password Combination',
                ),
              ).show(context);
            },
            (_) {
              final authBloc = context.read<AuthBloc>();
              context.router.replace(const NotesOverviewRoute());
              authBloc.add(const AuthEvent.authCheckRequested());
            },
          ),
        );
      },
      builder: (context, state) {
        return Form(
          autovalidateMode: state.showErrorMessages
              ? AutovalidateMode.always
              : AutovalidateMode.disabled,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    label: Text('Email'),
                  ),
                  autocorrect: false,
                  onChanged: (value) {
                    final signInFormBloc = context.read<SignInFormBloc>();
                    signInFormBloc.add(SignInFormEvent.emailChanged(value));
                  },
                  validator: (_) {
                    final signInFormBloc = context.read<SignInFormBloc>();
                    return signInFormBloc.state.emailAddress.value.fold(
                      (f) => f.maybeMap(
                        invalidEmail: (_) => 'Invalid Email',
                        orElse: () => null,
                      ),
                      (_) => null,
                    );
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    label: Text('Password'),
                  ),
                  autocorrect: false,
                  obscureText: true,
                  onChanged: (value) {
                    final signInFormBloc = context.read<SignInFormBloc>();
                    signInFormBloc.add(SignInFormEvent.passwordChanged(value));
                  },
                  validator: (_) {
                    final signInFormBloc = context.read<SignInFormBloc>();
                    return signInFormBloc.state.password.value.fold(
                      (f) => f.maybeMap(
                        shortPassword: (_) => 'Short Password',
                        orElse: () => null,
                      ),
                      (_) => null,
                    );
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          final signInFormBloc = context.read<SignInFormBloc>();
                          signInFormBloc.add(const SignInFormEvent
                              .signInWithEmailAndPasswordPressed());
                        },
                        child: const Text('SIGN IN'),
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          final signInFormBloc = context.read<SignInFormBloc>();
                          signInFormBloc.add(const SignInFormEvent
                              .registerWithEmailAndPasswordPressed());
                        },
                        child: const Text('REGISTER'),
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    final signInFormBloc = context.read<SignInFormBloc>();
                    signInFormBloc
                        .add(const SignInFormEvent.signInWithGooglePressed());
                  },
                  child: const Text('SIGN IN WITH GOOGLE'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
