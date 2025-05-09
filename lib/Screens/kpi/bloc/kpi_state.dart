part of 'kpi_bloc.dart';

abstract class KpiState extends Equatable {
  const KpiState();

  @override
  List<Object?> get props => [];
}

class KpiInitial extends KpiState {}

class KpiLoading extends KpiState {}

class KpiLoaded extends KpiState {
  final List<double> departmentData;
  final List<FlSpot> timeEvolutionData;
  final List<String> strengths;
  final List<String> weaknesses;

  const KpiLoaded({
    required this.departmentData,
    required this.timeEvolutionData,
    required this.strengths,
    required this.weaknesses,
  });

  @override
  List<Object?> get props => [
    departmentData,
    timeEvolutionData,
    strengths,
    weaknesses,
  ];
}

class KpiGeneratingReport extends KpiLoaded {
  const KpiGeneratingReport({
    required super.departmentData,
    required super.timeEvolutionData,
    required super.strengths,
    required super.weaknesses,
  });
}

class KpiReportGenerated extends KpiLoaded {
  const KpiReportGenerated({
    required super.departmentData,
    required super.timeEvolutionData,
    required super.strengths,
    required super.weaknesses,
  });
}

class KpiFailure extends KpiState {
  final String error;

  const KpiFailure(this.error);

  @override
  List<Object?> get props => [error];
}
