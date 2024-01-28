import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart';

class Header {
  const Header({
    required this.text,
    this.topPadding = 0,
    this.fontSize = 40,
    this.bottomPadding = 0,
    this.textColor = const Color.fromARGB(255, 48, 48, 48),
    this.bgColor = Colors.transparent,
  });
  final String text;
  final Color textColor;
  final Color bgColor;
  final double topPadding;
  final double fontSize;
  final double bottomPadding;
}

class Heading {
  const Heading({
    required this.text,
    this.topPadding = 0,
    this.bottomPadding = 0,
    this.fontSize = 22,
    this.textColor = const Color.fromARGB(255, 48, 48, 48),
    this.bgColor = Colors.transparent,
  });
  final String text;
  final double fontSize;
  final Color textColor;
  final Color bgColor;
  final double topPadding;
  final double bottomPadding;
}

class SubHeading {
  const SubHeading({
    required this.text,
    this.topPadding = 20,
    this.bottomPadding = 5,
    this.textColor = const Color.fromARGB(255, 48, 48, 48),
    this.bgColor = Colors.transparent,
  });
  final String text;
  final double topPadding;
  final Color textColor;
  final Color bgColor;
  final double bottomPadding;
}

class Body {
  const Body(
      {required this.text,
      this.topPadding = 10,
      this.align = TextAlign.start,
      this.fontSize = 16,
      this.bottomPadding = 10,
      this.textColor = const Color.fromARGB(255, 48, 48, 48),
      this.bgColor = Colors.transparent});
  final String text;
  final Color textColor;
  final Color bgColor;
  final double fontSize;
  final TextAlign align;
  final double topPadding;
  final double bottomPadding;
}

class BulletPoint {
  const BulletPoint({
    required this.text,
    this.topPadding = 10,
    this.bottomPadding = 10,
    this.textColor = Colors.black,
    this.bgColor = Colors.transparent,
  });
  final String text;
  final double topPadding;
  final Color textColor;
  final Color bgColor;

  final double bottomPadding;
}

class SubBulletPoint {
  const SubBulletPoint(
      {required this.text,
      this.topPadding = 0,
      this.bottomPadding = 5,
      this.leftPadding = 20,
      this.bgColor = Colors.transparent,
      this.textColor = Colors.black});
  final String text;
  final double topPadding;
  final Color textColor;
  final Color bgColor;
  final double bottomPadding;
  final double leftPadding;
}

class BodyImage {
  const BodyImage({
    required this.image,
    this.topPadding = 0,
    this.bottomPadding = 0,
  });
  final Image image;
  final double topPadding;
  final double bottomPadding;
}

class HeadImage {
  const HeadImage({
    required this.image,
    this.topPadding = 0,
    this.bottomPadding = 0,
  });
  final Image image;
  final double topPadding;
  final double bottomPadding;
}

class Boxes {
  const Boxes({
    required this.data,
    this.topPadding = 0,
    this.bottomPadding = 0,
  });

  final List<String> data;
  final double topPadding;
  final double bottomPadding;
}

class TabularColumn {
  const TabularColumn({
    required this.data,
    this.headerTextStyle = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      backgroundColor: Color.fromARGB(255, 151, 192, 232),
    ),
    this.cellTextStyle = const TextStyle(
      fontSize: 16,
    ),
  });

  final List<List<String>> data;
  final TextStyle headerTextStyle;
  final TextStyle cellTextStyle;
}

class QuizButton {
  const QuizButton({
    this.topPadding = 10,
  });
  final double topPadding;
}

class ImageSlider {
  ImageSlider(
      {required this.imageList,
      required this.height,
      // required this.width,
      required this.verticalPadding});
  final List<String> imageList;
  final double height;
  // final double width;
  final double verticalPadding;
}

final List moduleTitle = [
  "Shelf Analytics",
  "Title 2",
  "Title 3",
  "Title 4",
  "Title 5",
  "Title 6",
  "Title 7",
  "Title 8",
  "Title 9",
  "Title 10",
  "Title 11",
];

