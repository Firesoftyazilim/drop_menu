import 'package:flutter/material.dart';


class MenuTitle extends StatefulWidget {
  /// The children of this widget.
  final List<Widget> children;
  /// The title of this widget.
  final String title;

  const MenuTitle({
    super.key,
    required this.title,
    required this.children,
  });

  @override
  State<MenuTitle> createState() => _MenuTitleState();
}

class _MenuTitleState extends State<MenuTitle> {
  bool isCollapsed = false;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      iconColor: Theme.of(context).colorScheme.secondary,
      collapsedIconColor: Theme.of(context).colorScheme.background,
      onExpansionChanged: (value) => setState(() {
        isCollapsed = value;
      }),
      leading: Icon(
        isCollapsed ? Icons.menu : Icons.menu_open,
        color:  Theme.of(context).colorScheme.secondary,
      ),
      title: Text(
        widget.title,
        style: TextStyle(
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
      controlAffinity: ListTileControlAffinity.leading,
      children: widget.children,
    );
  }
}

