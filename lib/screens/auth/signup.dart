import 'package:FoodCourtApp/services/auth/auth.dart';
import 'package:flutter/material.dart';

class Registration extends StatelessWidget {
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  "Registration",
                  style: TextStyle(
                      color: Colors.lightBlue,
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
                    borderSide: BorderSide(color: Colors.black),
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
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
                controller: _authService.passwordController,
              ),
              SizedBox(
                height: 16,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Name",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
                controller: _authService.nameController,
              ),
              SizedBox(
                height: 16,
              ),
              // TextFormField(
              //   decoration: InputDecoration(
              //       labelText: "Image URL",
              //       enabledBorder: OutlineInputBorder(
              //           borderRadius: BorderRadius.all(Radius.circular(8)),
              //           borderSide: BorderSide(color: Colors.black))),
              //   controller: _authService.imageController,
              // ),
              SizedBox(
                height: 32,
              ),
              Container(
                width: double.infinity,
                child: FlatButton(
                  child: Text("Register"),
                  textColor: Colors.white,
                  padding: EdgeInsets.all(16),
                  onPressed: () async {
                    await _authService.registerButton(context);
                  },
                  color: Colors.blue,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
