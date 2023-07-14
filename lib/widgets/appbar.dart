import 'package:flutter/material.dart';

import '../constants/colors.dart';

class BuildAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BuildAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final isHomePage = ModalRoute.of(context)?.isFirst ?? true;

    return AppBar(
      backgroundColor: customBG,
      elevation: 0,
      leading: !isHomePage ? IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: customBlack, 
        ),
        onPressed: () {
          Navigator.pop(context); 
        },
      )
      :
      null,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(
            Icons.menu,
            color: customBlack,
            size: 30,
          ),
          SizedBox(
            height: 40,
            width: 40,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset('images/nita.jpeg'),
            ),
          ),
        ],
      ),
    );
  }
}
