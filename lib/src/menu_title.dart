import 'package:flutter/material.dart';

class MenuTitle extends StatefulWidget {
  /// The children of this widget.
  final List<Widget> children;

  /// The title of this widget.
  final String title;

  /// active icon
  final Icon? activeIcon;

  /// inactive icon
  final Icon? inactiveIcon;

  /// açık mı başlasın
  final bool? isOpenStart;

  final Widget? trailing;

  const MenuTitle(
      {super.key,
      required this.title,
      required this.children,
      this.activeIcon,
      this.inactiveIcon,
      this.isOpenStart,
      this.trailing});

  @override
  State<MenuTitle> createState() => _MenuTitleState();
}

class _MenuTitleState extends State<MenuTitle> {
  late bool isCollapsed;

  @override
  void initState() {
    isCollapsed = widget.isOpenStart ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('isCollapsed: $isCollapsed');
    return ExpansionTile(
      iconColor: Theme.of(context).colorScheme.secondary,
      collapsedIconColor: Theme.of(context).colorScheme.background,
      onExpansionChanged: (value) => setState(() {
        isCollapsed = value;
      }),
      trailing: widget.trailing,
      maintainState: isCollapsed,
      leading: isCollapsed
          ? widget.activeIcon ?? const Icon(Icons.menu)
          : widget.activeIcon ?? const Icon(Icons.menu_open),
      title: Text(widget.title, style: Theme.of(context).textTheme.titleMedium),
      controlAffinity: ListTileControlAffinity.leading,
      children: widget.children,
    );
  }
}
