import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../auth_data/data.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of(context);

  loginCubit({required String email, required String password}) async {
    emit(AutLoginLLoadingState());

    var data = await AuthData.loginData(email: email, password: password);

    emit(AuthLoginSuccessState(data: data));
  }

  registerCubit({
    required String email,
    required String password,
    required String name,
    required String phone,
    required String gender,
    required String nationalId,
  }) async {
    emit(AutLoginLLoadingState());
    var data =  await AuthData.registerData(
      email: email,
      password: password,
      name: name,
      phone: phone,
      gender: gender,
      nationalId: nationalId,
    );
    emit(AuthRegisterSuccessState(data: data));
  }
}
