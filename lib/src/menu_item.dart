import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  /// The label of this widget.
  final String label;
  /// The function to call when this widget is tapped.
  final VoidCallback? onTap;

  const MenuItem({
    required this.label,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onTap?.call();
        if (Scaffold.of(context).isDrawerOpen) {
          Navigator.of(context).pop();
        }
      },
      title: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Icon(
              Icons.arrow_forward_ios_sharp,
              color: Theme.of(context).colorScheme.secondary,
              size: 14,
            ),
          ),
          Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color:Theme.of(context).colorScheme.secondary,
            ),
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }
}
