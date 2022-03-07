import 'package:crypto/src/constants/app_theme.dart';
import 'package:crypto/src/ui/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppStartScreen extends StatefulWidget {
  static const routeName = '/app_start_screen';

  const AppStartScreen({Key? key}) : super(key: key);

  @override
  State<AppStartScreen> createState() => _AppStartScreenState();
}

class _AppStartScreenState extends State<AppStartScreen> {
  int selectedIndex = 0;

  var iconList = [
    FontAwesomeIcons.lightbulb,
    FontAwesomeIcons.paperPlane,
    FontAwesomeIcons.clock,
    FontAwesomeIcons.bell
  ];

  var screenList = [
    HomeScreen(),
    Container(),
    Container(),
    Container(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.neutral_white,
      body: screenList[selectedIndex],
      bottomNavigationBar: Container(
        width: double.infinity,
        height: kBottomNavigationBarHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 12),
                blurRadius: 20,
                color: AppTheme.black.withOpacity(0.5)),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: iconList
              .map((icon) => NavIcon(
                    iconData: icon,
                    selected: iconList.indexOf(icon) == selectedIndex,
                    onTap: () {
                      setState(() {
                        selectedIndex = iconList.indexOf(icon);
                      });
                    },
                  ))
              .toList(),

          // children: [
          //   iconList.for
          // NavIcon(iconData: FontAwesomeIcons.lightbulb, selected: true),
          // NavIcon(iconData: FontAwesomeIcons.paperPlane, selected: false),
          // NavIcon(iconData: FontAwesomeIcons.clock, selected: false),
          // NavIcon(iconData: FontAwesomeIcons.bell, selected: false),
          // ],
        ),
      ),
    );
  }
}

class NavIcon extends StatelessWidget {
  final IconData iconData;
  final bool selected;
  final Function onTap;

  NavIcon({required this.iconData, required this.selected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          onTap();
        },
        child: Center(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: FaIcon(
                  iconData,
                  color: selected ? AppTheme.soft_black : AppTheme.black.withOpacity(0.3),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Opacity(
                  opacity: selected ? 1.0 : 0.0,
                  child: Container(
                    width: 12.0,
                    height: 12.0,
                    margin: EdgeInsets.only(left: 16.0, top: 12.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.orange.withOpacity(0.5)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
