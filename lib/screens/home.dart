import 'package:flutter/material.dart';
import 'package:poc_registry/constants/colors.dart';
import 'package:poc_registry/screens/user_registration.dart';
import 'package:poc_registry/widgets/user_item.dart';

import '../models/user.dart';
import '../widgets/appbar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // final userList = User.userList();
  final List<User> userList = [];

  void handleAddUser(String name, String email) {
    setState(() {
      userList.add(User(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          userName: name,
          userEmail: email));
    });
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
            searchBox(),
            Expanded(
              child: ListView(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 50, bottom: 20),
                    child: const Text(
                      'Usuarios Registrados',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  for (User user in userList) UserItem(user: user),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: customBlue,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  UserRegistration(handleAddUser: handleAddUser),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget searchBox() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10),
          prefixIcon: Icon(
            Icons.search,
            color: customBlack,
            size: 20,
          ),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 20,
            minWidth: 25,
          ),
          border: InputBorder.none,
          hintText: 'Search',
          hintStyle: TextStyle(color: customGrey),
        ),
      ),
    );
  }
}
