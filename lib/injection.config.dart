// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i4;
import 'package:firebase_auth/firebase_auth.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i5;
import 'package:injectable/injectable.dart' as _i2;

import 'application/auth/auth_bloc.dart' as _i14;
import 'application/auth/sign_in_form/sign_in_form_bloc.dart' as _i13;
import 'application/notes/actor/notes_actor_bloc.dart' as _i10;
import 'application/notes/form/notes_form_bloc.dart' as _i11;
import 'application/notes/watcher/notes_watcher_bloc.dart' as _i12;
import 'domain/auth/i_auth_facade.dart' as _i6;
import 'domain/notes/i_note_repository.dart' as _i8;
import 'infrastructure/auth/firebase_auth_facade.dart' as _i7;
import 'infrastructure/core/injectable_module.dart' as _i15;
import 'infrastructure/notes/notes_repository.dart'
    as _i9; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final injectableModule = _$InjectableModule();
  gh.lazySingleton<_i3.FirebaseAuth>(() => injectableModule.firebaseAuth);
  gh.lazySingleton<_i4.FirebaseFirestore>(() => injectableModule.firestore);
  gh.lazySingleton<_i5.GoogleSignIn>(() => injectableModule.googleSignIn);
  gh.lazySingleton<_i6.IAuthFacade>(() =>
      _i7.FirebaseAuthFacade(get<_i3.FirebaseAuth>(), get<_i5.GoogleSignIn>()));
  gh.lazySingleton<_i8.INoteRepository>(
      () => _i9.NotesRepository(get<_i4.FirebaseFirestore>()));
  gh.factory<_i10.NotesActorBloc>(
      () => _i10.NotesActorBloc(get<_i8.INoteRepository>()));
  gh.factory<_i11.NotesFormBloc>(
      () => _i11.NotesFormBloc(get<_i8.INoteRepository>()));
  gh.factory<_i12.NotesWatcherBloc>(
      () => _i12.NotesWatcherBloc(get<_i8.INoteRepository>()));
  gh.factory<_i13.SignInFormBloc>(
      () => _i13.SignInFormBloc(get<_i6.IAuthFacade>()));
  gh.factory<_i14.AuthBloc>(() => _i14.AuthBloc(get<_i6.IAuthFacade>()));
  return get;
}

class _$InjectableModule extends _i15.InjectableModule {}
