import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginRequested>(_authRequested);
   on<AuthLogOutRequested>(_unAuthRequested) ;
  }
  @override
  void onTransition(Transition<AuthEvent, AuthState> transition) {
    print('authBloc -transition-$transition');
    super.onTransition(transition);
  }
  @override
  void onChange(Change<AuthState> change) {
    print('authBloc -Change-$change');
    super.onChange(change);
  }
  

  FutureOr<void> _unAuthRequested(event, emit)async{
   emit(AuthLoading());
  try {
    await Future.delayed(Duration(seconds: 1), () {
         return emit(AuthInitial());
       });
  } catch (e) {
    emit(AuthFailure(e.toString()));
  }
    }

  FutureOr<void> _authRequested(event, emit) async {
    emit(AuthLoading());
    try {
      final email = event.email;
      final password = event.password;
  //email validation using regex
      if (password.length < 6) {
        return emit(AuthFailure('password can not be less the 6 characters'));
      }
      await Future.delayed(Duration(seconds: 1), () {
        return emit(AuthSuccess(uid: '$email-$password'));
      });
    } catch (e) {
      return emit(AuthFailure(e.toString()));
    }
  }

}
