import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SizedBox(
        child: ListView(
          children: [
            DrawerHeader(
              margin: EdgeInsets.all(0),
              child: IconButton(
                onPressed: () {
                  GoRouter.of(context).go('/home', extra: '');
                },
                icon: Icon(
                  Icons.home,
                  size: 35,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Row(
                children: [
                  Icon(
                    Icons.settings,
                    size: 30,
                    color: Theme.of(context).colorScheme.onInverseSurface,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Configuración",
                    style: TextStyle(
                      fontSize: 23,
                      color: Theme.of(context).colorScheme.onInverseSurface,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
