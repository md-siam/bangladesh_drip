import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../firebase/signin_page.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      color: Colors.transparent,
      child: Row(
        children: [
          const SizedBox(width: 10),
          Image.asset(
            'assets/images/logo-trans_black.png',
            height: 50,
          ),
          const Expanded(child: SizedBox()),
          IconButton(
            icon: const Icon(Icons.person, color: Colors.grey),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.add_shopping_cart, color: Colors.grey),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.search, color: Colors.grey),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.login, color: Colors.grey),
            onPressed: () {
              Navigator.push(
                context,
                CupertinoPageRoute(builder: (context) => const SignInPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
