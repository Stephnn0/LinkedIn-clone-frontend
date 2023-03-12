import 'package:clean_arch_linkedin/features/auth/presentation/views/login_screen.dart';
import 'package:clean_arch_linkedin/features/auth/presentation/views/register_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Expanded(
              flex: 1,
              child: SizedBox(
                child: Text(''),
              )),
          Expanded(
              flex: 2,
              child: SizedBox(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Image.asset(
                        'assets/images/logo.svg.png',
                        width: 200,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text('Join a trusted community of 800M'),
                      const Text('professionals'),
                    ],
                  ),
                ],
              ))),
          const Expanded(
              flex: 1,
              child: SizedBox(
                child: Text(''),
              )),
          Expanded(
              flex: 2,
              child: SizedBox(
                  child: Column(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const RegisterScreen(),
                          ),
                        );
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 150),
                        child: Text('Join now'),
                      )),
                  ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.android),
                      label: const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 8.0, horizontal: 94),
                        child: Text('Continue with Google'),
                      )),
                  ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 26, 98, 156)),
                      onPressed: () {},
                      icon: const Icon(Icons.facebook_outlined),
                      label: const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 8.0, horizontal: 86),
                        child: Text('Continue with Facebook'),
                      )),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        'Sign in',
                        style: TextStyle(fontSize: 25),
                      ))
                ],
              ))),
        ],
      ),
    );
  }
}
