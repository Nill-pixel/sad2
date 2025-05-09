import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginEmailChanged>((event, emit) {
      // Lógica para validar email, se necessário
    });
    on<LoginPasswordChanged>((event, emit) {
      // Lógica para validar senha, se necessário
    });
    on<LoginSubmitted>((event, emit) async {
      emit(LoginLoading());
      try {
        // Simular login (substitua pela sua lógica de autenticação)
        await Future.delayed(const Duration(seconds: 2));
        emit(LoginSuccess());
      } catch (e) {
        emit(LoginFailure(e.toString()));
      }
    });
  }
}
