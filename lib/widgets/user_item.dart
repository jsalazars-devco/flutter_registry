import 'package:flutter/material.dart';
import 'package:poc_registry/constants/colors.dart';

import '../models/user.dart';

class UserItem extends StatelessWidget {
  final User user;
  
  const UserItem({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        tileColor: Colors.white,
        leading: const Icon(
          Icons.account_box,
          color: customBlue,
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: 200,
              margin: const EdgeInsets.only(right: 8),
              child: Text(
                user.userName,
                style: const TextStyle(
                  fontSize: 16,
                  color: customBlack,
                ),
              ),
            ),
            Text(
              user.userEmail,
              style: const TextStyle(
                fontSize: 16,
                color: customBlack,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
