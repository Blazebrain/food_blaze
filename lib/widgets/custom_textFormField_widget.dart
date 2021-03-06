import 'package:flutter/material.dart';

class LoginFormsWidget extends StatelessWidget {
  final String formType;
  final IconData formTypeIcon;
  final TextEditingController controller;
  const LoginFormsWidget({
    Key key,
    this.formType,
    this.formTypeIcon,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              icon: Icon(formTypeIcon),
              hintText: formType,
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}
