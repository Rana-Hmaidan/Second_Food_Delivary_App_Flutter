import 'package:flutter/material.dart';

class ProfileListTile extends StatelessWidget {
  const ProfileListTile({super.key, required this.leadingIcon, required this.title, required this.onTapItem});

  final IconData leadingIcon;
  final String title;
  final VoidCallback onTapItem;

  @override
  Widget build(BuildContext context) {
   return ListTile(
          onTap: onTapItem, 
          leading:  Icon(
            leadingIcon, 
            size: 30,
          ),
          title: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios, 
            size: 18,
          ),
        );
  }
}