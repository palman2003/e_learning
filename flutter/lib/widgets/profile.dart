import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileData extends StatelessWidget {
  const ProfileData(
      {super.key,
      required this.path,
      required this.attribute,
      required this.value});
  final String path;
  final String attribute;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          path,
          height: 30,
          width: 30,
        ),
        SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              attribute,
              style: GoogleFonts.lato(
                  textStyle: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Color.fromARGB(255, 112, 106, 106))),
            ),
            Text(
              value,
              style: GoogleFonts.lato(
                  textStyle: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Color.fromARGB(255, 1, 1, 1))),
            )
          ],
        )
      ],
    );
  }
}
