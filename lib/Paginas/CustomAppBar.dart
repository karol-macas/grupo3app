import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final IconData trailingIcon;
  final VoidCallback? onTrailingPressed;

  const CustomAppBar({
    super.key,
    required this.title,
    this.trailingIcon = Icons.settings,
    this.onTrailingPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          fontFamily: 'OleoScript',
        ),
      ),
      centerTitle: true,
      backgroundColor: Color.fromARGB(255, 232, 64, 87),
      leading: const BackButton(
        color: Colors.white,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
