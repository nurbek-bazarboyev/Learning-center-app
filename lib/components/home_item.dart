import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeItem extends StatelessWidget {
  final void Function()? onTap;
  final Icon icon;
  final String name;
  final String subtitle;

  const HomeItem({
    super.key,
    this.onTap,
    required this.icon,
    required this.name,
    required this.subtitle,});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8)
      ),
      onTap: onTap,
      leading: icon,
      title: Text(name,style: TextStyle(fontWeight: FontWeight.bold),),
      subtitle: Text(subtitle,style: TextStyle(color: Colors.grey)),
    );
  }
}
