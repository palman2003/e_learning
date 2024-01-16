import 'package:flutter/material.dart';

class Heading {
  const Heading({
    // required this.text,
    this.topPadding = 20,
    this.bottomPadding = 0,
  });
  // final String text;
  final double topPadding;
  final double bottomPadding;
}

class SubHeading {
  const SubHeading({
    required this.text,
    this.topPadding = 20,
    this.bottomPadding = 5,
  });
  final String text;
  final double topPadding;
  final double bottomPadding;
}

class Body {
  const Body({
    required this.text,
    this.topPadding = 10,
    this.bottomPadding = 10,
  });
  final String text;
  final double topPadding;
  final double bottomPadding;
}

class BulletPoint {
  const BulletPoint({
    required this.text,
    this.topPadding = 10,
    this.bottomPadding = 10,
  });
  final String text;
  final double topPadding;
  final double bottomPadding;
}

class ImageContent {
  const ImageContent({
    required this.image,
    this.topPadding = 0,
    this.bottomPadding = 0,
  });
  final Image image;
  final double topPadding;
  final double bottomPadding;
}

final List<dynamic> module1 = [
  ImageContent(
    image: Image.asset(
      "assets/images/sample/sample_2.png",
      width: double.infinity,
      fit: BoxFit.fitWidth,
    ),
  ),
  const Heading(),
  const SubHeading(text: "Introuction"),
  const Body(
    text:
        "FMCG, or Fast-Moving Consumer Goods, holds a pivotal role in shaping our daily experiences. These products are the essentials we reach for regularly, from toothpaste and snacks to cleaning supplies and personal care",
  ),
  const Body(
    text:
        "items. Now, let's delve into why FMCG matters, with a particular focus on the emerging field of shelf analytics",
  ),
  const SubHeading(text: "Key Points"),
  const BulletPoint(
    text:
        "items. Now, let's delve into why FMCG matters, with a particular focus on the emerging field of shelf analytics",
  ),
  const BulletPoint(
    text:
        "By strategically placing high-demand or complementary products at eye level and easily accessible areas, retailers can guide customers through a seamless and enjoyable shopping journey.",
  ),
  const SubHeading(text: "Conclusion"),
  const Body(
    text:
        "A high Out-of-Stock Rate negatively impacts customer satisfaction, leading to potential revenue loss. When products are consistently unavailable, customers may turn to competitors, harming brand loyalty. Monitoring and minimizing this rate is vital for ensuring a positive customer experience and maximizing sales opportunities.",
  ),
  const Body(
    text:
        "A high Out-of-Stock Rate negatively impacts customer satisfaction, leading to potential revenue loss. When products are consistently unavailable, customers may turn to competitors, harming brand loyalty. Monitoring and minimizing this rate is vital for ensuring a positive customer experience and maximizing sales opportunities.",
  ),
  const SizedBox()
];
