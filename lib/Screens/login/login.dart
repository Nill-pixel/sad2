import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sad2/Screens/login/bloc/login_bloc.dart';
import 'package:sad2/widgets/logo_painter.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2962FF),
      body: SafeArea(
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            if (state is LoginLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is LoginSuccess) {
              return const Center(
                child: Text(
                  'Login bem-sucedido!',
                  style: TextStyle(color: Colors.white),
                ),
              );
            } else if (state is LoginFailure) {
              return Center(
                child: Text(
                  state.error,
                  style: const TextStyle(color: Colors.red),
                ),
              );
            }
            return _buildLoginForm(context);
          },
        ),
      ),
    );
  }

  Widget _buildLoginForm(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Column(
            children: [
              const SizedBox(height: 68.0),
              Container(
                width: 136.0,
                height: 136.0,
                padding: const EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Center(child: _buildLogo()),
              ),
              const SizedBox(height: 17.0),
              const Text(
                "Performance\nReview",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 34.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 38.0),
              _buildEmailField(context, emailController),
              const SizedBox(height: 24.0),
              _buildPasswordField(context, passwordController),
              const SizedBox(height: 24.0),
              _buildLoginButton(
                context,
                formKey,
                emailController,
                passwordController,
              ),
              const SizedBox(height: 16.0),
              GestureDetector(
                onTap: () {
                  // Password recovery action
                },
                child: const Text(
                  "Esqueceu palavra passe?",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 100.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Não tem uma conta? ",
                    style: TextStyle(fontSize: 18.0, color: Color(0xFFE0E0E0)),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Registration action
                    },
                    child: const Text(
                      "Cadastre-se",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 27.0),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return CustomPaint(size: const Size(128.0, 128.0), painter: LogoPainter());
  }

  Widget _buildEmailField(
    BuildContext context,
    TextEditingController controller,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
          hintText: "Email",
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: 12.0,
            horizontal: 12.0,
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty || !value.contains('@')) {
            return "Por favor, digite um email válido";
          }
          return null;
        },
        onChanged: (value) {
          context.read<LoginBloc>().add(LoginEmailChanged(value));
        },
      ),
    );
  }

  Widget _buildPasswordField(
    BuildContext context,
    TextEditingController controller,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      child: TextFormField(
        controller: controller,
        obscureText: true,
        decoration: const InputDecoration(
          hintText: "Palavra-passe",
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: 12.0,
            horizontal: 12.0,
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Por favor, digite sua senha";
          }
          return null;
        },
        onChanged: (value) {
          context.read<LoginBloc>().add(LoginPasswordChanged(value));
        },
      ),
    );
  }

  Widget _buildLoginButton(
    BuildContext context,
    GlobalKey<FormState> formKey,
    TextEditingController emailController,
    TextEditingController passwordController,
  ) {
    return SizedBox(
      width: double.infinity,
      height: 60.0,
      child: ElevatedButton(
        onPressed: () {
          if (formKey.currentState!.validate()) {
            context.read<LoginBloc>().add(LoginSubmitted());
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: const Color(0xFF2962FF),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
        child: const Text(
          "Iniciar Sessão",
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
