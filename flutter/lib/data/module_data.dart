class Heading {
  const Heading({required this.text});
  final String text;
}

class SubHeading {
  const SubHeading({required this.text});
  final String text;
}

class Body {
  const Body({
    required this.text,
    this.isBold = false,
  });
  final bool isBold;
  final String text;
}

class BulletPoint {
  const BulletPoint({required this.text});
  final String text;
}

class ImageContent {
  const ImageContent({required this.imageUrl});
  final String imageUrl;
}

final List<dynamic> module1 = [
  const Heading(text: "Hello"),
  const SubHeading(text: "Introuction"),
  const Body(
    text:
        "FMCG, or Fast-Moving Consumer Goods, holds a pivotal role in shaping our daily experiences. These products are the essentials we reach for regularly, from toothpaste and snacks to cleaning supplies and",
  ),
  const Body(text: "personal care", isBold: true),
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
        "2.	By strategically placing high-demand or complementary products at eye level and easily accessible areas, retailers can guide customers through a seamless and enjoyable shopping journey.",
  ),
  const SubHeading(text: "Conclusion"),
  const Body(
    text:
        "A high Out-of-Stock Rate negatively impacts customer satisfaction, leading to potential revenue loss. When products are consistently unavailable, customers may turn to competitors, harming brand loyalty. Monitoring and minimizing this rate is vital for ensuring a positive customer experience and maximizing sales opportunities.",
  ),
  const Body(
    text:
        "A high Out-of-Stock Rate negatively impacts customer satisfaction, leading to potential revenue loss. When products are consistently unavailable, customers may turn to competitors, harming brand loyalty. Monitoring and minimizing this rate is vital for ensuring a positive customer experience and maximizing sales opportunities.",
  )
];
