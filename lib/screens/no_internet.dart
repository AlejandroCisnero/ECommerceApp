import 'package:e_commerce_app/clippers/no_internet_clipper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NoInternet extends StatelessWidget {
  const NoInternet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height =
        MediaQuery.of(context).size.height - kBottomNavigationBarHeight;
    double width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        ClipPath(
          clipper: NoInternetClipper(),
          child: Container(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        Positioned(
          top: height / 2,
          left: width > 360 ? width / 3 : width / 5,
          child: Text(
            'No internet connection',
            style: GoogleFonts.mulish(
              textStyle:
                  const TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
            ),
          ),
        ),
      ],
    );
  }
}
