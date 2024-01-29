import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart';

class Header {
  const Header({
    required this.text,
    this.topPadding = 0,
    this.fontSize = 40,
    this.bottomPadding = 0,
    this.sidePadding = 0,
    this.textColor = const Color.fromARGB(255, 48, 48, 48),
    this.bgColor = Colors.transparent,
  });
  final String text;
  final Color textColor;
  final Color bgColor;
  final double topPadding;
  final double fontSize;
  final double sidePadding;
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
      this.weight = FontWeight.normal,
      this.align = TextAlign.start,
      this.fontSize = 16,
      this.bottomPadding = 10,
      this.textColor = const Color.fromARGB(255, 48, 48, 48),
      this.bgColor = Colors.transparent});
  final String text;
  final FontWeight weight;
  final Color textColor;
  final Color bgColor;
  final double fontSize;
  final TextAlign align;
  final double topPadding;
  final double bottomPadding;
}

class BulletPoint {
  const BulletPoint({
    this.weight = FontWeight.normal,
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
  final FontWeight weight;

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
      HeadImage(
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
        topPadding: 10,
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
      const Heading(
        text: 'HIP and LIP',
        fontSize: 32,
        topPadding: 20,
      ),
      const Heading(
          text: 'High Involvement (HIP):', fontSize: 16, topPadding: 20),
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
      Heading(
          text: 'Distribution and Decision Making ',
          bottomPadding: 10,
          topPadding: 20),
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
      Heading(text: 'Types of Distribution', bottomPadding: 30, topPadding: 20),
      BodyImage(image: Image.asset('assets/images/module1/pg8_1.png')),
      Body(text: 'Direct Distribution', align: TextAlign.center, topPadding: 5),
      BodyImage(
          image: Image.asset(
        'assets/images/module1/pg8_3.png',
        height: 350,
      )),
      Body(
          text: 'Indirect Distribution',
          align: TextAlign.center,
          topPadding: 5),
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
      HeadImage(
          image: Image.asset(
        'assets/images/module1/pg10.png',
        height: 400,
      ))
    ],
    [
      BodyImage(
        image: Image.asset(
          'assets/images/module1/pg11.png',
          height: 300,
        ),
      ),
      Body(
          align: TextAlign.center,
          text:
              'Nielsen is a global company that provides valuable insights into consumer behavior and marketing information by collecting data that measures what consumers watch and what they buy. This is how they classify outlets:'),
    ],
    [
      Heading(text: '1. Channel Selection', topPadding: 20, bottomPadding: 10),
      BodyImage(
        image: Image.asset(
          'assets/images/module1/pg12_1.png',
        ),
      ),
      Body(
        text:
            'Super Market: large shopping  store where customers choose their products which are organized systematically into sections',
      ),
      BodyImage(
          image: Image.asset(
        'assets/images/module1/pg12_2.png',
      )),
      Body(
          text:
              'Chemist: shop where medicines are sold, and where you can buy cosmetics and some household goods',
          topPadding: 10),
      SizedBox(),
    ],
    [
      BodyImage(
          image: Image.asset(
        'assets/images/module1/pg12_3.png',
      )),
      Body(
          text:
              'Hyper Market:  large retail establishments that are a culmination of departmental stores and supermarkets ',
          topPadding: 10),
      BodyImage(
          image: Image.asset(
        'assets/images/module1/pg12_4.png',
      )),
      Body(
          text:
              'Grocers: A store primarily focused on selling food and consumable products',
          topPadding: 10),
      SizedBox(),
    ],
    [
      BodyImage(
          image: Image.asset(
        'assets/images/module1/pg12_5.png',
      )),
      Body(
          text:
              'Paan Plus: Small scale Kirana store focused in selling small SKUs and ready to eat snacks',
          topPadding: 10),
      BodyImage(
          image: Image.asset(
        'assets/images/module1/pg12_6.png',
        width: 200,
      )),
      Body(
          text:
              'Cosmetics: A store primarily focused on selling personal care products ',
          topPadding: 10),
      SizedBox(),
    ],
    [
      Heading(text: 'Quality of distribution ', topPadding: 20),
      BulletPoint(
          text:
              'The weighted distribution is the percentage of points of sale where a product is available, assigning to each of them a weight proportional to their sales',
          topPadding: 10),
      BulletPoint(
          text:
              'Weighted distribution allows you to identify stores in a channel based on their weight in the sales of a category or a product.'),
      BodyImage(image: Image.asset('assets/images/module1/pg16.png')),
    ],
    [
      Header(
          topPadding: 20,
          text:
              'Numeric distribution is based on the number of outlets that carry a product – outlets that list at least one of the product’s stock-keeping units (SKUs)',
          bgColor: Colors.lightBlue,
          fontSize: 14),
      Header(
          topPadding: 10,
          text:
              'Weight of a store in WD = (total sales of the category in the store ÷ total sales of the category in all stores of the channel) × 100',
          bgColor: Colors.lightBlue,
          fontSize: 14),
      BulletPoint(
          text: 'If numerical distribution < weighted distribution: ',
          weight: FontWeight.bold,
          topPadding: 10,
          bottomPadding: 5),
      Body(
          topPadding: 0,
          text:
              'The product is present in fewer stores, but those stores have a greater impact on the business.'),
      BulletPoint(
          text: 'If numerical distribution > weighted distribution: ',
          bottomPadding: 5,
          weight: FontWeight.bold),
      Body(
          topPadding: 0,
          text:
              'The product is present in many stores, but not in the ones that are most important to the business.'),
    ],
    [
      Heading(text: '2. Retailer Satisfaction ', topPadding: 20),
      BulletPoint(
          text:
              'Not just distribution strategy, keeping the outlets satisfied is equally important for the betterment of sales',
          topPadding: 20,
          bottomPadding: 5),
      BulletPoint(
          text:
              'Hence, understanding the satisfaction levels of retailers that the distributors cater to is very important and this is done through channel satisfaction surveys'),
      BodyImage(image: Image.asset('assets/images/module1/pg17.png'))
    ],
    [
      Heading(text: '3.Market Coverage ', topPadding: 20),
      BodyImage(image: Image.asset('assets/images/module1/pg18.png')),
      Body(
          text:
              'Determine the optimal level of market coverage. This involves decisions on whether to focus on specific regions, urban or rural areas, or target a broad national or international market.',
          topPadding: 10)
    ],
    [
      Heading(text: 'Ansoff Matrix', topPadding: 20),
      BodyImage(
          image: Image.asset(
        'assets/images/module1/pg19.png',
      )),
      Body(
          text:
              'The Ansoff Matrix is a strategic tool that categorizes growth strategies into four quadrants: Market Penetration (selling existing products in existing markets), Market Development (introducing existing products to new markets), Product Development (creating and launching new products in existing markets), and Diversification (entering new markets with new products). It helps businesses assess and choose growth strategies based on their current product and market situations.')
    ],
    [
      Heading(
          text: '4. Distribution Network Design:',
          topPadding: 20,
          bottomPadding: 0),
      BodyImage(image: Image.asset('assets/images/module1/pg20.png')),
      Body(
          text:
              'Design an efficient distribution network that minimizes transportation costs and ensures timely product delivery. Consider factors such as the number and location of warehouses, distribution centers, and transportation routes.',
          topPadding: 15),
    ],
    [
      Heading(text: '5. Route Planning', topPadding: 20),
      BodyImage(
          image: Image.asset(
        'assets/images/module1/pg21.png',
      )),
      Body(
          text:
              'Plan distribution routes to optimize delivery schedules and minimize transportation costs. ')
    ],
    [
      Heading(text: '6. Merchandizing', topPadding: 20),
      BodyImage(image: Image.asset('assets/images/module1/pg22.png')),
      Body(
          text:
              'Promotion of the sale of goods that can employ pricing, special offer, display, & other techniques '),
      Body(
          text: 'Types of Merchandising :',
          topPadding: 20,
          fontSize: 16,
          weight: FontWeight.bold),
      Body(
          text:
              'POSM is an acronym for Point of Sale Marketing or Point of Sale Materials and is used by brands to convey their message or communicate information to the consumers at the point of sale. BTL marketing focuses and targets a specific segment of people- for instance, dropping leaflets in a particular area or putting up a banner at the bus stop.')
    ],
    [
      Heading(text: 'POP', topPadding: 20),
      BodyImage(
          image: Image.asset(
        'assets/images/module1/pg24.png',
        height: 250,
      )),
      Body(
          topPadding: 5,
          text:
              'POP, ie. Point of Purchase is anything that the customers interact with while deciding whether to buy the product or not. When brands place their products in the stores, in the aisles, on the shelves that customers use to choose what they want to buy- it is the Point of Purchase, whereas POS, ie. Point of Sales means the place where the transaction/ sale occurs- the cash counter or the checkout area at the retail store.')
    ],
    [
      Heading(text: 'POS', topPadding: 20),
      BodyImage(
          image: Image.asset(
        'assets/images/module1/pg25.png',
        height: 250,
      )),
      Body(
          topPadding: 5,
          text:
              'POS (Point of Sale) refers to interactions between the product and customer. These interactions could be at the time of transactions and exit. Remember the chocolate, mint, and candy shelves placed around the billing counter? Well! These same candies are available in the chocolate and munchies section of the store (POP). But putting a few pieces of the candies right before the exit is a part of the brand’s marketing strategy incorporated in a robust system at the store. ')
    ],
  ],
];
