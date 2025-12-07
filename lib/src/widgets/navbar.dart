import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: ListView(
          children: [
            DrawerHeader(
              margin: EdgeInsets.all(0),
              child: IconButton(onPressed: (){GoRouter.of(context).go('/home', extra: '');}, icon: Icon(Icons.home, size: 35, color: Theme.of(context).colorScheme.primary)),
            ),
          ],
        ),
      ),
    );
  }
}
