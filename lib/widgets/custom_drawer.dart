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
            padding: EdgeInsets.only(left: width * 0.05),
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
                    child: Icon(
                      Icons.person,
                      size: 50,
                    ),
                  ),
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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(Icons.home),
                    Text('Home', style: Theme.of(context).textTheme.bodyMedium)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.home),
                    Text('Home', style: Theme.of(context).textTheme.bodyMedium)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.home),
                    Text('Home', style: Theme.of(context).textTheme.bodyMedium)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.home),
                    Text('Home', style: Theme.of(context).textTheme.bodyMedium)
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
