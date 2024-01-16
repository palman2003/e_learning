import 'package:e_learning/data/module_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ModulePage extends StatefulWidget {
  const ModulePage({
    required this.moduleData,
    super.key,
  });

  final List moduleData;
  @override
  State<StatefulWidget> createState() {
    return _ModulePageState();
  }
}

class _ModulePageState extends State<ModulePage> {
  final headingStyle = GoogleFonts.merriweather().copyWith(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Color.fromARGB(255, 64, 64, 64),
  );

  final subHeadingStyle = GoogleFonts.merriweather().copyWith(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Color.fromARGB(255, 64, 64, 64),
  );

  final bodyStyle = GoogleFonts.merriweather().copyWith(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Color.fromARGB(255, 64, 64, 64),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Text(
          "Module 01 | Introduction",
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
            if (details.primaryVelocity! > 500) {
              print('Strong swipe right');
            } else if (details.primaryVelocity! < -500) {
              print('Strong swipe left');
            }
          },
          child: Column(
            children: widget.moduleData.map((e) {
              if (e is Heading) {
                return Text(e.text, style: headingStyle);
              } else if (e is SubHeading) {
                return Text(e.text, style: subHeadingStyle);
              } else if (e is BulletPoint) {
                return Text('\u2022' + e.text,
                    textAlign: TextAlign.start, style: bodyStyle);
              } else if (e is Body) {
                return Text(e.text,
                    textAlign: TextAlign.start, style: bodyStyle);
              }
              return const SizedBox();
            }).toList(),
          ),
        ),
      ),
    );
  }
}
