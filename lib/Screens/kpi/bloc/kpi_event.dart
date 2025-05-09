part of 'kpi_bloc.dart';

abstract class KpiEvent extends Equatable {
  const KpiEvent();

  @override
  List<Object?> get props => [];
}

class LoadKpiData extends KpiEvent {}

class GenerateKpiReport extends KpiEvent {}
