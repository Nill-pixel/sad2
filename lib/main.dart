import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sad2/Screens/dashboard/bloc/dashboard_bloc.dart';
import 'package:sad2/Screens/dashboard/dashboard.dart';
import 'package:sad2/Screens/kpi/bloc/kpi_bloc.dart';
import 'package:sad2/Screens/kpi/kpi.dart';
import 'package:sad2/Screens/login/bloc/login_bloc.dart';
import 'package:sad2/Screens/login/login.dart';
import 'package:sad2/Screens/splashScreen/splash_screen.dart';
import 'package:sad2/Screens/team/bloc/team_bloc.dart';
import 'package:sad2/Screens/team/team.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(create: (context) => LoginBloc()),
        BlocProvider<KpiBloc>(create: (context) => KpiBloc()),
        BlocProvider<DashboardBloc>(create: (context) => DashboardBloc()),
        BlocProvider<TeamBloc>(create: (context) => TeamBloc()),
      ],
      child: MaterialApp(
        title: 'Performance Review',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: const Color(0xFF2962FF),
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF2962FF),
            primary: const Color(0xFF2962FF),
          ),
          useMaterial3: true,
          fontFamily: 'Poppins',
        ),
        initialRoute: '/splash',
        routes: {
          '/splash': (context) => const SplashScreen(),
          '/': (context) => const DashboardScreen(),
          '/login': (context) => const LoginScreen(),
          '/kpi': (context) => const KPIScreen(),
          '/avaliacoes':
              (context) => const Placeholder(color: Color(0xFF2962FF)),
          '/equipes': (context) => const TeamScreen(),
          '/relatorios':
              (context) => const Placeholder(color: Color(0xFF2962FF)),
          '/metas': (context) => const Placeholder(color: Color(0xFF2962FF)),
          '/configuracoes':
              (context) => const Placeholder(color: Color(0xFF2962FF)),
        },
      ),
    );
  }
}
