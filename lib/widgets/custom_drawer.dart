import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final heigh = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.75,
      height: heigh,
      color: Colors.white,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: width * 0.05, top: 25),
            color: Theme.of(context).colorScheme.primary,
            height: heigh * 0.30,
            width: width * 0.75,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const CircleAvatar(
                  radius: 52,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                      radius: 50,
                      backgroundImage:
                          AssetImage('assets/images/ProfilePic.jpg')),
                ),
                Text(
                  'Manuel Alejandro Davila',
                  style: Theme.of(context).textTheme.bodyMedium!.merge(
                      const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                ),
                Text(
                  'a.davilacisnero@gmail.com',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .merge(const TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: width * 0.05, top: width * 0.05),
            width: width * 0.75,
            height: (heigh * 0.40) - kBottomNavigationBarHeight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(right: 15),
                      child: Icon(Icons.home,
                          color: Theme.of(context).colorScheme.onSurface),
                    ),
                    Text(
                      'Home',
                      style: Theme.of(context).textTheme.bodyMedium!.merge(
                            TextStyle(
                                color: Theme.of(context).colorScheme.onSurface),
                          ),
                    )
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(right: 15),
                      child: Icon(Icons.credit_card,
                          color: Theme.of(context).colorScheme.onSurface),
                    ),
                    Text(
                      'Purchased',
                      style: Theme.of(context).textTheme.bodyMedium!.merge(
                            TextStyle(
                                color: Theme.of(context).colorScheme.onSurface),
                          ),
                    )
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(right: 15),
                      child: Icon(Icons.favorite,
                          color: Theme.of(context).colorScheme.onSurface),
                    ),
                    Text(
                      'Favorites',
                      style: Theme.of(context).textTheme.bodyMedium!.merge(
                            TextStyle(
                                color: Theme.of(context).colorScheme.onSurface),
                          ),
                    )
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(right: 15),
                      child: Icon(Icons.settings,
                          color: Theme.of(context).colorScheme.onSurface),
                    ),
                    Text(
                      'Settings',
                      style: Theme.of(context).textTheme.bodyMedium!.merge(
                            TextStyle(
                                color: Theme.of(context).colorScheme.onSurface),
                          ),
                    )
                  ],
                ),
              ],
            ),
          ),
          const Spacer(),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(
              left: width * 0.05,
              bottom: 25,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(right: 15),
                  child: Icon(Icons.logout,
                      color: Theme.of(context).colorScheme.onSurface),
                ),
                Text(
                  'Logout',
                  style: Theme.of(context).textTheme.bodyMedium!.merge(
                        TextStyle(
                            color: Theme.of(context).colorScheme.onSurface),
                      ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
