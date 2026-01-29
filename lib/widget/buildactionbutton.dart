import 'package:flutter/material.dart';

Widget buildActionButton({
  required IconData icon,
  required Color color,
  required VoidCallback onPressed,
}) {
  return Container(
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      boxShadow: [
        BoxShadow(
          color: color.withValues(alpha: 0.4),
          blurRadius: 15,
          offset: Offset(0, 8),
        ),
      ],
    ),
    child: Material(
      color: Colors.white,
      shape: CircleBorder(),
      child: InkWell(
        onTap: onPressed,
        customBorder: CircleBorder(),
        child: Container(
          padding: EdgeInsets.all(20),
          child: Icon(icon, size: 32, color: color),
        ),
      ),
    ),
  );
}
