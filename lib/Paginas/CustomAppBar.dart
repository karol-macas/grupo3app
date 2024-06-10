import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final IconData trailingIcon;
  final VoidCallback? onTrailingPressed;

  CustomAppBar({
    required this.title,
    this.trailingIcon = Icons.settings,
    this.onTrailingPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
          fontFamily: 'Roboto', // Cambia esto a la fuente que prefieras y tengas disponible
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.blueGrey,
      leading: BackButton(
        color: Colors.white,
      ),
      actions: [
        IconButton(
          icon: Icon(trailingIcon, color: Colors.white),
          onPressed: onTrailingPressed ?? () {},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
