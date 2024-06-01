import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:jobfinder/features/authentication/viewmodel/login_viewmodel.dart';
import 'register_screen.dart';  // Make sure to import the register screen for navigation

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginViewModel(),
      child: Consumer<LoginViewModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Login'),
            ),
            body: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    controller: viewModel.emailController,
                    decoration: InputDecoration(labelText: 'Email'),
                  ),
                  TextField(
                    controller: viewModel.passwordController,
                    decoration: InputDecoration(labelText: 'Password'),
                    obscureText: true,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => viewModel.login(context),
                    child: Text('Login'),
                  ),
                  SizedBox(height: 10),
                  if (viewModel.errorMessage.isNotEmpty)
                    Text(
                      viewModel.errorMessage,
                      style: TextStyle(color: Colors.red),
                    ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterScreen()),
                      );
                    },
                    child: Text('Don\'t have an account? Register here'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}