import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardInitial()) {
    on<NavigateToUsers>((event, emit) => emit(DashboardNavigateTo('/users')));
    on<NavigateToCriteria>(
      (event, emit) => emit(DashboardNavigateTo('/criteria')),
    );
    on<NavigateToAssessment>(
      (event, emit) => emit(DashboardNavigateTo('/assessment')),
    );
    on<NavigateToReports>(
      (event, emit) => emit(DashboardNavigateTo('/reports')),
    );
    on<NavigateToKPIs>((event, emit) => emit(DashboardNavigateTo('/kpis')));
    on<NavigateToPlans>((event, emit) => emit(DashboardNavigateTo('/plans')));
    on<NavigateToNotifications>(
      (event, emit) => emit(DashboardNavigateTo('/notifications')),
    );
    on<NavigateToLogout>((event, emit) => emit(DashboardNavigateTo('/logout')));
  }
}
