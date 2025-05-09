part of 'dashboard_bloc.dart';

abstract class DashboardEvent extends Equatable {
  const DashboardEvent();

  @override
  List<Object> get props => [];
}

class NavigateToUsers extends DashboardEvent {}

class NavigateToCriteria extends DashboardEvent {}

class NavigateToAssessment extends DashboardEvent {}

class NavigateToReports extends DashboardEvent {}

class NavigateToKPIs extends DashboardEvent {}

class NavigateToPlans extends DashboardEvent {}

class NavigateToNotifications extends DashboardEvent {}

class NavigateToLogout extends DashboardEvent {}
