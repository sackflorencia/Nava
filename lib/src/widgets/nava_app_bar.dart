import 'package:flutter/material.dart';

class NavaAppBar extends StatelessWidget implements PreferredSizeWidget{
  const NavaAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.primary,
      title: Text('Nava', style: TextStyle(fontFamily: 'Vaughan', fontSize: 40, fontWeight: FontWeight.w500, color: Colors.white)),
      centerTitle: true,
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.white),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.person), //TODO: linkear el onpressed a la view de profile
        ),
      ],
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}