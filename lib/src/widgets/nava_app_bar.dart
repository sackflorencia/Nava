import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavaAppBar extends StatelessWidget implements PreferredSizeWidget {
  const NavaAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.primary,
      title: TextButton(
        child: Text(
          'Nava',
          style: TextStyle(
            fontFamily: 'Vaughan',
            fontSize: 40,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        onPressed: (){
          GoRouter.of(context).go('/home');
        },
      ),
      centerTitle: true,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
