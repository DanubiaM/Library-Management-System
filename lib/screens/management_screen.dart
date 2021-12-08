import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:librarymanagement/models/db_user.dart';
import 'package:librarymanagement/screens/list_books_screen.dart';
import 'package:librarymanagement/screens/login_screen.dart';
import 'package:librarymanagement/screens/sigout_screen.dart';

import 'add_book_screen.dart';

class ManagementScreen extends StatefulWidget {
  ManagementScreen({Key? key}) : super(key: key);

  @override
  _ManagementScreenState createState() => _ManagementScreenState();
}

class _ManagementScreenState extends State<ManagementScreen> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    ListBookScreen(),
    AddBookScreen(),
    //Logout and return page for login
    SigOutScreen()
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Library Management System"),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'List Books',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark_add),
              label: 'Add New Book',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.logout_sharp),
              label: 'LogOut',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.purple,
          onTap: _onItemTapped),
    );
  }
}
