import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../widgets/appbar.dart';

class UserRegistration extends StatefulWidget {
  final Function handleAddUser;

  const UserRegistration({super.key, required this.handleAddUser});

  @override
  State<UserRegistration> createState() => _UserRegistrationState();
}

class _UserRegistrationState extends State<UserRegistration> {
  String name = '';
  String email = '';

  bool isEmailValid(String email) {
    const pattern = r'^[\w-]+(\.[\w-]+)*@([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,7}$';
    final regex = RegExp(pattern);
    return regex.hasMatch(email);
  }

  void addUser(String name, String email) {
    widget.handleAddUser(name, email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: customBG,
      appBar: const BuildAppBar(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 50, bottom: 20),
              child: const Text(
                'Nuevo Usuario',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  border: InputBorder.none,
                  hintText: 'Nombre',
                  hintStyle: TextStyle(color: customGrey),
                ),
                onChanged: (value) {
                  setState(() {
                    name = value;
                  });
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  border: InputBorder.none,
                  hintText: 'correo@ejemplo.com',
                  hintStyle: TextStyle(color: customGrey),
                ),
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: customBlue,
        onPressed: () {
          if (name.isNotEmpty & isEmailValid(email)) {
            addUser(name, email);
            Navigator.pop(context);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
