import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/auth/presentation/bloc/hiden_password_cubit.dart';
import 'package:movie_app/features/auth/presentation/bloc/login_bloc.dart';
import 'package:movie_app/features/auth/presentation/bloc/login_event.dart';
import 'package:movie_app/features/auth/presentation/bloc/login_state.dart';
import 'package:movie_app/shared/presentation/home_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginSucess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                      'Wellcome ${state.user.firstName} ${state.user.lastName}'),
                ),
              );
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ));
            } else if (state is LoginError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                ),
              );
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(),
                      label: Text('Username')),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: BlocBuilder<HidenPasswordCubit, bool>(
                  builder: (context, state) {
                    return TextField(
                      obscureText: state,
                      controller: _passwordControler,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.person),
                          suffixIcon: IconButton(
                              onPressed: () {
                                context
                                    .read<HidenPasswordCubit>()
                                    .toggleVisibility();
                              },
                              icon: Icon(state
                                  ? Icons.visibility_off
                                  : Icons.visibility)),
                          border: const OutlineInputBorder(),
                          label: const Text('Password')),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {
                      final String username = _usernameController.text;
                      final String password = _passwordControler.text;
                      context.read<LoginBloc>().add(LoginSubmitted(
                          username: username, password: password));
                    },
                    child: const Text('Login'),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
