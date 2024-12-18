import 'package:flutter/material.dart';
import 'package:wecare/screens/admin_home_screen.dart';
import 'package:wecare/screens/nurse_home_screen.dart';
import 'package:wecare/screens/recover_password_screen.dart';
import 'package:wecare/screens/staff_home_screen.dart';
import 'package:wecare/widgets/button_widget.dart';
import 'package:wecare/widgets/text_widget.dart';
import 'package:wecare/widgets/textfield_widget.dart';
import 'package:wecare/widgets/toast_widget.dart';

class LoginScreen extends StatefulWidget {
  String type;
  LoginScreen({super.key, required this.type});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/images/Login(sa admin, nurse, staff).png',
                ),
                fit: BoxFit.cover),
          ),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                      ),
                    ),
                    TextWidget(
                      text: widget.type,
                      fontSize: 18,
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  child: const Icon(
                    Icons.account_circle,
                    size: 75,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextWidget(
                  text: widget.type,
                  fontSize: 18,
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: TextFieldWidget(
                    borderColor: Colors.black,
                    label: 'Enter Password',
                    controller: password,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ButtonWidget(
                  label: 'Submit',
                  onPressed: () {
                    if (widget.type == 'Admin') {
                      if (password.text == 'admin_password') {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const AdminHomeScreen()));
                      } else {
                        showToast('Invalid password!');
                      }
                    } else if (widget.type == 'Staff') {
                      if (password.text == 'staff_password') {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const StaffHomeScreen()));
                      } else {
                        showToast('Invalid password!');
                      }
                    } else {
                      if (password.text == 'nurse_password') {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const NurseHomeScreen()));
                      } else {
                        showToast('Invalid password!');
                      }
                    }
                  },
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => RecoverScreen(
                              type: widget.type,
                            )));
                  },
                  child: TextWidget(
                    text: 'Recover Password',
                    fontSize: 16,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
