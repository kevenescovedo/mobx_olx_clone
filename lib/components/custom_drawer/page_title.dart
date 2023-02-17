import 'package:flutter/material.dart';
class PageTile extends StatelessWidget {
  final String label;
  final IconData iconData;
  final VoidCallback onTap;
  final bool highlighted;

  const PageTile({Key? key,
    required this.label,
    required this.iconData,
    required this.onTap,
    required this.highlighted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(iconData, color: highlighted ? Colors.purple : Colors.black,),
      title: Text(label, style: TextStyle(color: highlighted ? Colors.purple : Colors.black54, fontWeight: FontWeight.w700),),
      onTap: onTap,
    );
  }
}
