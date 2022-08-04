import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:todoapp_assignment/views/authentication/registration_screen.dart';
import '../../constants.dart';
import '../widgets/text_input_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Login",
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Color(0xfff8f7ff),
                fontSize: 32,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 25,
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
                  icon: Iconsax.user,
                ),
              ),
            ),
            const SizedBox(
              height: 25,
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
                onTap: () => authController.loginUser(
                  _emailController.text,
                  _passwordController.text,
                ),
                child: const Center(
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Don\'t have an account? ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                InkWell(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => SignupScreen(),
                    ),
                  ),
                  child: Text(
                    'Register',
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
    );
  }
}
