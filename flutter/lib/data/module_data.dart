import 'package:flutter/material.dart';

class Heading {
  const Heading({
    required this.text,
    this.topPadding = 20,
    this.bottomPadding = 0,
    this.textColor = const Color.fromARGB(255, 48, 48, 48),
    this.bgColor = Colors.transparent,
  });
  final String text;
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
      this.bottomPadding = 10,
      this.textColor = const Color.fromARGB(255, 48, 48, 48),
      this.bgColor = Colors.transparent});
  final String text;
  final Color textColor;
  final Color bgColor;

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
      this.bottomPadding = 10,
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
      backgroundColor: Colors.yellow,
    ),
    this.cellTextStyle = const TextStyle(
      fontSize: 14,
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
      HeadImage(
        image: Image.asset(
          "assets/images/module1/FMCG and FMCD.png",
          fit: BoxFit.fitWidth,
        ),
      ),
      const Boxes(data: [
        "Productive Display",
        "Store design",
        "Free Product sample",
        "Discount and coupons",
        "Point of sale"
      ]),
      const Heading(
        text: "FMCG and FMCD Industry",
      ),
      const SubHeading(
        text: "FMCG -> Fast Moving Consumer Goods",
        bgColor: Color.fromARGB(255, 255, 224, 130),
      ),
      const BulletPoint(text: "Products that are: "),
      const SubBulletPoint(
          text: "consumed 𝗮𝘁 𝗹𝗲𝗮𝘀𝘁 𝗼𝗻𝗰𝗲 𝗮 𝗺𝗼𝗻𝘁𝗵"),
      const SubBulletPoint(text: "sold under the  in consumer packages"),
      const SubBulletPoint(
          text:
              "sold through a wide spared 𝗱𝗶𝘀𝘁𝗿𝗶𝗯𝘂𝘁𝗶𝗼𝗻 𝗻𝗲𝘁𝘄𝗼𝗿𝗸"),
      const SubBulletPoint(
          text: "consumed 𝗱𝗶𝗿𝗲𝗰𝘁𝗹𝘆 𝗯𝘆 𝘁𝗵𝗲 𝗰𝗼𝗻𝘀𝘂𝗺𝗲𝗿𝘀."),
      const SubHeading(
        text: "FMCD -> Fast Moving Consumer Durables",
        bgColor: Color.fromARGB(255, 255, 224, 130),
      ),
      const BulletPoint(
          text:
              "Products that are 𝗻𝗼𝗻-𝗱𝘂𝗿𝗮𝗯𝗹𝗲 and have a 𝗹𝗼𝗻𝗴𝗲𝗿 𝘂𝘀𝗮𝗴𝗲 𝗽𝗲𝗿𝗶𝗼𝗱. They also differ basis the buying decision."),
      const SizedBox()
    ],
    [
      const Heading(text: "Some Examples of FMCG and FMCD"),
      const SubHeading(text: "FMCG", bottomPadding: 0),
      ImageSlider(
        imageList: [
          'assets/images/module1/eg1.png',
          'assets/images/module1/eg2.png',
          'assets/images/module1/eg3.png',
          'assets/images/module1/eg4.png',
        ],
        height: 100,
        verticalPadding: 10,
      ),
      const SubHeading(text: "FMCD", bottomPadding: 0, topPadding: 0),
      ImageSlider(
        imageList: [
          'assets/images/module1/eg5.png',
          'assets/images/module1/eg6.png',
          'assets/images/module1/eg7.png',
          'assets/images/module1/eg8.png',
        ],
        height: 100,
        verticalPadding: 10,
      ),
      const SizedBox()
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
              'Not just distribution strategy, keeping the outlets satisfied is equally important for the betterment of sales'),
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
      const BulletPoint(text: 'Margin provided on the product'),
      const BulletPoint(
          text:
              'Credit given to the outlet -> loan made between company and the retailer'),
      const BulletPoint(
          text:
              'Damages/Returns -> Damaged goods returned back to company at no additional cost + returns'),
      const BulletPoint(
          text:
              'Fill rate -> percentage of customer orders that are immediately fulfilled by available stock. Also known as demand satisfaction rate'),
      const BulletPoint(text: 'Stable market rates'),
      const SizedBox()
    ],
    [
      const Heading(text: 'Merchandizing'),
      const BulletPoint(
          text:
              'Merchandizing -> promotion of the sale of goods that can employ pricing, special offer, display, & other techniques '),
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
        text: 'Introduce',
        bgColor: Color.fromARGB(255, 255, 224, 130),
      ),
      const SubBulletPoint(
        text: 'Explain',
        bgColor: Color.fromARGB(255, 255, 224, 130),
      ),
      const SubBulletPoint(
        text: 'Show',
        bgColor: Color.fromARGB(255, 255, 224, 130),
      ),
      const SubBulletPoint(
        text: 'Sell',
        bgColor: Color.fromARGB(255, 255, 224, 130),
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
        text: 'Floor Stand',
        bgColor: Color.fromARGB(255, 255, 224, 130),
      ),
      const SubBulletPoint(
        text: 'Showcase',
        bgColor: Color.fromARGB(255, 255, 224, 130),
      ),
      const SubBulletPoint(
        text: 'End cap unit',
        bgColor: Color.fromARGB(255, 255, 224, 130),
      ),
      const SubBulletPoint(
        text: 'Checkout display',
        bgColor: Color.fromARGB(255, 255, 224, 130),
      ),
      const SubBulletPoint(
        text: 'Digital Pop display',
        bgColor: Color.fromARGB(255, 255, 224, 130),
      ),
      const BulletPoint(
          text:
              'Display is majorly classified into two on the basis of its purpose:'),
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
              "Point of Sale Display is used to influence a shopper’s decision"),
      const BulletPoint(text: "It is present only in specific spaces"),
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
              "Point of Purchase Display is used to capture the attention of shopper"),
      const BulletPoint(text: "It can be placed anywhere in the store"),
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
              'Companies take up Brand Blocking - for creating distinction by placing products together in block formation to enhance visibility'),
      const Body(
          text:
              'This strategy is very useful in the case of launching new variants of same product.'),
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
          text: "They are broadly classified into Primary and Secondary"),
      const BulletPoint(
          text:
              'Primary Visibility is when the product is kept along with the other products of the same category '),
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
