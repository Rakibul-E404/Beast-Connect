import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavBar extends StatelessWidget {
  final List<BottomNavItem> items;
  final int currentIndex;
  final ValueChanged<int> onTap;
  final Color backgroundColor;
  final double navBarHeight;
  final double navBarWidth;
  final bool isSvgIcon;
  final Color iconColor;
  final Color selectedIconColor;
  final Color iconLabelColor;
  final Color selectedIconLabelColor;
  final Color unselectedIconLabelColor;
  final double iconSize;
  final double selectedIconSize;
  final bool selectedIconEffect;
  final double iconEffectElevation;
  final Duration iconEffectDuration;
  final Curve iconEffectCurve;
  final TextStyle? selectedLabelStyle;
  final TextStyle? unselectedLabelStyle;
  final double iconPadding;
  final BorderRadius? borderRadius;
  final List<BoxShadow>? boxShadow;
  final bool showSelectedLabels;
  final bool showUnselectedLabels;

  const CustomBottomNavBar({
    super.key,
    required this.items,
    required this.currentIndex,
    required this.onTap,
    this.backgroundColor = Colors.white,
    this.navBarHeight = 60.0,
    this.navBarWidth = double.infinity,
    this.isSvgIcon = false,
    this.iconColor = Colors.black,
    this.selectedIconColor = Colors.blue,
    this.iconLabelColor = Colors.black,
    this.selectedIconLabelColor = Colors.blue,
    this.unselectedIconLabelColor = Colors.black,
    this.iconSize = 24.0,
    this.selectedIconSize = 28.0,
    this.selectedIconEffect = true,
    this.iconEffectElevation = 4.0,
    this.iconEffectDuration = const Duration(milliseconds: 200),
    this.iconEffectCurve = Curves.easeInOut,
    this.selectedLabelStyle,
    this.unselectedLabelStyle,
    this.iconPadding = 4.0,
    this.borderRadius,
    this.boxShadow,
    this.showSelectedLabels = true,
    this.showUnselectedLabels = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: navBarHeight,
      width: navBarWidth,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius ?? const BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        boxShadow: boxShadow ?? [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 6,
            spreadRadius: 2,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(items.length, (index) {
          final item = items[index];
          final isSelected = currentIndex == index;

          return GestureDetector(
            onTap: () => onTap(index),
            child: Container(
              padding: EdgeInsets.all(iconPadding),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Icon with optional selection effect
                  if (selectedIconEffect)
                    AnimatedContainer(
                      duration: iconEffectDuration,
                      curve: iconEffectCurve,
                      transform: Matrix4.identity()
                        ..translate(
                          0.0,
                          isSelected ? -iconEffectElevation : 0.0,
                          0.0,
                        ),
                      child: _buildIcon(item, isSelected),
                    )
                  else
                    _buildIcon(item, isSelected),

                  // Label
                  if ((isSelected && showSelectedLabels) || (!isSelected && showUnselectedLabels))
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(
                        item.label,
                        style: isSelected
                            ? selectedLabelStyle ?? TextStyle(
                          color: selectedIconLabelColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        )
                            : unselectedLabelStyle ?? TextStyle(
                          color: iconLabelColor,
                          fontSize: 12,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildIcon(BottomNavItem item, bool isSelected) {
    final iconWidget = isSvgIcon
        ? SvgPicture.asset(
      item.iconPath,
      width: isSelected ? selectedIconSize : iconSize,
      height: isSelected ? selectedIconSize : iconSize,
      color: isSelected ? selectedIconColor : iconColor,
    )
        : Icon(
      item.iconData,
      size: isSelected ? selectedIconSize : iconSize,
      color: isSelected ? selectedIconColor : iconColor,
    );

    return isSelected && selectedIconEffect
        ? Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: selectedIconColor.withValues(alpha: 0.3),
            blurRadius: iconEffectElevation * 2,
            spreadRadius: 1,
          ),
        ],
      ),
      child: iconWidget,
    )
        : iconWidget;
  }
}

class BottomNavItem {
  final String label;
  final String iconPath;
  final IconData iconData;

  BottomNavItem({
    required this.label,
    this.iconPath = '',
    this.iconData = Icons.home,
  }) : assert(iconPath.isNotEmpty || iconData != null);
}








