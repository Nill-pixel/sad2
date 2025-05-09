import 'package:equatable/equatable.dart';
import 'package:fl_chart/fl_chart.dart';

class KpiModel extends Equatable {
  final List<double> departmentData;
  final List<FlSpot> timeEvolutionData;
  final List<String> strengths;
  final List<String> weaknesses;

  const KpiModel({
    required this.departmentData,
    required this.timeEvolutionData,
    required this.strengths,
    required this.weaknesses,
  });

  KpiModel copyWith({
    List<double>? departmentData,
    List<FlSpot>? timeEvolutionData,
    List<String>? strengths,
    List<String>? weaknesses,
  }) {
    return KpiModel(
      departmentData: departmentData ?? this.departmentData,
      timeEvolutionData: timeEvolutionData ?? this.timeEvolutionData,
      strengths: strengths ?? this.strengths,
      weaknesses: weaknesses ?? this.weaknesses,
    );
  }

  @override
  List<Object?> get props => [
    departmentData,
    timeEvolutionData,
    strengths,
    weaknesses,
  ];
}
