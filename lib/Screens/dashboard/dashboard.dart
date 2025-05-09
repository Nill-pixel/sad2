import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sad2/Screens/dashboard/bloc/dashboard_bloc.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
        if (state is DashboardNavigateTo) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.pushNamed(context, state.route);
          });
        }
        return Scaffold(
          body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(255, 227, 234, 255),
                  Color.fromARGB(255, 145, 189, 255),
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 20),
                  const SizedBox(height: 30),
                  const Text(
                    'Módulos do Sistema',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      padding: const EdgeInsets.all(8),
                      children: [
                        _buildNavigationCard(
                          context,
                          'KPIs',
                          Icons.bar_chart,
                          '/kpi',
                        ),
                        _buildNavigationCard(
                          context,
                          'Avaliações',
                          Icons.assessment,
                          '/login',
                        ),
                        _buildNavigationCard(
                          context,
                          'Equipes',
                          Icons.people,
                          '/equipes',
                        ),
                        _buildNavigationCard(
                          context,
                          'Relatórios',
                          Icons.description,
                          '/relatorios',
                        ),
                        _buildNavigationCard(
                          context,
                          'Metas',
                          Icons.flag,
                          '/metas',
                        ),
                        _buildNavigationCard(
                          context,
                          'Configurações',
                          Icons.settings,
                          '/configuracoes',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildNavigationCard(
    BuildContext context,
    String title,
    IconData icon,
    String route,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48, color: const Color(0xFF2962FF)),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
