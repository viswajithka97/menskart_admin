import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menskart_admin/controller/authentication_controller/authentication_controller.dart';
import 'package:menskart_admin/view/core/color_constants.dart';
import 'package:menskart_admin/view/core/space_constants.dart';
import 'package:menskart_admin/view/login_page/widgets/login_leading_text.dart';
import 'package:menskart_admin/view/widgets/form_field.dart';
import 'package:menskart_admin/view/widgets/login_button.dart';

class LoginSection extends StatelessWidget {
  LoginSection({
    Key? key,
  }) : super(key: key);
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: size.height * 0.8,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            color: kLoginCustom),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            kHeight20,
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'Login',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            LoginButton(
                bgColor: kLoginColor,
                buttonText: 'Sign in with Mobile',
                onPressed: () {}),
            kHeight10,
            Row(
              children: const [
                Expanded(
                    child: Divider(
                  thickness: 2,
                )),
                kWidth10,
                Text(
                  'or Sign in with Email',
                  style: TextStyle(fontSize: 17),
                ),
                kWidth10,
                Expanded(
                    child: Divider(
                  thickness: 2,
                ))
              ],
            ),
            kHeight20,
            Form(
              key: _formKey,
              child: Column(
                children: [
                  const LoginLeadingText(leadingText: 'Email'),
                  LoginFormField(
                      formfieldtext: 'mail@website.com',
                      controller: emailController,
                      validator: (value) {
                        if (value.toString().isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      }),
                  kHeight20,
                  const LoginLeadingText(leadingText: 'Password'),
                  LoginFormField(
                    formfieldtext: 'Password',
                    controller: passwordController,
                    obscureText: true,
                    validator: (value) {
                      if (value.toString().isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
            kHeight10,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  Transform.scale(
                    scale: 1.7,
                    child: Checkbox(
                        activeColor: kLoginBlue,
                        checkColor: kWhite,
                        splashRadius: 30,
                        tristate: false,
                        value: true,
                        onChanged: (bool? value) {}),
                  ),
                  const Text(
                    'Remember Me.',
                    style: TextStyle(fontSize: 18),
                  ),
                  const Spacer(),
                  const Text(
                    'Forgot Password?',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: kLoginBlue),
                  )
                ],
              ),
            ),
            kHeight20,
            GetBuilder<AuthenticationController>(
              init: AuthenticationController(),
              builder: (controller) {
                return LoginButton(
                  buttonText: 'Sign In',
                  onPressed: () {
                    final FormState? form = _formKey.currentState;
                    if (form!.validate()) {
                      controller.login(emailController.text.trim(),
                          passwordController.text.trim());
                    } else {
                      Get.snackbar('Error', 'Please Enter Email and Password',
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.red,
                          colorText: Colors.white,
                          borderRadius: 10,
                          borderColor: Colors.red,
                          borderWidth: 2,
                          duration: const Duration(seconds: 3));
                    }
                  },
                  bgColor: kLoginBlue,
                  textColor: kWhite,
                );
              },
            ),
            kHeight20,
          ],
        ),
      ),
    );
  }
}
