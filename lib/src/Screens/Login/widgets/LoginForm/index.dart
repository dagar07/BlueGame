import 'package:BlueGame/src/Screens/Login/bloc/login_bloc.dart';
import 'package:BlueGame/src/Screens/Login/bloc/login_event.dart';
import 'package:BlueGame/src/Screens/Login/bloc/login_state.dart';
import 'package:BlueGame/src/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _usernameCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isFormNotValid = false;
  LoginBloc loginBloc;

  @override
  void initState() {
    loginBloc = BlocProvider.of<LoginBloc>(context);
    super.initState();
  }

  Widget showSnakBar(text) {
    return SnackBar(
      content: Text(text),
      backgroundColor: Colors.red[400],
    );
  }

  void handleFormSubmit() {
    // Validate returns true if the form is valid, or false
    // otherwise.
    if (_formKey.currentState.validate()) {
      // If the form is valid, display a Snackbar.
      final username = _usernameCtrl.text;
      final password = _passwordCtrl.text;
      loginBloc.add(
        LoginButtonPressed(
          username: username,
          password: password,
        ),
      );
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text('Processing Login Submit'),
        ),
      );

      return;
    }

    setState(() {
      isFormNotValid = true;
    });
  }

  void handleTheFormValidationState(String value) {
    setState(() {
      isFormNotValid = value?.isEmpty;
    });
  }

  Widget _renderUserTextField() {
    return TextFormField(
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter username!';
        }

        if ((value.length < 3) || (value.length > 10)) {
          return 'Please enter a valid username!';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: 'Username',
        labelStyle: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
      cursorColor: Colors.white,
      onChanged: handleTheFormValidationState,
      controller: _usernameCtrl,
      style: TextStyle(
        color: Colors.white,
      ),
    );
  }

  Widget _renderPasswordField() {
    return TextFormField(
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter user password!';
        }

        if ((value.length < 3) || (value.length > 12)) {
          return 'Please enter a valid password!';
        }
        return null;
      },
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password',
        labelStyle: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
      cursorColor: Colors.white,
      controller: _passwordCtrl,
      style: TextStyle(
        color: Colors.white,
      ),
      onChanged: handleTheFormValidationState,
    );
  }

  Widget _renderButton() {
    return Container(
      width: 250.0,
      child: RaisedButton(
        onPressed: isFormNotValid ? null : handleFormSubmit,
        disabledColor: Colors.grey[350],
        color: Colors.yellow[800],
        textColor: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.grey[300],
          ),
          borderRadius: BorderRadius.circular(24.0),
        ),
        padding: EdgeInsets.all(16.0),
        child: Text(
          'SUBMIT',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          Scaffold.of(context).showSnackBar(showSnakBar('Login Failed'));
        } else if (state is LoginButtonPressed) {
          // move the user to home page
        }
      },
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _renderUserTextField(),
              _renderPasswordField(),
              SizedBox(
                height: 20.0,
              ),
              _renderButton(),
            ],
          ),
        ),
      ),
    );
  }
}
