import 'package:e_commerce_app/screens/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 25, top: 10, right: 15, bottom: 10),
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
              color: Theme.of(context).colorScheme.onBackground,
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
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(_createRoute());
                  },
                  child: SvgPicture.asset(
                    'assets/icons/bag_icon.svg',
                    width: 28,
                    height: 28,
                    color: Theme.of(context).colorScheme.onBackground,
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

Route _createRoute() {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const CartScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 1.0);
        const end = Offset.zero;

        var curve = Curves.bounceInOut;
        var curveTween = CurveTween(curve: curve);

        final tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        final offsetAnimation = animation.drive(tween);

        return SlideTransition(
          child: child,
          position: offsetAnimation,
        );
      });
}
