import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:jobfinder/features/authentication/viewmodel/register_viewmodel.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RegisterViewModel(),
      child: Consumer<RegisterViewModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Register'),
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
                    onPressed: () => viewModel.register(context),
                    child: Text('Register'),
                  ),
                  SizedBox(height: 10),
                  if (viewModel.errorMessage.isNotEmpty)
                    Text(
                      viewModel.errorMessage,
                      style: TextStyle(color: Colors.red),
                    ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Already have an account? Login here'),
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