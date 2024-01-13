import 'package:flutter/material.dart';

class CourseTile extends StatelessWidget {
  const CourseTile({
    required this.gradientColors,
    required this.title,
    super.key,
  });

  final List<Color> gradientColors;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      width: double.infinity,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(255, 227, 150, 255),
            blurRadius: 1,
            offset: Offset(5, 5),
          ),
        ],
      ),
      child: Stack(
        children: [
          Image.asset(
            "assets/images/doodad.jpg",
            fit: BoxFit.cover,
          ),
          Column(
            children: [
              const SizedBox(height: 60),
              Image.asset(
                "assets/images/splash.png",
                width: 100,
                height: 100,
              ),
              const SizedBox(height: 20),
              Text(
                title,
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 241, 241, 241),
                    ),
              ),
              Text(
                "Lorem Ipsum sdnsdlk jnknknknkn nd typesettingindustry.",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: const Color.fromARGB(210, 255, 255, 255),
                    ),
              ),
            ],
          ),
          Positioned(
            bottom: 30,
            right: 40,
            child: Material(
              color: Colors.transparent,
              child: Ink(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: InkWell(
                  onTap: () {
                    // Handle the click event here
                  },
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                    child: Text(
                      "Play",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: const Color.fromARGB(255, 255, 110, 7),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );

    // return Container(
    //   margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
    //   child: InkWell(
    //     borderRadius: const BorderRadius.all(
    //       Radius.circular(20.0),
    //     ),
    //     onTap: () {
    //       print('Container tapped!');
    //     },
    //     child: Ink(
    //       width: double.infinity,
    //       height: 325,
    //       padding: const EdgeInsets.all(30),
    //       decoration: BoxDecoration(
    //         gradient: LinearGradient(
    //           colors: gradientColors,
    //           begin: Alignment.topLeft,
    //           end: Alignment.bottomRight,
    //         ),
    //         borderRadius: const BorderRadius.all(
    //           Radius.circular(20.0),
    //         ),
    //       ),
    //       child: Stack(
    //         children: [
    //           Positioned(
    //             width: 100,
    //             height: 100,
    //             child: Image.asset("assets/images/splash.png",),
    //           ),
    //           Positioned(
    //             child: Text(
    //               title,
    //               style: Theme.of(context).textTheme.titleLarge!.copyWith(
    //                     fontWeight: FontWeight.w700,
    //                   ),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
