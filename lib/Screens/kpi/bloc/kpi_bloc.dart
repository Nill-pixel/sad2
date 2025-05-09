import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:sad2/Screens/kpi/models/kpi_model.dart';

part 'kpi_event.dart';
part 'kpi_state.dart';

class KpiBloc extends Bloc<KpiEvent, KpiState> {
  KpiBloc() : super(KpiInitial()) {
    on<LoadKpiData>((event, emit) async {
      emit(KpiLoading());
      try {
        // Simular carregamento de dados (substitua pela sua lógica de API)
        await Future.delayed(const Duration(seconds: 1));

        // Dados de comparação de departamentos (valores de 0-100)
        final departmentData = [
          65.0,
          75.0,
          90.0,
          25.0,
        ]; // RH, Vendas, TI, Suporte

        // Dados de evolução ao longo do tempo
        final timeEvolutionData = [
          FlSpot(0, 40), // Jan
          FlSpot(1, 52), // Fev
          FlSpot(2, 63), // Mar
          FlSpot(3, 70), // Abr
          FlSpot(4, 80), // Mai
          FlSpot(5, 87), // Jun
          FlSpot(6, 85), // Jul
          FlSpot(7, 75), // Ago
          FlSpot(8, 68), // Set
          FlSpot(9, 78), // Out
          FlSpot(10, 90), // Nov
          FlSpot(11, 95), // Dez
        ];

        // Pontos fortes e fracos
        final strengths = ['Ponto forte', 'Ponto forte'];

        final weaknesses = ['Ponto fraco', 'Ponto fraco'];

        final model = KpiModel(
          departmentData: departmentData,
          timeEvolutionData: timeEvolutionData,
          strengths: strengths,
          weaknesses: weaknesses,
        );

        emit(
          KpiLoaded(
            departmentData: model.departmentData,
            timeEvolutionData: model.timeEvolutionData,
            strengths: model.strengths,
            weaknesses: model.weaknesses,
          ),
        );
      } catch (e) {
        emit(KpiFailure(e.toString()));
      }
    });

    on<GenerateKpiReport>((event, emit) async {
      // Mantenha o estado atual para não perder os dados já carregados
      final currentState = state;
      if (currentState is KpiLoaded) {
        emit(
          KpiGeneratingReport(
            departmentData: currentState.departmentData,
            timeEvolutionData: currentState.timeEvolutionData,
            strengths: currentState.strengths,
            weaknesses: currentState.weaknesses,
          ),
        );

        try {
          // Simular geração de relatório
          await Future.delayed(const Duration(seconds: 2));

          // Retornar ao estado carregado com uma flag indicando que o relatório foi gerado
          emit(
            KpiReportGenerated(
              departmentData: currentState.departmentData,
              timeEvolutionData: currentState.timeEvolutionData,
              strengths: currentState.strengths,
              weaknesses: currentState.weaknesses,
            ),
          );
        } catch (e) {
          emit(KpiFailure(e.toString()));
        }
      }
    });
  }
}
