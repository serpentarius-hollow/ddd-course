import 'package:another_flushbar/flushbar_helper.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/auth/auth_bloc.dart';
import '../../../application/notes/actor/notes_actor_bloc.dart';
import '../../../application/notes/watcher/notes_watcher_bloc.dart';
import '../../../injection.dart';
import '../../routes/router.gr.dart';
import 'widgets/notes_overview_body.dart';
import 'widgets/notes_switch.dart';

class NotesOverviewPage extends StatelessWidget {
  const NotesOverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authBloc = context.read<AuthBloc>();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<NotesWatcherBloc>()
            ..add(const NotesWatcherEvent.watchAllStarted()),
        ),
        BlocProvider(
          create: (context) => getIt<NotesActorBloc>(),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              state.maybeMap(
                unauthenticated: (value) {
                  context.router.replace(const SignInRoute());
                },
                orElse: () {},
              );
            },
          ),
          BlocListener<NotesActorBloc, NotesActorState>(
            listener: (context, state) {
              state.maybeMap(
                deleteFailed: (value) {
                  FlushbarHelper.createError(
                    message: value.noteFailure.maybeMap(
                      unexpected: (_) => 'Unexpected Error',
                      insufficientPermission: (_) => 'Insufficient Permission',
                      orElse: () => 'Impossible Error',
                    ),
                  );
                },
                orElse: () {},
              );
            },
            child: Container(),
          )
        ],
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Notes'),
            centerTitle: true,
            leading: IconButton(
              onPressed: () {
                authBloc.add(const AuthEvent.signedOut());
              },
              icon: const Icon(Icons.exit_to_app),
            ),
            actions: const [
              NotesSwitch(),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              context.router.push(NoteFormRoute());
            },
            child: const Icon(Icons.add),
          ),
          body: const NotesOverviewBody(),
        ),
      ),
    );
  }
}
