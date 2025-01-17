import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loginformapp/bloc/auth_bloc.dart';
import 'package:loginformapp/login_screen.dart';
import 'package:loginformapp/widgets/gradient_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthInitial) {
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LoginScreen()), (router)=>false);
            
          }
        },
        builder: (context, state) {
          if (state is AuthLoading){
            return CircularProgressIndicator();
          }
         
          return Column(
            children: [
              Center(
                child: Text((state as AuthSuccess) .uid),
              ),
              GradientButton(onPressed: () {
                context.read<AuthBloc>().add(AuthLogOutRequested());
              })
            ],
          );
        },
      ),
    );
  }
}
