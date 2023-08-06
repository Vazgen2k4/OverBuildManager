part of 'projects_bloc.dart';

sealed class ProjectsEvent extends Equatable {
  const ProjectsEvent();

  @override
  List<Object> get props => [];
}

class ProjectsToLoadEvent extends ProjectsEvent {
  const ProjectsToLoadEvent();
}