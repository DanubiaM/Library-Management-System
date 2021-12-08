import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:librarymanagement/models/db_user.dart';
import 'package:librarymanagement/screens/management_screen.dart';
import 'package:librarymanagement/screens/new_account_screen.dart';
import 'package:librarymanagement/widgets/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _userIdController = TextEditingController();
  final TextEditingController _userPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: UserDataBase.initializerFirebase(),
        builder: (context, snapshot) {
          return Stack(
            children: [
              BackgroundImage(
                url: 'assets/images/loginScreenBackground.jpg',
                filter: ColorFilter.mode(Colors.black45, BlendMode.darken),
              ),
              Scaffold(
                backgroundColor: Colors.transparent,
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                          height: 300,
                          child: Center(
                              child: Text('Gama Library System ',
                                  style: TextStyle(
                                      fontSize: 35, color: Colors.white))),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/Libraries_icon.png'),
                                  scale: 2.5,
                                  alignment: Alignment.bottomCenter))),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        child: Column(
                          children: [
                            TextInput(
                              icon: Icons.input_rounded,
                              placeholder: 'ID',
                              textInputController: _userIdController,
                              inputType: TextInputType.emailAddress,
                            ),
                            TextInput(
                                icon: Icons.password,
                                placeholder: 'Password',
                                textInputController: _userPasswordController,
                                inputType: TextInputType.visiblePassword),
                            ElevatedButton(
                              child: const Text("Login"),
                              onPressed: () {
                                debugPrint(_userIdController.text);
                                debugPrint(_userPasswordController.text);

                                UserDataBase.signIn(
                                    userId: _userIdController.text,
                                    password: _userPasswordController.text,
                                    onSuccess: () {
                                      debugPrint("onSuccess");
                                      //O redirecionamento é condicionado ao typeUser
                                      //
                                      Navigator.of(context)
                                          .pushReplacement(MaterialPageRoute(
                                        builder: (context) =>
                                            ManagementScreen(),
                                      ));
                                    },
                                    onFail: () {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text('Login Failed.'),
                                        ),
                                      );
                                    });
                              },
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            ElevatedButton(
                              child: const Text("Crate New Account"),
                              onPressed: () {
                                Navigator.of(context)
                                    .pushReplacement(MaterialPageRoute(
                                  builder: (context) => NewAccount(),
                                ));
                                debugPrint(_userIdController.text);
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.transparent),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          );
        });
  }
}
