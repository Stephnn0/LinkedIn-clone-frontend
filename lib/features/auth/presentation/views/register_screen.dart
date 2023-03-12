import 'package:clean_arch_linkedin/features/auth/domain/usecases/register_user.dart';
import 'package:clean_arch_linkedin/features/auth/presentation/views/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final lastNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Register'),
            TextField(
              controller: nameController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(hintText: 'Enter your name'),
            ),
            const SizedBox(
              height: 5,
            ),
            TextField(
              controller: lastNameController,
              keyboardType: TextInputType.text,
              decoration:
                  const InputDecoration(hintText: 'Enter your last name'),
            ),
            const SizedBox(
              height: 5,
            ),
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(hintText: 'Enter your email'),
            ),
            const SizedBox(
              height: 5,
            ),
            TextField(
              obscureText: true,
              controller: passwordController,
              decoration:
                  const InputDecoration(hintText: 'Enter your password'),
            ),
            const SizedBox(
              height: 5,
            ),
            ElevatedButton(
                onPressed: () {
                  context.read<AuthBloc>().add(Register(
                      name: nameController.text,
                      lastName: lastNameController.text,
                      email: emailController.text,
                      password: passwordController.text));
                },
                child: const Text('Register')),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop(
                    MaterialPageRoute(
                      builder: (context) => const WelcomeScreen(),
                    ),
                  );
                },
                child: Text('Login here'))
          ],
        ),
      ),
    );
  }
}
