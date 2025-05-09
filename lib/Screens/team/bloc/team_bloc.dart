import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sad2/Screens/team/model/team_member.dart';

part 'team_event.dart';
part 'team_state.dart';

class TeamBloc extends Bloc<TeamEvent, TeamState> {
  TeamBloc() : super(TeamInitial()) {
    // Register event handlers here
    on<LoadTeam>(_onLoadTeam);
    on<AddTeamMember>(_onAddTeamMember);
    on<EditTeamMember>(_onEditTeamMember);
    on<DeleteTeamMember>(_onDeleteTeamMember);
  }

  void _onLoadTeam(LoadTeam event, Emitter<TeamState> emit) async {
    emit(TeamLoading());
    try {
      // Fetch team data
      final team = await _fetchTeamMembers();
      emit(TeamLoaded(team));
    } catch (e) {
      emit(TeamError('Failed to load team: $e'));
    }
  }

  void _onAddTeamMember(AddTeamMember event, Emitter<TeamState> emit) async {
    final currentState = state;
    if (currentState is TeamLoaded) {
      try {
        // Add team member
        final updatedTeam = [...currentState.team, event.member];
        emit(TeamLoaded(updatedTeam));
      } catch (e) {
        emit(TeamError('Failed to add team member: $e'));
      }
    }
  }

  void _onEditTeamMember(EditTeamMember event, Emitter<TeamState> emit) async {
    final currentState = state;
    if (currentState is TeamLoaded) {
      try {
        // Update team member
        final updatedTeam =
            currentState.team
                .map(
                  (member) =>
                      member.id == event.member.id ? event.member : member,
                )
                .toList();
        emit(TeamLoaded(updatedTeam));
      } catch (e) {
        emit(TeamError('Failed to edit team member: $e'));
      }
    }
  }

  void _onDeleteTeamMember(
    DeleteTeamMember event,
    Emitter<TeamState> emit,
  ) async {
    final currentState = state;
    if (currentState is TeamLoaded) {
      try {
        // Delete team member
        final updatedTeam =
            currentState.team
                .where((member) => member.id != event.memberId)
                .toList();
        emit(TeamLoaded(updatedTeam));
      } catch (e) {
        emit(TeamError('Failed to delete team member: $e'));
      }
    }
  }

  // Primeiro, vamos atualizar o método _fetchTeamMembers no TeamBloc
  Future<List<TeamMember>> _fetchTeamMembers() async {
    // Simular um delay de rede
    await Future.delayed(const Duration(milliseconds: 800));

    // Retornar uma lista de usuários mocados
    return [
      TeamMember(
        id: '1',
        name: 'Hélio Mariel',
        email: 'heliomariel@gmail.com',
        role: 'Administrador',
      ),
      TeamMember(
        id: '2',
        name: 'Leonardo Teca',
        email: 'leonardoteca@gmail.com',
        role: 'Usuário',
      ),
      TeamMember(
        id: '3',
        name: 'Etianete Reepson',
        email: 'etianetereepson@gmail.com',
        role: 'Usuário',
      ),
    ];
  }
}
