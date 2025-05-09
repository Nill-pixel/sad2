part of 'team_bloc.dart';

abstract class TeamEvent extends Equatable {
  const TeamEvent();
  
  @override
  List<Object> get props => [];
}

class LoadTeam extends TeamEvent {}

class AddTeamMember extends TeamEvent {
  final TeamMember member;
  
  const AddTeamMember(this.member);
  
  @override
  List<Object> get props => [member];
}

class EditTeamMember extends TeamEvent {
  final TeamMember member;
  
  const EditTeamMember(this.member);
  
  @override
  List<Object> get props => [member];
}

class DeleteTeamMember extends TeamEvent {
  final String memberId;
  
  const DeleteTeamMember(this.memberId);
  
  @override
  List<Object> get props => [memberId];
}
