import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 25, top: 10, right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: SvgPicture.asset(
              'assets/icons/drawer_icon.svg',
              width: 28,
              height: 28,
            ),
          ),
          SizedBox(
            width: 90,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 5),
                  child: GestureDetector(
                    child: SvgPicture.asset(
                      'assets/icons/search_icon.svg',
                      width: 34,
                      height: 34,
                    ),
                  ),
                ),
                GestureDetector(
                  child: SvgPicture.asset(
                    'assets/icons/bag_icon.svg',
                    width: 28,
                    height: 28,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
