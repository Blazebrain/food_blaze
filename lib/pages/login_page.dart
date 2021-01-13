import 'package:flutter/material.dart';
import 'package:food_blaze/pages/home_page.dart';
import 'package:food_blaze/pages/registration_page.dart';
import 'package:food_blaze/providers/auth.dart';

import 'package:food_blaze/widgets/custom_text.dart';
import 'package:food_blaze/widgets/loading.dart';
import 'package:food_blaze/widgets/login_form_widget.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final _key = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _key,
      backgroundColor: Colors.white,
      body: authProvider.status == Status.Authenticating
          ? Loading()
          : SingleChildScrollView(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'images/5.jpg',
                        width: 200,
                        height: 200,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: CustomText(
                      text: 'Welcome to BlazeMeals',
                      // color: Colors.red,
                      size: 22,
                    ),
                  ),
                  LoginFormsWidget(
                    controller: authProvider.emailController,
                    formType: 'Email',
                    formTypeIcon: Icons.email,
                  ),
                  LoginFormsWidget(
                    controller: authProvider.passwordController,
                    formType: 'Password',
                    formTypeIcon: Icons.lock,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: GestureDetector(
                      onTap: () async {
                        if (!await authProvider.signIn()) {
                          _key.currentState.showSnackBar(
                            SnackBar(
                              content: Text('Log in Failed'),
                            ),
                          );
                          return;
                        }
                        authProvider.cleanCOntrollers();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return HomePage();
                            },
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.red,
                            border: Border.all(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(16)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(
                                text: 'Login',
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return RegistrationPage();
                      }));
                    },
                    child: Padding(
                        padding: const EdgeInsets.only(top: 1),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(
                              text: 'Click here to register',
                              // color: Colors.white,
                              size: 18,
                            )
                          ],
                        )),
                  ),
                ],
              ),
            ),
    );
  }
}
