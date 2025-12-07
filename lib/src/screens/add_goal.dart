import 'package:flutter/material.dart';
import 'package:nava/src/widgets/navbar.dart';
import 'package:nava/src/widgets/nava_app_bar.dart';

class AddGoal extends StatelessWidget{
  const AddGoal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavaAppBar(),
      drawer: Navbar(),
      body: const Center(
        child: Text('Add Goal Screen'),
      ),
    );
  }
}