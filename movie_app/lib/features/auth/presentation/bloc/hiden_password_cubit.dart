import 'package:flutter_bloc/flutter_bloc.dart';

class HidenPasswordCubit extends Cubit<bool> {
  HidenPasswordCubit() : super(true);

  void toggleVisibility() {
    emit(!state);
  }
  
}