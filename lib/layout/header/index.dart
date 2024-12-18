import 'package:flutter/material.dart';

class MyHeader extends StatefulWidget implements PreferredSizeWidget {
  const MyHeader({super.key});

  @override
  State<MyHeader> createState() => _MyHeaderState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _MyHeaderState extends State<MyHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: const Text('Header'),
    );
  }
}
