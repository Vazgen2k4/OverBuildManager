part of 'projects_bloc.dart';

sealed class ProjectsState extends Equatable {
  const ProjectsState();
  
  @override
  List<Object> get props => [];
}

final class ProjectsInitial extends ProjectsState {}

final class ProjectsLoaded extends ProjectsState {
  final OverUser user;

  const ProjectsLoaded({required this.user});
  
  ProjectsLoaded copyWith({OverUser? user}) {
    return ProjectsLoaded(user: user ?? this.user);
  }
  
  @override
  List<Object> get props => [user];
  
}
