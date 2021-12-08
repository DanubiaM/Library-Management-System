import 'package:flutter/material.dart';
import 'package:librarymanagement/models/db_user.dart';
import 'package:librarymanagement/screens/login_screen.dart';
import 'package:librarymanagement/widgets/widgets.dart';
import 'package:dropdown_search/dropdown_search.dart';

class NewAccount extends StatefulWidget {
  NewAccount({Key? key}) : super(key: key);

  @override
  _NewAccountState createState() => _NewAccountState();
}

class _NewAccountState extends State<NewAccount> {
  final TextEditingController _userIdController = TextEditingController();
  final TextEditingController _userPasswordController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();

  String dropdownValue = 'Administrator';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(218, 201, 232, 1),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              height: 200,
              child: Center(
                child: Text(
                  'Creat New Account',
                  style: TextStyle(fontSize: 30, color: Colors.black),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              child: Column(children: [
                TextInput(
                  icon: Icons.account_circle_outlined,
                  placeholder: 'User name',
                  textInputController: _userNameController,
                  inputType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: 5,
                ),
                TextInput(
                  icon: Icons.alternate_email_sharp,
                  placeholder: 'User ID',
                  textInputController: _userIdController,
                  inputType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: 5,
                ),
                TextInput(
                  icon: Icons.password_outlined,
                  placeholder: 'User password',
                  textInputController: _userPasswordController,
                  inputType: TextInputType.visiblePassword,
                ),
                SizedBox(
                  height: 5,
                ),
                DropdownButton<String>(
                  value: dropdownValue,
                  icon: const Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                  items: <String>['Administrator', 'Normal User']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 5,
                ),
                ElevatedButton(
                  child: const Text("Create New Account"),
                  onPressed: () {
                    UserDataBase.signUp(
                        userId: _userIdController.text,
                        password: _userPasswordController.text,
                        userName: _userNameController.text,
                        userType: dropdownValue,
                        onSuccess: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Account created successfull'),
                            ),
                          );
                        },
                        onFail: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Account created unsuccessfull'),
                            ),
                          );
                        });
                    debugPrint(_userIdController.text);
                    debugPrint(_userPasswordController.text);
                    debugPrint(_userNameController.text);
                    debugPrint(dropdownValue);
                  },
                ),
                SizedBox(
                  height: 5,
                ),
                ElevatedButton(
                  child: const Text(
                    "Return",
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ));
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red),
                  ),
                ),
              ]),
            ),
          ],
        )));
  }
}
