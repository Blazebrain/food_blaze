import 'package:flutter/material.dart';

import '../widgets/custom_text.dart';
import '../widgets/login_form_widget.dart';
import 'login_page.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
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
              formType: 'Username',
              formTypeIcon: Icons.person,
            ),
            LoginFormsWidget(
              formType: 'Email',
              formTypeIcon: Icons.email,
            ),
            LoginFormsWidget(
              formType: 'Password',
              formTypeIcon: Icons.lock,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
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
                        text: 'Register',
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return LoginPage();
                }));
              },
              child: Padding(
                  padding: const EdgeInsets.only(top: 1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: 'Login here',
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
