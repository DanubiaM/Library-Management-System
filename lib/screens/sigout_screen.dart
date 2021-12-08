import 'package:flutter/material.dart';
import 'package:librarymanagement/models/db_user.dart';
import 'package:librarymanagement/screens/login_screen.dart';

class SigOutScreen extends StatelessWidget {
  const SigOutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.black87),
      child: Center(
        child: Container(
          height: 100,
          child: Column(
            children: [
              Text(
                "Thank You!",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: ElevatedButton(
                    onPressed: () {
                      UserDataBase.signOut();
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => LoginScreen()));
                    },
                    child: const Icon(Icons.logout)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
