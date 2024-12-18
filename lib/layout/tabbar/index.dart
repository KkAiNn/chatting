/*
 * @Author: wurangkun
 * @Date: 2024-10-16 17:26:14
 * @LastEditTime: 2024-12-18 14:11:41
 * @LastEditors: wurangkun
 * @FilePath: \flutter_cli\lib\layout\tabbar\index.dart
 * @Description: 
 */
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabbarIcon {
  final IconData icon;
  final String label;
  final IconData selectedIcon;
  final Color selectedColor;
  final Color unselectedColor;

  TabbarIcon(
    this.icon,
    this.label,
    this.selectedIcon,
    this.unselectedColor,
    this.selectedColor,
  );
}

List<TabbarIcon> iconList = [
  TabbarIcon(Icons.home, '首页', Icons.sunny,
      const Color.fromARGB(255, 63, 63, 63), const Color(0xFFff5252)),
  TabbarIcon(Icons.dashboard_customize_outlined, '文件管理', Icons.sunny,
      const Color.fromARGB(255, 63, 63, 63), const Color(0xFFFF5252)),
  TabbarIcon(Icons.settings, '设置', Icons.sunny,
      const Color.fromARGB(255, 63, 63, 63), const Color(0xFFFF5252)),
];

Widget myTabBar(BuildContext context, int index, Function(int) onTap) {
  return AnimatedBottomNavigationBar.builder(
    gapLocation: GapLocation.none,
    itemCount: iconList.length,
    backgroundColor: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
    // theme: Theme.of(context).bottomNavigationBarTheme,
    tabBuilder: (int i, bool isActive) {
      var item = iconList[i];
      var icon = i == index ? item.selectedIcon : item.icon;
      var color = i == index ? item.selectedColor : item.unselectedColor;
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 24, color: color),
          Text(iconList[i].label, style: TextStyle(fontSize: 12.sp))
        ],
      );
    },
    activeIndex: index,
    onTap: onTap,
  );
}
