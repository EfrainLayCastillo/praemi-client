import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praemiclient/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:praemiclient/bloc/login_bloc/login_bloc.dart';
import 'package:praemiclient/utils/theme/PraemiTheme.dart';

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.status.isSubmissionFailure) {
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text('Authentication Failure')),
            );
        }
        if (state.status.isSubmissionSuccess) {
          BlocProvider.of<AuthenticationBloc>(context)..add(LoggedIn());
        }
      },
      child: Align(
        alignment: const Alignment(0, -1 / 3),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 50,),
            _image(size.width * 0.5),
            const SizedBox(height: 50,),
            _UsernameInput(),
            const SizedBox(height: 20,),
            _PasswordInput(),
            const SizedBox(height: 40,),
            Container(
              width: size.width * 0.90, 
              height: 58,
              child: _LoginButton()
            ),
          ],
        ),
      ),
    );
  }

  Widget _image(double widthSvg) {
    Widget logoSvg = Image.asset('assets/logoPraemi.png', width: widthSvg);
    return Container(child: logoSvg);
  }
}

class _UsernameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.username != current.username,
      builder: (context, state) {
        return TextField(
          key: const Key('loginForm_usernameInput_textField'),
          onChanged: (username) => context.read<LoginBloc>().add(LoginUsernameChanged(username)),
          decoration: InputDecoration(
            labelText: 'username',
            border: const OutlineInputBorder(),
            hintText: 'username',
            prefixIcon: Icon(Icons.account_circle, color: PraemiTheme.colorPrimary),
            errorText: state.username.invalid ? 'invalid username' : null,
          ),
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextField(
          key: const Key('loginForm_passwordInput_textField'),
          onChanged: (password) => context.read<LoginBloc>().add(LoginPasswordChanged(password)),
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'password',
            border: const OutlineInputBorder(),
            hintText: 'password',
            prefixIcon: Icon(Icons.lock, color: PraemiTheme.colorPrimary),
            errorText: state.password.invalid ? 'invalid password' : null,
          ),
        );
      },
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return  RaisedButton(
          key: const Key('loginForm_continue_raisedButton'),
          child: state.status.isSubmissionInProgress ? isLoadingButton(context) :
            Text( 'Iniciar sesión'.toUpperCase(), 
              style: TextStyle(color: Colors.white, letterSpacing: 0.9, fontSize: 14)
            ),
          color: PraemiTheme.colorPrimary,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          disabledColor: PraemiTheme.colorPrimary.withOpacity(0.5),
          shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(10.0)),
          autofocus: true,
          onPressed: state.status.isValidated
              ? () => context.read<LoginBloc>().add(const LoginSubmitted()) : null,
        );
      },
    );
  }

  Widget isLoadingButton(BuildContext context) {
    
    return Platform.isIOS ? CupertinoActivityIndicator() : Container(
      height: 22, width: 22,
      child: CircularProgressIndicator(
        backgroundColor: Colors.white, 
        valueColor: AlwaysStoppedAnimation<Color> (Color(0xff00f594)), 
        strokeWidth: 2 
      ),
    );
  }

}
