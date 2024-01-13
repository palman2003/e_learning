import 'package:flutter/material.dart';

class CourseTile extends StatelessWidget {
  const CourseTile({
    required this.gradientColors,
    required this.width,
    required this.title,
    this.margin,
    super.key,
  });

  final List<Color> gradientColors;
  final double width;
  final String title;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: margin,
        child: InkWell(
          borderRadius: const BorderRadius.all(
            Radius.circular(20.0),
          ),
          onTap: () {
            print('Container tapped!');
          },
          child: Ink(
            width: double.infinity,
            height: 175,
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: gradientColors,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(20.0),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
