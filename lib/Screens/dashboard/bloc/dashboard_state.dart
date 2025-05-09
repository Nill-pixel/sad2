part of 'dashboard_bloc.dart';

abstract class DashboardState extends Equatable {
  const DashboardState();

  @override
  List<Object> get props => [];
}

class DashboardInitial extends DashboardState {}

class DashboardNavigateTo extends DashboardState {
  final String route;
  const DashboardNavigateTo(this.route);

  @override
  List<Object> get props => [route];
}
