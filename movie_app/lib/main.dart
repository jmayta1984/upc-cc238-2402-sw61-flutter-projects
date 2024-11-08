import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/auth/presentation/blocs/login_bloc.dart';
import 'package:movie_app/features/auth/presentation/pages/login_page.dart';
import 'package:movie_app/features/movies/presentation/blocs/movie_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginBloc()),
        BlocProvider(create: (context) => MovieBloc()),
      ],
      child: MaterialApp(
        home: LoginPage(),
        debugShowCheckedModeBanner: false,
        darkTheme: ThemeData.dark(),
        theme: ThemeData.light(),
      ),
    );
  }
}
