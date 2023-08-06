import 'dart:async';

import 'package:build_manager/domain/api/firebase_api.dart';
import 'package:build_manager/domain/models/over_user/over_user.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'projects_event.dart';
part 'projects_state.dart';

class ProjectsBloc extends Bloc<ProjectsEvent, ProjectsState> {
  final _auth = FirebaseAuth.instance;

  ProjectsBloc() : super(ProjectsInitial()) {
    on<ProjectsToLoadEvent>(_onLoad);
  }

  Future<void> _onLoad(
    ProjectsToLoadEvent event,
    Emitter<ProjectsState> emit,
  ) async {
    final uid = _auth.currentUser?.uid;

    if (uid == null) {
      if (kDebugMode) {
        print('ID - пользователя не наден');
      }
      return;
    }

    final user = await FirebaseApi.getUser(uid) ?? const OverUser();

    final state = ProjectsLoaded(user: user);
    
    
    emit(state);
  }
}
