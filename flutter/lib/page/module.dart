import 'package:e_learning/data/module_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ModulePage extends StatefulWidget {
  const ModulePage({
    required this.moduleData,
    required this.heroTag,
    super.key,
  });

  final List moduleData;
  final String heroTag;

  @override
  State<StatefulWidget> createState() {
    return _ModulePageState();
  }
}

class _ModulePageState extends State<ModulePage> {
  final headingStyle = GoogleFonts.merriweather().copyWith(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Color.fromARGB(255, 48, 48, 48),
    wordSpacing: 5,
  );

  final subHeadingStyle = GoogleFonts.merriweather().copyWith(
    fontSize: 17,
    fontWeight: FontWeight.bold,
    color: Color.fromARGB(255, 48, 48, 48),
    wordSpacing: 5,
  );

  final bodyStyle = GoogleFonts.merriweather().copyWith(
    fontSize: 14,
    // color: Color.fromARGB(255, 64, 64, 64),
    // fontWeight: FontWeight.bold,
    color: Color.fromARGB(255, 48, 48, 48),
    wordSpacing: 3,
  );

  @override
  Widget build(BuildContext context) {
    return Hero(
      // tag: "courseTile${index+1}",
      tag: widget.heroTag,
      child: Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          title: Text(
            "Module 01",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 64, 64, 64),
                ),
          ),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(0),
            child: LinearProgressIndicator(value: 0.5),
          ),
        ),
        bottomSheet: Container(
          color: Theme.of(context).colorScheme.background,
          height: 60,
          width: double.infinity,
          child: Row(
            children: [
              SizedBox(width: 20),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.arrow_back_ios_new_rounded),
              ),
              Spacer(),
              Text("1/2"),
              Spacer(),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.arrow_forward_ios_rounded),
              ),
              SizedBox(width: 20),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: GestureDetector(
            onHorizontalDragEnd: (details) {
              if (details.primaryVelocity! > 300) {
                print('Strong swipe right');
              } else if (details.primaryVelocity! < -300) {
                print('Strong swipe left');
              }
            },
            child: Column(
              children: widget.moduleData.map((e) {
                if (e is ImageContent) {
                  return e.image;
                } else if (e is Heading) {
                  return Padding(
                    padding: EdgeInsets.fromLTRB(
                        30, e.topPadding, 30, e.bottomPadding),
                    child: Text(
                      "Stock Market Basics",
                      style: headingStyle,
                    ),
                  );
                } else if (e is SubHeading) {
                  return Padding(
                    padding: EdgeInsets.fromLTRB(
                        30, e.topPadding, 30, e.bottomPadding),
                    child: Row(
                      children: [
                        Text(
                          e.text,
                          style: subHeadingStyle,
                        ),
                      ],
                    ),
                  );
                } else if (e is BulletPoint) {
                  return Padding(
                    padding: EdgeInsets.fromLTRB(
                        30, e.topPadding, 30, e.bottomPadding),
                    child: Text(
                      '◉    ' + e.text,
                      textAlign: TextAlign.start,
                      style: bodyStyle,
                    ),
                  );
                } else if (e is Body) {
                  return Padding(
                    padding: EdgeInsets.fromLTRB(
                        30, e.topPadding, 30, e.bottomPadding),
                    child: Text(
                      e.text,
                      style: bodyStyle,
                    ),
                  );
                }
                return const SizedBox(height: 60);
              }).toList(),
            ),
          ),
        ),
        // body: CustomScrollView(
        //   slivers: [
        //     SliverAppBar(
        //       expandedHeight: 100,
        //       floating: false,
        //       pinned: true,
        //       scrolledUnderElevation: 0,
      
        //       title: Text(
        //         "Module 01",
        //         style: Theme.of(context).textTheme.bodyLarge!.copyWith(
        //               fontWeight: FontWeight.bold,
        //               color: Color.fromARGB(255, 64, 64, 64),
        //             ),
        //       ),
        //       centerTitle: true,
        //       bottom: PreferredSize(
        //         preferredSize: const Size.fromHeight(6),
        //         child: Column(
        //           children: [
        //             Padding(
        //               padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
        //               child: Text(
        //                 "Introduction",
        //                 style: Theme.of(context).textTheme.titleLarge!.copyWith(
        //                       fontWeight: FontWeight.bold,
        //                       color: Color.fromARGB(255, 64, 64, 64),
        //                     ),
        //               ),
        //             ),
        //             LinearProgressIndicator(value: 0.5),
        //           ],
        //         ),
        //       ),
        //     ),
        //     SliverToBoxAdapter(
        //       child: GestureDetector(
        //         onHorizontalDragEnd: (details) {
        //           if (details.primaryVelocity! > 500) {
        //             print('Strong swipe right');
        //           } else if (details.primaryVelocity! < -500) {
        //             print('Strong swipe left');
        //           }
        //         },
        //         child: Column(
        //           children: widget.moduleData.map((e) {
        //             if (e is Heading) {
        //               return Text(e.text, style: headingStyle);
        //             } else if (e is SubHeading) {
        //               return Text(e.text, style: subHeadingStyle);
        //             } else if (e is BulletPoint) {
        //               return Text('\u2022' + e.text,
        //                   textAlign: TextAlign.start, style: bodyStyle);
        //             } else if (e is Body) {
        //               return Text(e.text,
        //                   textAlign: TextAlign.start, style: bodyStyle);
        //             }
        //             return const SizedBox();
        //           }).toList(),
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
