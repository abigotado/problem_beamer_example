import 'package:flutter/material.dart';

BottomNavigationBarItem navBarItem({
  required final Widget icon,
  final Widget? activeIcon,
  final String? label,
}) {
  return BottomNavigationBarItem(
    label: label,
    icon: Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: icon,
    ),
    activeIcon: Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: activeIcon,
    ),
  );
}
