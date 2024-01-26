import 'package:flutter/material.dart';
import 'package:http/http.dart';

var width;

class Heading {
  const Heading(
      {required this.text,
      this.topPadding = 20,
      this.bottomPadding = 0,
      this.textColor = Colors.black});
  final String text;
  final Color textColor;
  final double topPadding;
  final double bottomPadding;
}

class SubHeading {
  const SubHeading(
      {required this.text,
      this.topPadding = 20,
      this.bottomPadding = 5,
      this.textColor = Colors.black});
  final String text;
  final double topPadding;
  final Color textColor;

  final double bottomPadding;
}

class Body {
  const Body(
      {required this.text,
      this.topPadding = 10,
      this.bottomPadding = 10,
      this.textColor = Colors.black});
  final String text;
  final Color textColor;

  final double topPadding;
  final double bottomPadding;
}

class BulletPoint {
  const BulletPoint(
      {required this.text,
      this.topPadding = 10,
      this.bottomPadding = 10,
      this.textColor = Colors.black});
  final String text;
  final double topPadding;
  final Color textColor;

  final double bottomPadding;
}

class SubBulletPoint {
  const SubBulletPoint(
      {required this.text,
      this.topPadding = 0,
      this.bottomPadding = 10,
      this.leftPadding = 20,
      this.textColor = Colors.black});
  final String text;
  final double topPadding;
  final Color textColor;
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
      const Heading(text: "FMCG and FMCD Industry"),
      const SubHeading(text: "FMCG -> Fast Moving Consumer Goods"),
      BulletPoint(text: "Products that are: "),
      SubBulletPoint(text: "consumed at least once a month"),
      SubBulletPoint(
          text: "sold under the national brands in consumer packages"),
      SubBulletPoint(text: "sold through a wide spared distribution network"),
      SubBulletPoint(text: "consumed directly by the consumers."),
      const SubHeading(text: "FMCD -> Fast Moving Consumer Durables"),
      BulletPoint(
          text:
              "Products that are non-durable and have a longer usage period. They also differ basis the buying decision.  "),
      const SizedBox()
    ],
    [
      Heading(text: "Some Examples of FMCG and FMCD"),
      SubHeading(text: "FMCG", bottomPadding: 0),
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
      SubHeading(text: "FMCD", bottomPadding: 0, topPadding: 0),
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
      SubHeading(text: "Companies"),
      BulletPoint(text: "FMCG: Unilever, P&G, ITC, CavinKare, General Mills"),
      BulletPoint(text: "FMCD: HP, Whirlpool, Voltas, Philips, Hitachi"),
      SubHeading(text: "Products"),
      BulletPoint(text: "FMCG"),
      SubBulletPoint(
          text: "Personal Care products -> Shampoo, Face Wash, Soap etc"),
      SubBulletPoint(
          text:
              "Packaged Food & Beverages  Chips, Juices, Carbonated drinks etc"),
      SubBulletPoint(text: "Laundry  Detergent etc"),
      BulletPoint(text: "FMCD"),
      SubBulletPoint(text: "Automobile  Cars, Bikes, Trucks etc"),
      SubBulletPoint(
          text:
              "Household appliances  Washing Machine, Iron, Oven, Vacuum Cleaner etc"),
      SubBulletPoint(text: "Electronic gadgets  Smart Phones, Laptops etc"),
      const SizedBox()
    ],
    [
      const Heading(text: "Buying Decision"),
      BodyImage(
          image: Image.asset("assets/images/module1/buying_decision.png")),
      BulletPoint(
          text:
              "While FMCG and FMCD companies will have products to sell, but how a person ends up buying is still a blackbox"),
      BulletPoint(
          text:
              "We do NOT know what all went into purchasing a particular product."),
      BulletPoint(text: "However, in general it consists of 6 steps:"),
      SubBulletPoint(text: "Need recognition"),
      SubBulletPoint(text: "Information search"),
      SubBulletPoint(text: "Alternative evaluation"),
      SubBulletPoint(text: "Purchase decision"),
      SubBulletPoint(text: "Completing the purchase"),
      SubBulletPoint(text: "Post purchase evaluation"),
      //
      const SizedBox()
    ],
    [
      const Heading(text: "Buying Decision in context of FMCG and FMCD"),
      SubHeading(text: "Types of buying decision"),
      BodyImage(
        image: Image.asset(
          "assets/images/module1/buying_decisions_types.png",
          //fit: BoxFit.fitWidth,
          width: 300,
          height: 300,
        ),
      ),
      BulletPoint(
          text:
              "Steps involved in decision making would also depend on the type of product"),
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
      const SizedBox(),
    ],
    [
      Heading(text: "Low Involvement & High Involvement Purchase"),
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
      const BulletPoint(text: "CavinKare is an FMCG company."),
      const BulletPoint(
          text:
              "Process of selling products under any category requires distribution – which we will see it in the next slide"),
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
              'Activity of selling products from manufacturers to the consumers'),
      const BulletPoint(
          text:
              'Two types ->  Direct and Indirect Distribution (Majority of the FMCG entities follow Indirect Distribution '),
      const SubHeading(text: 'Direct Distribution'),
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
      const SizedBox()
    ],
    [
      const SubHeading(text: 'Indirect Distribution'),
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
      Heading(text: "Direct & Indirect Distribution - Schematics"),
      BodyImage(
        image: Image.asset(
          'assets/images/module1/direct_distribution.png',
          fit: BoxFit.fill,
        ),
      ),
      BodyImage(
        image: Image.asset(
          'assets/images/module1/indirect_distribution.png',
          fit: BoxFit.fill,
        ),
      ),
      const SizedBox()
    ],
    [
      const Heading(text: 'Importance of Distribution'),
      const BulletPoint(
          text:
              'For a product to be sold – it should be available and visible'),
      BodyImage(
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
      const SizedBox()
    ],
    [
      Heading(text: "Importance of Distribution"),
      const BulletPoint(
          text:
              'Being just available is not enough  it should be available in the right places/outlets'),
      const BulletPoint(
          text:
              'An example of proper distribution is placing products where there has been consistent sales historically.'),
      SubBulletPoint(
          text:
              "If Chik is best sold in UP, it makes sense to have a good distribution system than entering a market where the penetration is low"),
      BodyImage(
        image: Image.asset(
          "assets/images/module1/shampoo.png",
          fit: BoxFit.fill,
        ),
      ),
      BulletPoint(
          text:
              "Another example would be availability in the right outlets  like how sachets are best sold in Kirana stores and Bottles in Super Market"),
      BulletPoint(
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
      Heading(text: "General Trade vs Modern trade"),
      BodyImage(
        image: Image.asset(
          "assets/images/module1/trade.png",
          fit: BoxFit.fill,
        ),
      ),
      TabularColumn(
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
      SizedBox()
    ],
    [
      Heading(text: "As per Nielsen – types of outlets"),
      BodyImage(
        image: Image.asset(
          "assets/images/module1/nielsen.png",
          fit: BoxFit.fill,
        ),
      ),
      Body(
          text:
              "Nielsen is a global company that provides valuable insights into consumer behavior and marketing information by collecting data that measures what consumers watch and what they buy. This is how they classify outlets:"),
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
      Heading(text: "Some examples of Outlets"),
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
      Heading(text: "Factors affecting channel satisfaction"),
      BodyImage(
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
      const Heading(text: 'Merchandizing'),
      const BulletPoint(
          text:
              'Merchandizing -> promotion of the sale of goods that can employ pricing, special offer, display, & other techniques '),
      const SubHeading(text: 'Importance of Merchandizing'),
      const Body(
          text:
              '1. Enhanced visibility of the product \n 2.Improved shopping experience \n3.Increased sales \n4.Competitive advantage'),
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
      Heading(text: "Different strategies for Merchandizing"),
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
      BodyImage(
        image: Image.asset(
          "assets/images/module1/display_merchandize.png",
          fit: BoxFit.fill,
        ),
      ),
      const BulletPoint(text: 'Display of product information makes easy to:'),
      const SubBulletPoint(text: 'Introduce'),
      const SubBulletPoint(text: 'Explain'),
      const SubBulletPoint(text: 'Show'),
      const SubBulletPoint(text: 'Sell'),
      const BulletPoint(
          text:
              'Not just for the product, effective display helps establish, promote & enhance the store’s visual image '),
      const BulletPoint(
          text:
              'Display also helps the shopper in making it easier for them to self select'),
      const SizedBox()
    ],
    [
      Heading(text: "Different types of Display Merchandize"),
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
      const SubBulletPoint(text: 'Floor Stand'),
      const SubBulletPoint(text: 'Showcase'),
      const SubBulletPoint(text: 'End cap unit'),
      const SubBulletPoint(text: 'Checkout display'),
      const SubBulletPoint(text: 'Digital Pop display'),
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
      BulletPoint(text: "POS - Point of Sale"),
      BulletPoint(
          text:
              "Point of Sale Display is used to influence a shopper’s decision"),
      BulletPoint(text: "It is present only in specific spaces"),
      BulletPoint(text: "Ideally away from the category"),
      BulletPoint(text: "It is targeted to influence a specific group"),
      BulletPoint(
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
      BulletPoint(text: "POP - Point of Purchase"),
      BulletPoint(
          text:
              "Point of Purchase Display is used to capture the attention of shopper"),
      BulletPoint(text: "It can be placed anywhere in the store"),
      BulletPoint(
          text: "Usually placed next to the space of the same category."),
      BulletPoint(text: "Offers flexibility in targeting different groups"),
      BulletPoint(text: "Suitable for a wide variety of products"),
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
      const Body(text: 'Visibility -> Primary & Secondary'),
      ImageSlider(
        imageList: [
          "assets/images/module1/visiblity_1.png",
          "assets/images/module1/visiblity_2.png"
        ],
        height: 200,
        verticalPadding: 0,
      ),
      const SizedBox(),
      BulletPoint(
          topPadding: 0,
          text:
              "We looked into how availability and visibility is important for better sales. "),
      BulletPoint(
          text:
              "In addition to these – we should also be cognizant about the different types of visibility"),
      BulletPoint(
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
  [
    [
      BodyImage(
        image: Image.asset(
          "assets/images/sample/sample_2.png",
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
      BodyImage(
        image: Image.asset(
          "assets/images/sample/sample_2.png",
          fit: BoxFit.fitWidth,
          width: 100,
        ),
      ),
      const SubHeading(
        text: "Examples of FMCD",
      ),
      BodyImage(
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
      BodyImage(
        image: Image.asset(
          "assets/images/module1/buying_decisions.png",
          fit: BoxFit.fitWidth,
          width: 100,
        ),
      ),
      const SubHeading(text: 'Types of Buying Decisions'),
      BodyImage(
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
      BodyImage(
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
  [
    [
      BodyImage(
        image: Image.asset(
          "assets/images/sample/sample_2.png",
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
      BodyImage(
        image: Image.asset(
          "assets/images/sample/sample_2.png",
          fit: BoxFit.fitWidth,
          width: 100,
        ),
      ),
      const SubHeading(
        text: "Examples of FMCD",
      ),
      BodyImage(
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
      BodyImage(
        image: Image.asset(
          "assets/images/module1/buying_decisions.png",
          fit: BoxFit.fitWidth,
          width: 100,
        ),
      ),
      const SubHeading(text: 'Types of Buying Decisions'),
      BodyImage(
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
      BodyImage(
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
  [
    [
      BodyImage(
        image: Image.asset(
          "assets/images/sample/sample_2.png",
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
      BodyImage(
        image: Image.asset(
          "assets/images/sample/sample_2.png",
          fit: BoxFit.fitWidth,
          width: 100,
        ),
      ),
      const SubHeading(
        text: "Examples of FMCD",
      ),
      BodyImage(
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
      BodyImage(
        image: Image.asset(
          "assets/images/module1/buying_decisions.png",
          fit: BoxFit.fitWidth,
          width: 100,
        ),
      ),
      const SubHeading(text: 'Types of Buying Decisions'),
      BodyImage(
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
      BodyImage(
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
  [
    [
      BodyImage(
        image: Image.asset(
          "assets/images/sample/sample_2.png",
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
      BodyImage(
        image: Image.asset(
          "assets/images/sample/sample_2.png",
          fit: BoxFit.fitWidth,
          width: 100,
        ),
      ),
      const SubHeading(
        text: "Examples of FMCD",
      ),
      BodyImage(
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
      BodyImage(
        image: Image.asset(
          "assets/images/module1/buying_decisions.png",
          fit: BoxFit.fitWidth,
          width: 100,
        ),
      ),
      const SubHeading(text: 'Types of Buying Decisions'),
      BodyImage(
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
      BodyImage(
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
  [
    [
      BodyImage(
        image: Image.asset(
          "assets/images/sample/sample_2.png",
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
      BodyImage(
        image: Image.asset(
          "assets/images/sample/sample_2.png",
          fit: BoxFit.fitWidth,
          width: 100,
        ),
      ),
      const SubHeading(
        text: "Examples of FMCD",
      ),
      BodyImage(
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
      BodyImage(
        image: Image.asset(
          "assets/images/module1/buying_decisions.png",
          fit: BoxFit.fitWidth,
          width: 100,
        ),
      ),
      const SubHeading(text: 'Types of Buying Decisions'),
      BodyImage(
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
      BodyImage(
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
  [
    [
      BodyImage(
        image: Image.asset(
          "assets/images/sample/sample_2.png",
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
      BodyImage(
        image: Image.asset(
          "assets/images/sample/sample_2.png",
          fit: BoxFit.fitWidth,
          width: 100,
        ),
      ),
      const SubHeading(
        text: "Examples of FMCD",
      ),
      BodyImage(
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
      BodyImage(
        image: Image.asset(
          "assets/images/module1/buying_decisions.png",
          fit: BoxFit.fitWidth,
          width: 100,
        ),
      ),
      const SubHeading(text: 'Types of Buying Decisions'),
      BodyImage(
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
      BodyImage(
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
  [
    [
      BodyImage(
        image: Image.asset(
          "assets/images/sample/sample_2.png",
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
      BodyImage(
        image: Image.asset(
          "assets/images/sample/sample_2.png",
          fit: BoxFit.fitWidth,
          width: 100,
        ),
      ),
      const SubHeading(
        text: "Examples of FMCD",
      ),
      BodyImage(
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
      BodyImage(
        image: Image.asset(
          "assets/images/module1/buying_decisions.png",
          fit: BoxFit.fitWidth,
          width: 100,
        ),
      ),
      const SubHeading(text: 'Types of Buying Decisions'),
      BodyImage(
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
      BodyImage(
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
  [
    [
      BodyImage(
        image: Image.asset(
          "assets/images/sample/sample_2.png",
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
      BodyImage(
        image: Image.asset(
          "assets/images/sample/sample_2.png",
          fit: BoxFit.fitWidth,
          width: 100,
        ),
      ),
      const SubHeading(
        text: "Examples of FMCD",
      ),
      BodyImage(
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
      BodyImage(
        image: Image.asset(
          "assets/images/module1/buying_decisions.png",
          fit: BoxFit.fitWidth,
          width: 100,
        ),
      ),
      const SubHeading(text: 'Types of Buying Decisions'),
      BodyImage(
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
      BodyImage(
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
  [
    [
      BodyImage(
        image: Image.asset(
          "assets/images/sample/sample_2.png",
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
      BodyImage(
        image: Image.asset(
          "assets/images/sample/sample_2.png",
          fit: BoxFit.fitWidth,
          width: 100,
        ),
      ),
      const SubHeading(
        text: "Examples of FMCD",
      ),
      BodyImage(
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
      BodyImage(
        image: Image.asset(
          "assets/images/module1/buying_decisions.png",
          fit: BoxFit.fitWidth,
          width: 100,
        ),
      ),
      const SubHeading(text: 'Types of Buying Decisions'),
      BodyImage(
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
      BodyImage(
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
  [
    [
      BodyImage(
        image: Image.asset(
          "assets/images/sample/sample_2.png",
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
      BodyImage(
        image: Image.asset(
          "assets/images/sample/sample_2.png",
          fit: BoxFit.fitWidth,
          width: 100,
        ),
      ),
      const SubHeading(
        text: "Examples of FMCD",
      ),
      BodyImage(
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
      BodyImage(
        image: Image.asset(
          "assets/images/module1/buying_decisions.png",
          fit: BoxFit.fitWidth,
          width: 100,
        ),
      ),
      const SubHeading(text: 'Types of Buying Decisions'),
      BodyImage(
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
      BodyImage(
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
