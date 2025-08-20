import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  
  const CustomBottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildNavItem(
            icon: Icons.home_filled,
            activeIcon: Icons.home_filled,
            index: 0,
          ),
          _buildNavItem(
            icon: Icons.favorite_border,
            activeIcon: Icons.favorite,
            index: 1,
          ),
          _buildNavItem(
            icon: Icons.shopping_bag_outlined,
            activeIcon: Icons.shopping_bag,
            index: 2,
          ),

          //test
          _buildNavItem(
            icon: Icons.person_outline,
            activeIcon: Icons.person,
            index: 3,
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required IconData activeIcon,
    required int index,
  }) {
    final isActive = currentIndex == index;

    return GestureDetector(
      onTap: () => onTap(index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isActive ? activeIcon : icon,
              color: isActive 
                  ? const Color(0xFFBF6A02)
                  : Colors.grey[600],
              size: 24,
            ),
            const SizedBox(height: 4),
          ],
        ),
      ),
    );
  }
}