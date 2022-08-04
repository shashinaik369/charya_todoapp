import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:todoapp_assignment/constants.dart';
import '../widgets/text_input_field.dart';
import 'login_screen.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Create your\naccount",
                style: TextStyle(
                  color: Color(0xfff8f7ff),
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: 321,
                height: 65,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32.50),
                  color: const Color(0xfff8f7ff),
                ),
                child: Center(
                  child: TextInputField(
                    controller: _usernameController,
                    hintText: 'Username',
                    icon: Iconsax.user,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: 321,
                height: 65,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32.50),
                  color: const Color(0xfff8f7ff),
                ),
                child: Center(
                  child: TextInputField(
                    controller: _emailController,
                    hintText: 'Email',
                    icon: Iconsax.game,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: 321,
                height: 65,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32.50),
                  color: const Color(0xfff8f7ff),
                ),
                child: Center(
                  child: TextInputField(
                    controller: _passwordController,
                    hintText: 'Password',
                    icon: Iconsax.lock,
                    isObscure: true,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: 321,
                height: 76,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(39),
                  color: const Color(0xff1adda8),
                ),
                child: InkWell(
                  onTap: () => authController.registerUser(
                    _usernameController.text,
                    _emailController.text,
                    _passwordController.text,
                  ),
                  child: const Center(
                    child: Text(
                      'Register',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account? ',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  InkWell(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                    ),
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 20,
                        color: buttonColor,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
