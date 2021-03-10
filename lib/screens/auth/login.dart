import 'package:FoodCourtApp/services/auth/auth.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  final AuthService _authService = AuthService();

  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Login'),
      //   centerTitle: true,
      // ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 16,
              ),
              Center(
                child: Text(
                  "Login",
                  style: TextStyle(
                      color: Colors.deepOrange,
                      fontSize: 36,
                      fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 32,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Email",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                    borderSide: BorderSide(color: Colors.orange),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                    borderSide: BorderSide(color: Colors.orange),
                  ),
                ),
                controller: _authService.emailController,
              ),
              SizedBox(
                height: 16,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Password",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(color: Colors.orange),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                    borderSide: BorderSide(color: Colors.orange),
                  ),
                ),
                controller: _authService.passwordController,
              ),
              SizedBox(
                height: 32,
              ),
              Container(
                width: double.infinity,
                child: FlatButton(
                  child: Text("Login"),
                  textColor: Colors.white,
                  padding: EdgeInsets.all(16),
                  onPressed: () async {
                    await _authService.loginButton(context);
                  },
                  color: Colors.deepOrange,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
