import 'package:flutter/material.dart';

var width;

class Heading {
  const Heading({
    required this.text,
    this.topPadding = 20,
    this.bottomPadding = 0,
  });
  final String text;
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

class SubBulletPoint {
  const SubBulletPoint({
    required this.text,
    this.topPadding = 0,
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

  Widget build(BuildContext context) {
    // Get the screen width using MediaQuery
    double screenWidth = MediaQuery.of(context).size.width;
    width = screenWidth;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: SizedBox(
        width: screenWidth - 100, // Adjust as needed
        child: image,
      ),
    );
  }
}

class TabularColumn {
  final List<List<String>> data;
  final TextStyle headerTextStyle;
  final TextStyle cellTextStyle;

  const TabularColumn({
    required this.data,
    this.headerTextStyle = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
    this.cellTextStyle = const TextStyle(
      fontSize: 16,
    ),
  });
}

class QuizButton {
  const QuizButton({
    this.topPadding = 10,
  });
  final double topPadding;
}

final List moduleTitle = [
  "Shelf Analytics",
  "Title 2",
  "Title 3",
];

final List module = [
  [
    [
      ImageContent(
        image: Image.asset(
          "assets/images/sample/sample_2.png",
          width: double.infinity,
          fit: BoxFit.fitWidth,
        ),
      ),
      const Heading(text: "Shelf Analytics"),
      const SubHeading(text: "FMCG and FMCD"),
      const Body(
        text:
            "FMCG -> Fast Moving Consumer Goods	\nFMCD -> Fast Moving Consumer Durables",
      ),
      const TabularColumn(
        data: [
          [
            'FMCG',
            'FMCD',
          ],
          [
            'Personal Care products , Shampoo, Face Wash, Soap etc',
            'Automobile , Cars, Bikes, Trucks etc'
          ],
          [
            'Packaged Food & Beverages , Chips, Juices, Carbonated drinks etc',
            'Household appliances , Washing Machine, Iron, Oven, Vacuum Cleaner etc'
          ],
          [
            'Laundry , Detergent etc \nOver the counter Medicines',
            'Electronic gadgets , Smart Phones, Laptops etc'
          ],
        ],
      ),
      const SubHeading(
        text: "Examples of FMCG",
      ),
      ImageContent(
        image: Image.asset(
          "assets/images/module1/fmcg_eg.png",
          //fit: BoxFit.fitWidth,
          width: width,
        ),
      ),
      const SubHeading(
        text: "Examples of FMCD",
      ),
      ImageContent(
        image: Image.asset(
          "assets/images/module1/fmcd_eg.png",
          //fit: BoxFit.fitWidth,
          width: width,
        ),
      ),
      const Body(
        text:
            "As per ICRA the term FMCG has been defined to include products that are consumed at least once a month, sold under the national brands in consumer packages, sold through a wide spared distribution network and consumed directly by the consumers.",
      ),
      const Body(
        text:
            "The main difference between the two is that FMCG products are consumable while FMCD products are non-durable and have a longer usage period. They also differ basis the buying decision. ",
      ),
      const SizedBox()
    ],
    [
      const Heading(text: "Shelf Analytics"),
      const SubHeading(text: "Buying Decision in context of FMCG and FMCD"),
      const BulletPoint(
          text:
              'Consumer buying decision is a black box - but it starts with need identification - but differs basis the type of product'),
      const BulletPoint(text: 'Basis the same, products can be classified as'),
      const SubBulletPoint(
          text:
              'Low Involvement (LIP): products which are bought frequently and with a minimum of thought and effort'),
      const SubBulletPoint(
          text:
              'High Involvement (HIP): products for which the buyer is prepared to spend considerable time and effort in searching.'),
      const BulletPoint(
          text:
              'Generally, LIP -> FMCG products, while HIP -> Durable & Luxury products'),
      const BulletPoint(
          text:
              'This is applicable across various categories in the FMCG space'),
      ImageContent(
        image: Image.asset(
          "assets/images/module1/buying_decisions.png",
          //fit: BoxFit.fitWidth,
          width: 300,
          height: 300,
        ),
      ),
      const SubHeading(text: 'Types of Buying Decisions'),
      ImageContent(
        image: Image.asset(
          "assets/images/module1/buying_decisions_types.jpg",
          fit: BoxFit.fitWidth,
          //width: 100,
        ),
      ),
      const SizedBox()
    ],
    [
      const Heading(text: "Shelf Analytics"),
      const SubHeading(text: 'Categories within FMCG'),
      const BulletPoint(text: 'CavinKare -> FMCG company.'),
      const BulletPoint(
          text:
              'Getting the products from such categories is done via Distribution '),
      ImageContent(
        image: Image.asset(
          "assets/images/module1/fmcg_categories.png",
          fit: BoxFit.fill,
          // width: 100,
          // height: 300,
        ),
      ),
      const SubHeading(text: 'Distribution'),
      const BulletPoint(
          text:
              'Activity of selling products from manufacturers to the consumers'),
      const BulletPoint(
          text:
              'Two types ->  Direct and Indirect Distribution (Majority of the FMCG entities follow Indirect Distribution '),
      const SubHeading(text: 'Direct Distribution'),
      ImageContent(
        image: Image.asset(
          'assets/images/module1/direct_distribution.png',
          fit: BoxFit.fill,
        ),
      ),
      const BulletPoint(text: 'Pros'),
      const SubBulletPoint(
          text:
              'You have total control over how the product is marketed and sold'),
      const SubBulletPoint(
          text: 'No fighting with competitors for shelf space at retailers.'),
      const BulletPoint(text: 'Cons'),
      const SubBulletPoint(
          text: 'More time-consuming and expensive for some business owners'),
      const SubBulletPoint(text: 'Limited market coverage.'),
      const SubHeading(text: 'Indirect Distribution'),
      ImageContent(
        image: Image.asset(
          'assets/images/module1/indirect_distribution.png',
          fit: BoxFit.fill,
        ),
      ),
      const BulletPoint(text: 'Pros'),
      const SubBulletPoint(
          text:
              'Distribution agents specialize in getting products into as many markets as possible'),
      const SubBulletPoint(
          text:
              'Retailers know their local markets and how best to sell your product there'),
      const BulletPoint(text: 'Cons'),
      const SubBulletPoint(
          text: 'Distribution agents and retailers will share in your profits'),
      const SubBulletPoint(
          text:
              'Retailers may sell your competitors’ products alongside yours.'),
      const SizedBox()
    ],
    [
      const Heading(text: "Shelf Analytics"),
      const SubHeading(text: 'Importance of Distribution'),
      const BulletPoint(
          text: 'The right distribution strategy is key for better sales'),
      const BulletPoint(
          text:
              'Your product should be available + visible to the consumers if they are to make a purchase '),
      ImageContent(
        image: Image.asset(
          "assets/images/module1/importance_of_distribution.png",
          fit: BoxFit.fill,
          // width: 100,
          // height: 300,
        ),
      ),
      const BulletPoint(
          text:
              'Case 1 -> Product A & B available, but only Product A is visible. Product A has higher chances of getting sold'),
      const BulletPoint(
          text:
              'Case 2 -> Product A is available but not visible. Product B is not available. Product A has slightly lower chances of getting sold (solely due to availability)'),
      const BulletPoint(
          text:
              'Case 3 -> Product B is available and visible. Product B has higher chances of getting sold'),
      const BulletPoint(
          text: 'Outlet type is also another key factor for better sales.'),
      const BulletPoint(
          text:
              'There are various types of outlets -> which we will be covering in the next set of slides'),
      ImageContent(
        image: Image.asset(
          "assets/images/module1/shampoo.png",
          fit: BoxFit.fill,
        ),
      ),
      const SizedBox()
    ],
    [
      const Heading(text: "Shelf Analytics"),
      const SubHeading(text: 'Classification of Outlets'),
      ImageContent(
        image: Image.asset(
          "assets/images/module1/class_of_outlets.png",
          fit: BoxFit.fill,
        ),
      ),
      const BulletPoint(
          text:
              'Grocers: A store primarily focused on selling food and consumable products.'),
      const BulletPoint(
          text:
              'Chemist: shop where drugs and medicines are sold or given out, and where you can buy cosmetics and some household goods'),
      const BulletPoint(
          text: 'Cosmetics: shop where personal care products are sold'),
      const BulletPoint(
          text:
              'Paan Plus: small scale Kirana store focussed in selling small SKUs and ready to eat snacks'),
      const BulletPoint(
          text:
              'Super Market: large shopping store where customers choose their products which are organized systematically into sections'),
      const BulletPoint(
          text:
              'Hyper Market:  large retail establishments that are a culmination of departmental stores and supermarkets '),
      const SizedBox()
    ],
    [
      const Heading(text: "Shelf Analytics"),
      const SubHeading(text: 'Channel Satisfaction'),
      const BulletPoint(
          text:
              'Understanding the satisfaction levels of retailers that the distributors cater to'),
      const BulletPoint(
          text:
              'Need: To understand retailer priorities -> what is it that matters the most to them:'),
      const SubBulletPoint(text: 'Sales/Profit Margins/Customer Satisfaction '),
      const SubBulletPoint(
          text: 'This will also help in getting premium shelf space'),
      ImageContent(
        image: Image.asset(
          "assets/images/module1/channel_satisfaction.png",
          fit: BoxFit.fill,
        ),
      ),
      const SubHeading(
          text: 'Some factors that affect the satisfaction level:'),
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
      const Heading(text: "Shelf Analytics"),
      const SubHeading(text: 'Merchandizing'),
      const BulletPoint(
          text:
              'Merchandizing -> promotion of the sale of goods that can employ pricing, special offer, display, & other techniques '),
      const SubHeading(text: 'Importance of Merchandizing'),
      const Body(
          text:
              '1. Enhanced visibility of the product \n 2.Improved shopping experience \n3.Increased sales \n4.Competitive advantage'),
      const SubHeading(text: 'Different strategies for Merchandizing'),
      ImageContent(
        image: Image.asset(
          "assets/images/module1/merchandizing.png",
          fit: BoxFit.fill,
        ),
      ),
      const SizedBox()
    ],
    [
      const Heading(text: "Shelf Analytics"),
      const SubHeading(text: 'Important KPIs in Merchandizing'),
      const BulletPoint(
          text:
              'Merchandizing -> promotion of the sale of goods that can employ pricing, special offer, display, & other techniques '),
      const BulletPoint(text: 'Sales per square foot'),
      const BulletPoint(text: 'Out of stock rate'),
      const BulletPoint(text: 'Stock-to-sales ratio'),
      const BulletPoint(
          text:
              'SKU level Data Tracking for - availability and Out of Stock scenarios'),
      const BulletPoint(text: 'Visibility Share by Brand / SKUs'),
      const BulletPoint(text: 'Contribution of Category in-store/s'),
      const BulletPoint(text: 'Share of Display Unit/s'),
      const BulletPoint(
          text: 'Share on Featured Creatures@ PoSMs (Leaflet / Flyers)'),
      const BulletPoint(text: 'Eye Level (Above-Eye Level-Below Eye Level)'),
      const BulletPoint(
          text: 'Share of Shelf (Unit Dimensionacquired by brand)'),
      const BulletPoint(text: 'Classificationof Displays (FSUs, Hangers etc.)'),
      const BulletPoint(text: 'Brand Logo - impression% in category'),
      const BulletPoint(
          text: 'Coordinate on the Shelf (Left to Right / Top to Bottom)'),
      const BulletPoint(text: 'Color (Brand Block) in-store'),
      const BulletPoint(
          text: 'Brand Alignment and Arrangement checks i.e. Planogram'),
      const BulletPoint(text: 'Category x sub-category level tracking'),
      const SizedBox()
    ],
    [
      const Heading(text: "Shelf Analytics"),
      const SubHeading(text: 'Importance of Display Merchandize'),
      const BulletPoint(text: 'Display of product information makes easy to:'),
      const SubBulletPoint(text: 'Introduce'),
      const SubBulletPoint(text: 'Explain'),
      const SubBulletPoint(text: 'Show'),
      const SubBulletPoint(text: 'Sell'),
      const BulletPoint(
          text:
              'Display also helps the shopper in making it easier for them to self select'),
      const BulletPoint(
          text:
              'Not just for the product, effective display helps establish, promote & enhance the store’s visual image '),
      const BulletPoint(text: 'Different types of Display:'),
      const SubBulletPoint(text: 'Floor Stand'),
      const SubBulletPoint(text: 'Showcase'),
      const SubBulletPoint(text: 'End cap unit'),
      const SubBulletPoint(text: 'Checkout display'),
      const SubBulletPoint(text: 'Digital Pop display'),
      ImageContent(
        image: Image.asset(
          "assets/images/module1/display_imp_1.png",
          width: double.infinity,
          fit: BoxFit.fill,
        ),
      ),
      ImageContent(
        image: Image.asset(
          "assets/images/module1/display_imp_2.png",
          fit: BoxFit.fill,
        ),
      ),
      const BulletPoint(
          text:
              'Display is majorly classified into two on the basis of its purpose:'),
      const SubBulletPoint(text: 'Point of Sale Display'),
      const SubBulletPoint(text: 'Point of Purchase Display'),
      const SizedBox()
    ],
    [
      const Heading(text: "Shelf Analytics"),
      const SubHeading(text: 'POP & POS Display'),
      const TabularColumn(data: [
        ['POP', 'POS'],
        ['POP - Point of Purchase', 'POS - Point of Sale'],
        [
          'Point of Purchase Display is used to capture the attention of shopper',
          'Point of Sale Display is used to influence a shopper’s decision'
        ],
        [
          'It can be placed anywhere in the store',
          'It is present only in specific spaces'
        ],
        [
          'Usually placed next to the space of the same category.',
          'Ideally away from the category'
        ],
        [
          'Offers flexibility in targeting different groups',
          'It is targeted to influence a specific group'
        ],
        [
          'Suitable for a wide variety of products',
          'Best for individually packaged items like food & confectioneries'
        ]
      ]),
      const SubHeading(text: 'POP Display'),
      ImageContent(
        image: Image.asset(
          "assets/images/module1/POP.png",
          fit: BoxFit.fill,
        ),
      ),
      const SubHeading(text: 'POS Display'),
      ImageContent(
        image: Image.asset(
          "assets/images/module1/POS.png",
          fit: BoxFit.fill,
        ),
      ),
      const SizedBox(),
    ],
    [
      const Heading(text: "Shelf Analytics"),
      const SubHeading(text: 'Brand Blocking & POSM (Example)'),
      ImageContent(
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
      const Heading(text: "Shelf Analytics"),
      const SubHeading(
          text:
              'Case Study: Merchandizing & Shelf Space Analytics (Store Design) '),
      ImageContent(
        image: Image.asset(
          "assets/images/module1/case_1.png",
          fit: BoxFit.fill,
        ),
      ),
      ImageContent(
        image: Image.asset(
          "assets/images/module1/case_2.png",
          fit: BoxFit.fill,
        ),
      ),
      ImageContent(
        image: Image.asset(
          "assets/images/module1/case_3.png",
          fit: BoxFit.fill,
        ),
      ),
      const BulletPoint(
          text: 'Effective store design with the help of Image analytics'),
      const BulletPoint(
          text:
              'The picture of the retail environment captured and then loaded in the merchandizing measurement unit '),
      const BulletPoint(
          text:
              'Post which -> Category/Brand Share, and Placement Check being done.'),
      const SizedBox(),
    ],
    [
      const Heading(text: "Shelf Analytics"),
      const SubHeading(text: 'Visibility & some examples'),
      const Body(text: 'Visibility -> Primary & Secondary'),
      ImageContent(
        image: Image.asset(
          "assets/images/module1/visiblity_1.png",
          fit: BoxFit.fill,
        ),
      ),
      const SizedBox(),
      ImageContent(
        image: Image.asset(
          "assets/images/module1/visiblity_2.png",
          fit: BoxFit.fill,
        ),
      ),
      const SizedBox(),
      ImageContent(
        image: Image.asset(
          "assets/images/module1/visiblity_3.png",
          fit: BoxFit.fill,
        ),
      ),
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
      const Heading(text: "Shelf Analytics"),
      const SubHeading(text: 'Visibility & Shelf Space'),
      ImageContent(
        image: Image.asset(
          "assets/images/module1/shelf_space.png",
          fit: BoxFit.fill,
        ),
      ),
      const SubHeading(text: 'Science behind Shelf utilization'),
      const BulletPoint(text: 'Shelves can be divided in 4 various zones:'),
      const SubBulletPoint(
          text: 'Bottom most zone - very low chances of visibility'),
      const SubBulletPoint(text: 'Zone II - slightly higher chances'),
      const SubBulletPoint(text: 'Golden Zone - best chances of visibility '),
      const SubBulletPoint(
          text: 'Top most zone - slightly lesser as compared to Golden'),
      const BulletPoint(
          text:
              'For a shopkeeper -> he want to drive sales: at times he might place top selling products at eye-level'),
      const BulletPoint(
          text:
              'Other factors: Average height of an Indian -> 170 cm (Men), 155 cm (Women)'),
      const SizedBox(),
    ],
    [
      const Heading(text: "Shelf Analytics"),
      const SubHeading(text: 'References'),
      const BulletPoint(
          text:
              'FMCG Definition: An Overview of Fast Moving Consumer Goods (FMCG) of India, Rameshbhai G. Pawar1 , Dr. R. K. Dave2'),
      const BulletPoint(
          text:
              'Direct & Indirect Distribution: https://smallbusinessresources.wf.com/direct-vs-indirect-distribution-channels-whats-best-for-you/#:~:text=Direct%20distribution%20means%20you%20take,can%20sell%20on%20your%20behalf.'),
      const BulletPoint(text: 'Buying Decision - School of HTM'),
      const BulletPoint(text: 'Categories within FMCG - Ashok Chakra'),
      const BulletPoint(text: 'Low Involvement Products - Monarch University'),
      const BulletPoint(text: 'HIP and LIP - Study Point, YouTube'),
      const BulletPoint(text: 'Classification of Outlets - Nielsen'),
      const BulletPoint(text: 'KPIs in Merchandizing -  Corp'),
      const BulletPoint(text: 'Different types of Display - Pilotes'),
      const QuizButton(),
      const SizedBox(),
    ],
  ],
  [
    [
      ImageContent(
        image: Image.asset(
          "assets/images/sample/sample_2.png",
          width: double.infinity,
          fit: BoxFit.fitWidth,
        ),
      ),
      const Heading(text: "Module 2222"),
      const SubHeading(text: "FMCG and FMCD"),
      const Body(
        text:
            "FMCG -> Fast Moving Consumer Goods	\nFMCD -> Fast Moving Consumer Durables",
      ),
      const TabularColumn(
        data: [
          [
            'FMCG',
            'FMCD',
          ],
          [
            'Personal Care products , Shampoo, Face Wash, Soap etc',
            'Automobile , Cars, Bikes, Trucks etc'
          ],
          [
            'Packaged Food & Beverages , Chips, Juices, Carbonated drinks etc',
            'Household appliances , Washing Machine, Iron, Oven, Vacuum Cleaner etc'
          ],
          [
            'Laundry , Detergent etc \nOver the counter Medicines',
            'Electronic gadgets , Smart Phones, Laptops etc'
          ],
        ],
      ),
      const SubHeading(
        text: "Examples of FMCG",
      ),
      ImageContent(
        image: Image.asset(
          "assets/images/sample/sample_2.png",
          fit: BoxFit.fitWidth,
          width: 100,
        ),
      ),
      const SubHeading(
        text: "Examples of FMCD",
      ),
      ImageContent(
        image: Image.asset(
          "assets/images/module1/fmcd_eg.png",
          fit: BoxFit.fitWidth,
          width: 100,
        ),
      ),
      const Body(
        text:
            "As per ICRA the term FMCG has been defined to include products that are consumed at least once a month, sold under the national brands in consumer packages, sold through a wide spared distribution network and consumed directly by the consumers.",
      ),
      const Body(
        text:
            "The main difference between the two is that FMCG products are consumable while FMCD products are non-durable and have a longer usage period. They also differ basis the buying decision. ",
      ),
      const SizedBox()
    ],
    [
      const Heading(text: "Shelf Analytics"),
      const SubHeading(text: "Buying Decision in context of FMCG and FMCD"),
      const BulletPoint(
          text:
              'Consumer buying decision is a black box - but it starts with need identification - but differs basis the type of product'),
      const BulletPoint(text: 'Basis the same, products can be classified as'),
      const SubBulletPoint(
          text:
              'Low Involvement (LIP): products which are bought frequently and with a minimum of thought and effort'),
      const SubBulletPoint(
          text:
              'High Involvement (HIP): products for which the buyer is prepared to spend considerable time and effort in searching.'),
      const BulletPoint(
          text:
              'Generally, LIP -> FMCG products, while HIP -> Durable & Luxury products'),
      const BulletPoint(
          text:
              'This is applicable across various categories in the FMCG space'),
      ImageContent(
        image: Image.asset(
          "assets/images/module1/buying_decisions.png",
          fit: BoxFit.fitWidth,
          width: 100,
        ),
      ),
      const SubHeading(text: 'Types of Buying Decisions'),
      ImageContent(
        image: Image.asset(
          "assets/images/module1/buying_decisions_types.png",
          fit: BoxFit.fitWidth,
          width: 100,
        ),
      ),
      const SizedBox()
    ],
    [
      const Heading(text: "Shelf Analytics"),
      const BulletPoint(text: 'CavinKare -> FMCG company.'),
      const BulletPoint(
          text:
              'Getting the products from such categories is done via Distribution '),
      ImageContent(
        image: Image.asset(
          "assets/images/module1/buying_decision_types.png",
          fit: BoxFit.fitWidth,
          //width: 100,
        ),
      ),
      const QuizButton(),

      const SizedBox()
    ],
  ],
];