final List module = [
  [
    [
      const SizedBox(),
      BodyImage(
          image: Image.asset(
        'assets/images/module1/fmcg.png',
        height: 300,
      )),
      const Header(
        text: 'FMCG\nCategory ',
        //bgColor: Color.fromARGB(255, 151, 192, 232),
        topPadding: 20,
        bottomPadding: 20,
      ),
      const SizedBox()
    ],
    [
      const Header(
        text: 'What is',
        topPadding: 20,
        textColor: Color.fromARGB(255, 151, 192, 232),
      ),
      const Header(text: 'FMCG?', bottomPadding: 35),
      const Heading(
          text: 'Fast Moving Consumer Goods',
          bgColor: Colors.yellow,
          bottomPadding: 35),
      BodyImage(
          image: Image.asset(
        'assets/images/module1/pg2.png',
        height: 250,
        width: double.infinity,
      )),
    ],
    [
      const Body(text: 'Examples :', fontSize: 24),
      const BulletPoint(
          text: 'Personal Care products -> Shampoo, Face Wash, Soap etc',
          bottomPadding: 0),
      const BulletPoint(
          text:
              'Packaged Food & Beverages -> Chips, Juices, Carbonated drinks etc',
          bottomPadding: 0),
      const BulletPoint(
          text: 'Laundry -> Detergent etc, Over the counter Medicines'),
      const Body(
          text:
              'The term FMCG has been defined to include products that are consumed at least once a month',
          bgColor: Colors.yellow,
          bottomPadding: 0),
      const Body(
        text:
            'These are sold under  national brands in consumer packages, sold through a wide spared distribution network and consumed directly by the consumers.',
      ),
      const Body(text: 'Top players in FMCG: ', fontSize: 18, bottomPadding: 0),
      ImageSlider(imageList: [
        'assets/images/module1/pg3_1.png',
        'assets/images/module1/pg3_2.png',
        'assets/images/module1/pg3_3.png',
        'assets/images/module1/pg3_4.png',
      ], height: 10, verticalPadding: 0),
      const SizedBox(),
    ],
    [
      const Heading(text: 'Classification', topPadding: 40),
      BodyImage(
          image: Image.asset(
        'assets/images/module1/pg4.png',
        height: 500,
      ))
    ],
    [
      const Heading(
          text: 'How do consumers make choices? ',
          fontSize: 25,
          topPadding: 20,
          bottomPadding: 10),
      const Body(
          text: 'Consumer buying decision varies based on product types  ',
          // bgColor: Color.fromARGB(255, 112, 217, 255),
          bgColor: Colors.yellow,
          align: TextAlign.center,
          bottomPadding: 20),
      BodyImage(
          image: Image.asset(
        'assets/images/module1/pg5.png',
        height: 350,
      )),
      SizedBox(),
    ],
    [
      const Header(text: 'HIP and LIP', fontSize: 32, topPadding: 20),
      const Heading(
          text: 'High Involvement (HIP):', fontSize: 16, topPadding: 30),
      const Body(
          text:
              'Products for which the buyer is prepared to spend considerable time and effort in searching.',
          topPadding: 0),
      const Heading(text: 'Low Involvement (LIP): ', fontSize: 16),
      const Body(
          text:
              'Products which are bought frequently and with a minimum of thought and effort',
          topPadding: 0),
      const TabularColumn(data: [
        ['High Involvement ', 'Low involvement'],
        ['Similar Brand Offering ', 'Unique Brand Offering '],
        ['Dissonance reducing buying behavior ', 'Complex buying behavior'],
        ['Habitual Buying behavior', 'Variety seeking behavior']
      ]),
      SizedBox(),
    ],
    [
      Heading(text: 'Distribution and Decision Making ', bottomPadding: 10),
      BodyImage(
          image: Image.asset(
        'assets/images/module1/pg6.png',
        height: 300,
      )),
      Body(
          text:
              'The distribution of Fast-Moving Consumer Goods (FMCG) involves getting products from manufacturers to end consumers as efficiently and effectively as possible.'),
      Body(
          text:
              'Decision-making in FMCG distribution is crucial for ensuring products are available at the right time and place, optimizing supply chain efficiency, and meeting customer demands.',
          bgColor: Colors.yellow),
      SizedBox(),
    ],
    [
      Heading(text: 'Types of Distribution', bottomPadding: 30),
      BodyImage(image: Image.asset('assets/images/module1/pg8_1.png')),
      Body(text: 'Direct Distribution', align: TextAlign.center, topPadding: 0),
      BodyImage(
          image: Image.asset(
        'assets/images/module1/pg8_3.png',
        height: 350,
      )),
      Body(
          text: 'Indirect Distribution',
          align: TextAlign.center,
          topPadding: 0),
    ],
    [
      const Heading(
          text: 'Pros and Cons of Direct and Indirect distribution',
          topPadding: 20,
          bottomPadding: 15),
      const Heading(
          text: 'Direct Distribution', fontSize: 18, bgColor: Colors.yellow),
      TabularColumn(data: [
        ['Pros', 'Cons'],
        [
          'You have total control over how the product is marketed and sold',
          'More time-consuming and expensive for some business owners'
        ],
        [
          'No fighting with competitors for shelf space at retailers.',
          'Limited market coverage.'
        ]
      ]),
      const Heading(
          text: 'Indirect Distribution', fontSize: 18, bgColor: Colors.yellow),
      const TabularColumn(data: [
        ['Pros', 'Cons'],
        [
          'Distribution agents specialize in getting products into as many markets as possible',
          'Distribution agents and retailers will share in your profits'
        ],
        [
          'Retailers know their local markets and how best to sell your product there.',
          'Retailers may sell your competitors’ products alongside yours.'
        ]
      ]),
      SizedBox(),
    ],
    [
      Heading(
          text: 'Key Consideration for Distribution ',
          topPadding: 20,
          bottomPadding: 20),
      // Spacer(),
      BodyImage(
          image: Image.asset(
        'assets/images/module1/pg9.png',
        height: 500,
      ))
    ],
    [
      const SubHeading(text: "Companies"),
      const BulletPoint(
          text:
              "FMCG: 𝗨𝗻𝗶𝗹𝗲𝘃𝗲𝗿, 𝗣&𝗚, 𝗜𝗧𝗖, 𝗖𝗮𝘃𝗶𝗻𝗞𝗮𝗿𝗲, 𝗚𝗲𝗻𝗲𝗿𝗮𝗹 𝗠𝗶𝗹𝗹𝘀"),
      const BulletPoint(
          text:
              "FMCD: 𝗛𝗣, 𝗪𝗵𝗶𝗿𝗹𝗽𝗼𝗼𝗹, 𝗩𝗼𝗹𝘁𝗮𝘀, 𝗣𝗵𝗶𝗹𝗶𝗽𝘀, 𝗛𝗶𝘁𝗮𝗰𝗵𝗶"),
      const SubHeading(text: "Products"),
      const Body(text: "FMCG", bgColor: Color.fromARGB(255, 255, 224, 130)),
      const SubBulletPoint(
          text: "Personal Care products -> Shampoo, Face Wash, Soap etc"),
      const SubBulletPoint(
          text:
              "Packaged Food & Beverages -> Chips, Juices, Carbonated drinks etc"),
      const SubBulletPoint(text: "Laundry -> Detergent etc"),
      const Body(text: "FMCD", bgColor: Color.fromARGB(255, 255, 224, 130)),
      const SubBulletPoint(text: "Automobile -> Cars, Bikes, Trucks etc"),
      const SubBulletPoint(
          text:
              "Household appliances -> Washing Machine, Iron, Oven, Vacuum Cleaner etc"),
      const SubBulletPoint(
          text: "Electronic gadgets -> Smart Phones, Laptops etc"),
    ],
    [
      const Heading(text: "Buying Decision"),
      BodyImage(
          image: Image.asset("assets/images/module1/buying_decision.png")),
      const BulletPoint(
          text:
              "While FMCG and FMCD companies will have products to sell, but how a person ends up buying is still a blackbox"),
      const BulletPoint(
          text:
              "We do 𝗡𝗢𝗧 know what all went into purchasing a particular product."),
      const Body(text: "However, in general it consists of 𝟔 𝐬𝐭𝐞𝐩𝐬:"),
      const SubBulletPoint(text: "Need recognition"),
      const SubBulletPoint(text: "Information search"),
      const SubBulletPoint(text: "Alternative evaluation"),
      const SubBulletPoint(text: "Purchase decision"),
      const SubBulletPoint(text: "Completing the purchase"),
      const SubBulletPoint(text: "Post purchase evaluation"),
      //
      const SizedBox()
    ],
    [
      const Heading(text: "Buying Decision in context of FMCG and FMCD"),
      const SubHeading(text: "Types of buying decision"),
      BodyImage(
        image: Image.asset(
          "assets/images/module1/buying_decisions_types.png",
          //fit: BoxFit.fitWidth,
          width: 300,
          height: 300,
        ),
      ),
      const BulletPoint(
          text:
              "Steps involved in decision making would also depend on the type of product"),
      const BulletPoint(text: 'Basis the same, products can be classified as'),
      const Body(
        text: 'Low Involvement (LIP):',
        bgColor: Color.fromARGB(255, 255, 224, 130),
      ),
      const SubBulletPoint(
          text:
              'Products which are 𝗯𝗼𝘂𝗴𝗵𝘁 𝗳𝗿𝗲𝗾𝘂𝗲𝗻𝘁𝗹𝘆 and with a minimum of thought and effort'),
      const Body(
        text: 'High Involvement (HIP):',
        bgColor: Color.fromARGB(255, 255, 224, 130),
      ),
      const SubBulletPoint(
          text:
              'Products for which the buyer is prepared to 𝘀𝗽𝗲𝗻𝗱 𝗰𝗼𝗻𝘀𝗶𝗱𝗲𝗿𝗮𝗯𝗹𝗲 𝘁𝗶𝗺𝗲 and effort in searching.'),
      const BulletPoint(
          text:
              'Generally, LIP -> FMCG products, while HIP -> Durable & Luxury products'),
      const BulletPoint(
          text:
              'This is applicable across various categories in the FMCG space'),
      const SizedBox(),
    ],
    [
      const Heading(text: "Low Involvement & High Involvement Purchase"),
      BodyImage(
        image: Image.asset(
          "assets/images/module1/buying_decisions.png",
          //fit: BoxFit.fitWidth,
          width: 300,
          height: 300,
        ),
      ),
    ],
    [
      const SubHeading(text: 'Categories within FMCG'),
      const BulletPoint(
          text:
              'Now that we have seen the difference in buying decision, it should be noted that within FMCG itself – there are a lot of categories.'),
      const BulletPoint(text: "𝗖𝗮𝘃𝗶𝗻𝗞𝗮𝗿𝗲 is an 𝗙𝗠𝗖𝗚 company."),
      const BulletPoint(
          text:
              "Process of selling products under any category requires distribution - which we will see it in the next slide"),
      BodyImage(
        image: Image.asset(
          "assets/images/module1/fmcg_categories.png",
          fit: BoxFit.fill,
          // width: 100,
          // height: 300,
        ),
      ),
      const SizedBox(),
    ],
    [
      const Heading(text: 'Distribution'),
      BodyImage(
        image: Image.asset(
          "assets/images/module1/distribution.png",
          fit: BoxFit.fill,
          // width: 100,
          // height: 300,
        ),
      ),
      const BulletPoint(
          text:
              'Activity of selling products from manufacturers to the consumers',
          bgColor: Color.fromARGB(255, 255, 224, 130)),
      const BulletPoint(
          text:
              'Two types ->  𝗗𝗶𝗿𝗲𝗰𝘁 𝗮𝗻𝗱 𝗜𝗻𝗱𝗶𝗿𝗲𝗰𝘁 𝗗𝗶𝘀𝘁𝗿𝗶𝗯𝘂𝘁𝗶𝗼𝗻 (Majority of the FMCG entities follow Indirect Distribution '),
      const SubHeading(text: "Direct Distribution - Schematics"),
      BodyImage(
        image: Image.asset(
          'assets/images/module1/direct_distribution.png',
          fit: BoxFit.fill,
        ),
      ),
      const SubHeading(text: "Indirect Distribution - Schematics"),
      BodyImage(
        image: Image.asset(
          'assets/images/module1/indirect_distribution.png',
          fit: BoxFit.fill,
          height: 75,
        ),
      ),
      const SizedBox()
    ],
    [
      const SubHeading(text: 'Direct Distribution'),
      const Body(text: 'Pros', bgColor: Color.fromARGB(255, 255, 224, 130)),
      const BulletPoint(
          text:
              'You have 𝘁𝗼𝘁𝗮𝗹 𝗰𝗼𝗻𝘁𝗿𝗼𝗹 over how the product is marketed and sold'),
      const BulletPoint(
          text: 'No fighting with competitors for shelf space at retailers.'),
      const Body(text: 'Cons', bgColor: Color.fromARGB(255, 255, 224, 130)),
      const BulletPoint(
          text: 'More time-consuming and expensive for some business owners'),
      const BulletPoint(text: '𝗟𝗶𝗺𝗶𝘁𝗲𝗱 𝗺𝗮𝗿𝗸𝗲𝘁 𝗰𝗼𝘃𝗲𝗿𝗮𝗴𝗲.'),
      const SubHeading(text: 'Indirect Distribution'),
      const Body(text: 'Pros', bgColor: Color.fromARGB(255, 255, 224, 130)),
      const BulletPoint(
          text:
              'Distribution agents specialize in getting products into as many markets as possible'),
      const BulletPoint(
          text:
              'Retailers know their local markets and how best to sell your product there'),
      const Body(text: 'Cons', bgColor: Color.fromARGB(255, 255, 224, 130)),
      const BulletPoint(
          text: 'Distribution agents and retailers will share in your profits'),
      const BulletPoint(
          text:
              'Retailers may sell your competitors’ products alongside yours.'),
      const SizedBox()
    ],
    [
      const Heading(text: 'Importance of Distribution'),
      const BulletPoint(
          text:
              'For a product to be sold – it should be available and visible'),
      BodyImage(
        image: Image.asset(
          "assets/images/module1/case1.png",
          fit: BoxFit.fill,
          // width: 100,
          // height: 300,
        ),
      ),
      const BulletPoint(
          text:
              '𝗖𝗮𝘀𝗲 𝟭 -> Product A & B available, but only Product A is visible. Product A has higher chances of getting sold'),
      BodyImage(
        image: Image.asset(
          "assets/images/module1/case2.png",
          fit: BoxFit.fill,
          // width: 100,
          // height: 300,
        ),
      ),
      const BulletPoint(
          text:
              '𝗖𝗮𝘀𝗲 𝟮 -> Product A is available but not visible. Product B is not available. Product A has slightly lower chances of getting sold (solely due to availability)'),
      BodyImage(
        image: Image.asset(
          "assets/images/module1/case3.png",
          fit: BoxFit.fill,
          // width: 100,
          // height: 300,
        ),
      ),
      const BulletPoint(
          text:
              '𝗖𝗮𝘀𝗲 𝟯 -> Product B is available and visible. Product B has higher chances of getting sold'),
      const SizedBox()
    ],
    [
      const Heading(text: "Importance of Distribution"),
      const BulletPoint(
          text:
              'Being just available is not enough -> it should be available in the 𝗿𝗶𝗴𝗵𝘁 𝗽𝗹𝗮𝗰𝗲𝘀/𝗼𝘂𝘁𝗹𝗲𝘁𝘀'),
      const BulletPoint(
          text:
              'An example of proper distribution is placing products where there has been consistent sales historically.'),
      const SubBulletPoint(
          text:
              "If Chik is best sold in UP, it makes sense to have a good distribution system than entering a market where the penetration is low"),
      BodyImage(
        image: Image.asset(
          "assets/images/module1/shampoo.png",
          fit: BoxFit.fill,
        ),
      ),
      const BulletPoint(
          text:
              "Another example would be availability in the right outlets -> like how 𝘀𝗮𝗰𝗵𝗲𝘁𝘀 𝗮𝗿𝗲 𝗯𝗲𝘀𝘁 𝘀𝗼𝗹𝗱 𝗶𝗻 𝗞𝗶𝗿𝗮𝗻𝗮 𝘀𝘁𝗼𝗿𝗲𝘀 𝗮𝗻𝗱 𝗕𝗼𝘁𝘁𝗹𝗲𝘀 𝗶𝗻 𝗦𝘂𝗽𝗲𝗿 𝗠𝗮𝗿𝗸𝗲𝘁"),
      const BulletPoint(
          text:
              "Kirana stores and Super Markets are not the only types of outlets available – next we will look at the different types of outlets"),
      const SizedBox()
    ],
    [
      const Heading(text: "Different types of Outlets"),
      BodyImage(
        image: Image.asset(
          "assets/images/module1/class_of_outlets.png",
          fit: BoxFit.fill,
        ),
      ),
      const SizedBox()
    ],
    [
      const Heading(text: "General Trade vs Modern trade"),
      BodyImage(
        image: Image.asset(
          "assets/images/module1/trade.png",
          fit: BoxFit.fill,
        ),
      ),
      const TabularColumn(
        data: [
          ["General Trade", "Modern Trade"],
          [
            "Usually comprises one store",
            "Comprises chains across many locations"
          ],
          [
            "Operated by an entrepreneur and maybe their family",
            "Run by investors or management teams"
          ],
          [
            "Major focus on interpersonal relationships",
            "Minimal focus on interpersonal relationships between store and consumer"
          ],
          [
            "Limited space that limits visual merchandising strategy",
            "Spacious to accommodate visual merchandising props and equipment"
          ],
        ],
      ),
      const SizedBox()
    ],
    [
      const Heading(text: "As per Nielsen – types of outlets"),
      BodyImage(
        image: Image.asset(
          "assets/images/module1/nielsen.png",
          fit: BoxFit.fill,
        ),
      ),
      const Body(
          text:
              "Nielsen is a global company that provides valuable insights into consumer behavior and marketing information by collecting data that measures what consumers watch and what they buy. This is how they classify outlets:"),
      const BulletPoint(
          text:
              '𝗚𝗿𝗼𝗰𝗲𝗿𝘀: A store primarily focused on selling food and consumable products.'),
      const BulletPoint(
          text:
              '𝗖𝗵𝗲𝗺𝗶𝘀𝘁: shop where drugs and medicines are sold or given out, and where you can buy cosmetics and some household goods'),
      const BulletPoint(
          text:
              '𝗖𝗼𝘀𝗺𝗲𝘁𝗶𝗰𝘀: shop where personal care products are sold'),
      const BulletPoint(
          text:
              '𝗣𝗮𝗮𝗻 𝗣𝗹𝘂𝘀: small scale Kirana store focussed in selling small SKUs and ready to eat snacks'),
      const BulletPoint(
          text:
              '𝗦𝘂𝗽𝗲𝗿 𝗠𝗮𝗿𝗸𝗲𝘁: large shopping store where customers choose their products which are organized systematically into sections'),
      const BulletPoint(
          text:
              '𝗛𝘆𝗽𝗲𝗿 𝗠𝗮𝗿𝗸𝗲𝘁:  large retail establishments that are a culmination of departmental stores and supermarkets '),
      const SizedBox()
    ],
    [
      const Heading(text: "Some examples of Outlets"),
      ImageSlider(
        imageList: [
          "assets/images/module1/outlet1.png",
          "assets/images/module1/outlet2.png",
          "assets/images/module1/outlet3.png",
          "assets/images/module1/outlet4.png",
        ],
        height: 200,
        verticalPadding: 50,
      ),
      const Heading(text: 'Channel Satisfaction'),
      const BulletPoint(
          text:
              'Not just distribution strategy, 𝗸𝗲𝗲𝗽𝗶𝗻𝗴 𝘁𝗵𝗲 𝗼𝘂𝘁𝗹𝗲𝘁𝘀 𝘀𝗮𝘁𝗶𝘀𝗳𝗶𝗲𝗱 is equally important for the betterment of sales'),
      const BulletPoint(
          text:
              'Hence, understanding the satisfaction levels of retailers that the distributors cater to is very important and this is done through channel satisfaction surveys'),
      BodyImage(
        image: Image.asset(
          "assets/images/module1/channel_satisfaction_1.png",
          fit: BoxFit.fill,
        ),
      ),
      const SizedBox()
    ],
    [
      const Heading(text: "Factors affecting channel satisfaction"),
      BodyImage(
        image: Image.asset(
          "assets/images/module1/channel_satisfaction.png",
          fit: BoxFit.fill,
        ),
      ),
      const Body(text: 'Some factors that affect the satisfaction level:'),
      const BulletPoint(text: '𝗠𝗮𝗿𝗴𝗶𝗻 provided on the product'),
      const BulletPoint(
          text:
              '𝗖𝗿𝗲𝗱𝗶𝘁 𝗴𝗶𝘃𝗲𝗻 𝘁𝗼 𝘁𝗵𝗲 𝗼𝘂𝘁𝗹𝗲𝘁 -> loan made between company and the retailer'),
      const BulletPoint(
          text:
              'Damages/Returns -> Damaged goods returned back to company at no additional cost + returns'),
      const BulletPoint(
          text:
              '𝗙𝗶𝗹𝗹 𝗿𝗮𝘁𝗲 -> percentage of customer orders that are immediately fulfilled by available stock. Also known as demand satisfaction rate'),
      const BulletPoint(text: 'Stable market rates'),
      const SizedBox()
    ],
    [
      const Heading(text: 'Merchandizing'),
      const BulletPoint(
          text:
              '𝗠𝗲𝗿𝗰𝗵𝗮𝗻𝗱𝗶𝘇𝗶𝗻𝗴 -> promotion of the sale of goods that can employ pricing, special offer, display, & other techniques '),
      const SubHeading(text: 'Importance of Merchandizing'),
      const Body(
          text:
              '1. Enhanced visibility of the product \n2.Improved shopping experience \n3.Increased sales \n4.Competitive advantage'),
      const SubHeading(text: 'Different strategies for Merchandizing'),
      BodyImage(
        image: Image.asset(
          "assets/images/module1/merchandizing_1.png",
          fit: BoxFit.fill,
        ),
      ),
      const SizedBox()
    ],
    [
      const Heading(text: "Different strategies for Merchandizing"),
      BodyImage(
        image: Image.asset(
          "assets/images/module1/merchandizing.png",
          fit: BoxFit.fill,
        ),
      ),
      const SizedBox()
    ],
    [
      const Heading(text: 'Important KPIs in Merchandizing'),
      BodyImage(
        image: Image.asset(
          "assets/images/module1/kpi.png",
          fit: BoxFit.fill,
          height: 500,
        ),
      ),
      const SizedBox()
    ],
    [
      const Heading(text: "Shelf Analytics"),
      const SubHeading(text: 'Importance of Display Merchandize'),
      BodyImage(
        image: Image.asset(
          "assets/images/module1/display_merchandize.png",
          fit: BoxFit.fill,
        ),
      ),
      const BulletPoint(text: 'Display of product information makes easy to:'),
      const SubBulletPoint(
        text: '𝐈𝐧𝐭𝐫𝐨𝐝𝐮𝐜𝐞',
      ),
      const SubBulletPoint(
        text: '𝗘𝘅𝗽𝗹𝗮𝗶𝗻',
      ),
      const SubBulletPoint(
        text: '𝗦𝗵𝗼𝘄',
      ),
      const SubBulletPoint(
        text: '𝗦𝗲𝗹𝗹',
      ),
      const BulletPoint(
          text:
              'Not just for the product, effective display helps establish, promote & enhance the store’s visual image '),
      const BulletPoint(
          text:
              'Display also helps the shopper in making it easier for them to self select'),
      const SizedBox()
    ],
    [
      const Heading(text: "Different types of Display Merchandize"),
      ImageSlider(
        imageList: [
          "assets/images/module1/merch1.png",
          "assets/images/module1/merch2.png",
          "assets/images/module1/merch3.png",
          "assets/images/module1/merch4.png",
          "assets/images/module1/merch5.png",
        ],
        height: 200,
        verticalPadding: 50,
      ),
      const BulletPoint(text: 'Different types of Display:'),
      const SubBulletPoint(
        text: '𝗙𝗹𝗼𝗼𝗿 𝗦𝘁𝗮𝗻𝗱',
      ),
      const SubBulletPoint(
        text: '𝗦𝗵𝗼𝘄𝗰𝗮𝘀𝗲',
      ),
      const SubBulletPoint(
        text: '𝗘𝗻𝗱 𝗰𝗮𝗽 𝘂𝗻𝗶𝘁',
      ),
      const SubBulletPoint(
        text: '𝗖𝗵𝗲𝗰𝗸𝗼𝘂𝘁 𝗱𝗶𝘀𝗽𝗹𝗮𝘆',
      ),
      const SubBulletPoint(
        text: '𝗗𝗶𝗴𝗶𝘁𝗮𝗹 𝗣𝗼𝗽 𝗱𝗶𝘀𝗽𝗹𝗮𝘆',
      ),
      const BulletPoint(
          text:
              'Display is majorly classified into 𝘁𝘄𝗼 on the basis of its purpose:'),
      const SubBulletPoint(text: 'Point of Sale Display'),
      const SubBulletPoint(text: 'Point of Purchase Display'),
      const SizedBox()
    ],
    [
      const Heading(text: 'Point of Sale Display'),
      BodyImage(
        image: Image.asset(
          "assets/images/module1/POS.png",
          fit: BoxFit.fill,
        ),
      ),
      const BulletPoint(
        text: "POS - Point of Sale",
        bgColor: Color.fromARGB(255, 255, 224, 130),
      ),
      const BulletPoint(
          text:
              "Point of Sale Display is used to 𝗶𝗻𝗳𝗹𝘂𝗲𝗻𝗰𝗲 𝗮 𝘀𝗵𝗼𝗽𝗽𝗲𝗿’𝘀 𝗱𝗲𝗰𝗶𝘀𝗶𝗼𝗻"),
      const BulletPoint(
          text:
              "𝗜𝘁 𝗶𝘀 𝗽𝗿𝗲𝘀𝗲𝗻𝘁 𝗼𝗻𝗹𝘆 𝗶𝗻 𝘀𝗽𝗲𝗰𝗶𝗳𝗶𝗰 𝘀𝗽𝗮𝗰𝗲𝘀"),
      const BulletPoint(text: "Ideally away from the category"),
      const BulletPoint(text: "It is targeted to influence a specific group"),
      const BulletPoint(
          text:
              "Best for individually packaged items like food & confectioneries"),
      const SizedBox(),
    ],
    [
      const Heading(text: 'Point of Purchase Display'),
      BodyImage(
        image: Image.asset(
          "assets/images/module1/POP.png",
          fit: BoxFit.fill,
        ),
      ),
      const BulletPoint(
          text: "POP - Point of Purchase",
          bgColor: Color.fromARGB(255, 255, 224, 130)),
      const BulletPoint(
          text:
              "Point of Purchase Display is used to 𝗰𝗮𝗽𝘁𝘂𝗿𝗲 𝘁𝗵𝗲 𝗮𝘁𝘁𝗲𝗻𝘁𝗶𝗼𝗻 of shopper"),
      const BulletPoint(
          text: "It can be 𝗽𝗹𝗮𝗰𝗲𝗱 𝗮𝗻𝘆𝘄𝗵𝗲𝗿𝗲 in the store"),
      const BulletPoint(
          text: "Usually placed next to the space of the same category."),
      const BulletPoint(
          text: "Offers flexibility in targeting different groups"),
      const BulletPoint(text: "Suitable for a wide variety of products"),
      const SizedBox(),
    ],
    [
      const Heading(text: 'Brand Blocking & POSM (Example)'),
      BodyImage(
        image: Image.asset(
          "assets/images/module1/BrandBlocking.png",
          fit: BoxFit.fill,
        ),
      ),
      const Body(
          text:
              'Companies take up Brand Blocking - for 𝗰𝗿𝗲𝗮𝘁𝗶𝗻𝗴 𝗱𝗶𝘀𝘁𝗶𝗻𝗰𝘁𝗶𝗼𝗻 by placing products together in 𝗯𝗹𝗼𝗰𝗸 𝗳𝗼𝗿𝗺𝗮𝘁𝗶𝗼𝗻 to enhance visibility'),
      const Body(
          text:
              'This strategy is very useful in the case of launching 𝗻𝗲𝘄 𝘃𝗮𝗿𝗶𝗮𝗻𝘁𝘀 𝗼𝗳 𝘀𝗮𝗺𝗲 𝗽𝗿𝗼𝗱𝘂𝗰𝘁.'),
      const SizedBox(),
    ],
    [
      const Heading(text: 'Visibility'),
      const Body(
          text: 'Visibility -> Primary & Secondary',
          bgColor: Color.fromARGB(255, 255, 224, 130)),
      ImageSlider(
        imageList: [
          "assets/images/module1/visiblity_1.png",
          "assets/images/module1/visiblity_2.png"
        ],
        height: 200,
        verticalPadding: 0,
      ),
      const SizedBox(),
      const BulletPoint(
          topPadding: 0,
          text:
              "We looked into how availability and visibility is important for better sales. "),
      const BulletPoint(
          text:
              "In addition to these – we should also be cognizant about the different types of visibility"),
      const BulletPoint(
          text:
              "They are broadly classified into 𝗣𝗿𝗶𝗺𝗮𝗿𝘆 𝗮𝗻𝗱 𝗦𝗲𝗰𝗼𝗻𝗱𝗮𝗿𝘆"),
      const BulletPoint(
          text:
              'Primary Visibility is when the product is kept along with the 𝗼𝘁𝗵𝗲𝗿 𝗽𝗿𝗼𝗱𝘂𝗰𝘁𝘀 𝗼𝗳 𝘁𝗵𝗲 𝘀𝗮𝗺𝗲 𝗰𝗮𝘁𝗲𝗴𝗼𝗿𝘆y '),
      const SubBulletPoint(
          text:
              'The decision for this depends on various factors including Market Share/How well the product sells.'),
      const SubBulletPoint(
          text:
              'Shopkeeper -> More interested in giving more shelf space to the products that are sold quickly. '),
      const BulletPoint(
          text:
              'Secondary Visibility -> if in case there is no space available, companies request for an additional space outside of the category presence to display their products'),
      const SizedBox(),
    ],
    [
      const Heading(text: 'Visibility & Shelf Space'),
      BodyImage(
        image: Image.asset(
          "assets/images/module1/shelf_space.png",
          fit: BoxFit.fill,
        ),
      ),
      // const SubHeading(text: 'Science behind Shelf utilization'),
      // const BulletPoint(text: 'Shelves can be divided in 4 various zones:'),
      // const SubBulletPoint(
      //     text: 'Bottom most zone - very low chances of visibility'),
      // const SubBulletPoint(text: 'Zone II - slightly higher chances'),
      // const SubBulletPoint(text: 'Golden Zone - best chances of visibility '),
      // const SubBulletPoint(
      //     text: 'Top most zone - slightly lesser as compared to Golden'),
      const BulletPoint(
          text:
              'For a shopkeeper -> he want to drive sales: at times he might place top selling products at eye-level'),
      const BulletPoint(
          text:
              'Other factors: Average height of an Indian -> 170 cm (Men), 155 cm (Women)'),
      const SizedBox(),
    ],
    [
      const QuizButton(),
    ]
    // [
    //   const Heading(text: "Shelf Analytics"),
    //   const SubHeading(text: 'References'),
    //   const BulletPoint(
    //       text:
    //           'FMCG Definition: An Overview of Fast Moving Consumer Goods (FMCG) of India, Rameshbhai G. Pawar1 , Dr. R. K. Dave2'),
    //   const BulletPoint(
    //       text:
    //           'Direct & Indirect Distribution: https://smallbusinessresources.wf.com/direct-vs-indirect-distribution-channels-whats-best-for-you/#:~:text=Direct%20distribution%20means%20you%20take,can%20sell%20on%20your%20behalf.'),
    //   const BulletPoint(text: 'Buying Decision - School of HTM'),
    //   const BulletPoint(text: 'Categories within FMCG - Ashok Chakra'),
    //   const BulletPoint(text: 'Low Involvement Products - Monarch University'),
    //   const BulletPoint(text: 'HIP and LIP - Study Point, YouTube'),
    //   const BulletPoint(text: 'Classification of Outlets - Nielsen'),
    //   const BulletPoint(text: 'KPIs in Merchandizing -  Corp'),
    //   const BulletPoint(text: 'Different types of Display - Pilotes'),
    //   const SizedBox(),
    // ],
  ],
];
