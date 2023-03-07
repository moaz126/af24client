import 'package:af24client/screens/New_Screens/activity/comment_detail_screen.dart';
import 'package:af24client/screens/Widgets/common_elevated_button.dart';
import 'package:af24client/screens/Widgets/common_widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../models/LatesProductsModel.dart';
import '../../Widgets/cachednetwork.dart';
import '../../Widgets/colors.dart';
import '../../Widgets/page_transition.dart';
import 'about_seller_screen.dart';

class ProductDetailScreen extends StatefulWidget {
  final LatestProductsModel product;
  const ProductDetailScreen({Key? key, required this.product})
      : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int activeIndex = 0;
  final List<bool> _customTileExpanded =
      List.filled(100, false, growable: true);
  String avator = '';
  getAvatarName() {
    if (widget.product.sellerName.contains(' ')) {
      List<String> words = widget.product.sellerName.split(" ");
      print(words);
      String firstLetters = "${words[0][0]}${words[1][0]}";

      avator = firstLetters.toUpperCase();
      print(avator);
    } else {
      avator = widget.product.sellerName.substring(0, 1).toUpperCase();
    }
  }

  @override
  void initState() {
    super.initState();
    getAvatarName();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Colors.white,
              // pinned: true,
              expandedHeight: 630,
              flexibleSpace: FlexibleSpaceBar(
                background: Column(
                  children: [
                    Stack(children: [
                      CarouselSlider(
                        // carouselController: controller1,
                        items: [
                          for (int i = 0; i < widget.product.images.length; i++)
                            Center(
                              child: InkWell(
                                onTap: () {},
                                child: Stack(children: [
                                  SizedBox(
                                    // width: 100.w,
                                    height: 70.h,
                                    width: 100.w,
                                    child: ProductImages(
                                        image: widget.product.images[i]),
                                    // fit: BoxFit.fitHeight,
                                  ),
                                ]),
                              ),
                            ),
                        ], //Slider Container properties
                        options: CarouselOptions(
                          onPageChanged: (index, reason) {
                            setState(() {
                              activeIndex = index;
                            });
                          },
                          height: 490.0,
                          enlargeCenterPage: false,
                          autoPlay: true,
                          aspectRatio: 16 / 9,
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enableInfiniteScroll: false,
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 800),
                          viewportFraction: 0.86,
                        ),
                      ),
                      Positioned(
                          top: 9,
                          right: 0,
                          child: Container(
                            height: 30,
                            width: 76,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.black)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  width: 4,
                                ),
                                Image.asset(
                                  'assets/images/flag.png',
                                  height: 18,
                                  width: 18,
                                ),
                                const SizedBox(
                                  width: 3,
                                ),
                                Container(
                                  height: 19,
                                  width: 23,
                                  decoration: BoxDecoration(
                                      color: AppColors.redContainer,
                                      // color: Colors.black,
                                      borderRadius: BorderRadius.circular(6)),
                                  child: Center(
                                      child: Text(
                                    'Hot',
                                    style: TextStyles.TitleTexStyle10()
                                        .copyWith(
                                            color: Colors.white, fontSize: 8),
                                  )),
                                ),
                                const SizedBox(
                                  width: 3,
                                ),
                                Container(
                                  height: 19,
                                  width: 16,
                                  decoration: BoxDecoration(
                                      color: AppColors.redContainer,
                                      // color: Colors.black,
                                      borderRadius: BorderRadius.circular(6)),
                                  child: Center(
                                      child: Text(
                                    '%',
                                    style: TextStyles.TitleTexStyle10()
                                        .copyWith(
                                            color: Colors.white, fontSize: 9),
                                  )),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                              ],
                            ),
                          )),
                    ]),
                    const SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      height: 7,
                      child: Stack(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 80, right: 80),
                            child: Divider(
                              thickness: 0.6,
                              color: Colors.black,
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                width: 100.w,
                                alignment: Alignment.center,
                                child: AnimatedSmoothIndicator(
                                  effect: const SlideEffect(
                                    /*  radius: 2,
                                            dotHeight: 3,
                                            dotWidth: 15, */
                                    dotHeight: 7,
                                    dotWidth: 37,
                                    radius: 1,
                                    dotColor: Colors.transparent,
                                    activeDotColor: Colors.black,
                                    paintStyle: PaintingStyle.fill,
                                  ),
                                  activeIndex: activeIndex,
                                  count: 5,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      height: 1,
                      width: 100.w,
                      color: Colors.black,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Container(
                              width: 52.w,
                              child: Text(
                                widget.product.sellerName,
                                style: TextStyles.TitleTexStyle14(),
                              )),
                          Container(
                            height: 30,
                            width: 1.3,
                            color: Colors.black,
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 6,
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/favorite.png',
                                      height: 23,
                                      width: 18,
                                    ),
                                    const SizedBox(
                                      width: 7,
                                    ),
                                    const Text(
                                      '12345',
                                      style: TextStyle(fontSize: 13),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 7,
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/comment.png',
                                      height: 23,
                                      width: 18,
                                    ),
                                    const SizedBox(
                                      width: 7,
                                    ),
                                    const Text(
                                      '1234',
                                      style: TextStyle(fontSize: 13),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 7,
                              ),
                              Image.asset(
                                'assets/images/share.png',
                                height: 21,
                                width: 16,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 1,
                      width: 100.w,
                      color: Colors.black,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: Container(
                            width: 67.w,
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    widget.product.name.toString(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              '${widget.product.first_price_down}€',
                              style: TextStyles.TitleTexStyle14(),
                            ),
                            const SizedBox(
                              width: 13,
                            ),
                            Text(
                              '${widget.product.purchasePrice}€',
                              style: TextStyles.TitleTexStyle14().copyWith(
                                  color: Colors.grey,
                                  decoration: TextDecoration.lineThrough),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Container(
                      height: 1,
                      width: 100.w,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Column(
                        children: [
                          Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(widget.product.details.toString(),
                                    // '10 X 6 X 1 IN (26.2 X 14.5 X 2 CM)\nCALFSKIN LAMBSKIN\nLININGSHOULDER AND HAND CARRY\nTRIOMPHE SNAP BUTTON CLOSURE\nINNER FLAT POCKET\nINNER ZIPPED POCKET\nTWO INTERNAL COMPARTMENTS\nREMOVABLE STRAP WITH 10 IN (25 CM) DROP',
                                    style: TextStyles.TitleTexStyle11()
                                        .copyWith(height: 1.5)),
                              )),
                          const SizedBox(
                            height: 6,
                          ),
                          /* Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 7),
                              child: Text(
                                'Colors',
                                style: TextStyles.TitleTexStyle13(),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 7),
                            child: SizedBox(
                              height: 40,
                              child: Center(
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: widget.product.colors.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: HexColor(widget.product.colors),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 7),
                              child: Text(
                                'Sizes',
                                style: TextStyles.TitleTexStyle13(),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                              padding: const EdgeInsets.only(left: 7.0),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Wrap(
                                  alignment: WrapAlignment.start,
                                  runAlignment: WrapAlignment.start,
                                  runSpacing: 10.0,
                                  crossAxisAlignment: WrapCrossAlignment.start,
                                  direction: Axis.horizontal,
                                  textDirection: TextDirection.ltr,
                                  spacing: 5,
                                  children: <Widget>[
                                    for (int i = 0;
                                        i < widget.product.size.lenght;
                                        i++)
                                      InkWell(
                                        highlightColor: Colors.white,
                                        splashColor: Colors.white,
                                        onTap: () {},
                                        child: Container(
                                            height: 35,
                                            width: widget
                                                        .product.size[i].length
                                                        .toDouble() <
                                                    4
                                                ? widget.product.size[i].length
                                                        .toDouble() *
                                                    20
                                                : widget.product.size[i].length
                                                        .toDouble() *
                                                    14.5,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all(
                                                    color: Colors.black,
                                                    width: 1.5),
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: Center(
                                                child: Padding(
                                              padding: EdgeInsets.only(
                                                  left: 8.0, right: 8.0),
                                              child: Text(
                                                widget.product.size[i],
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
                                            ))),
                                      ),
                                  ],
                                ),
                              )), */
                          Container(
                            height: 1,
                            width: 100.w,
                            color: Colors.black,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(
                              children: [
                                Container(
                                    width: 57.w,
                                    child: Text(
                                      'About seller',
                                      style: TextStyles.TitleTexStyle13(),
                                    )),
                                Container(
                                  height: 30,
                                  width: 0.8,
                                  color: Colors.black,
                                ),
                                Row(
                                  children: [
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Container(
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            'assets/images/favorite.png',
                                            height: 23,
                                            width: 18,
                                          ),
                                          const SizedBox(
                                            width: 7,
                                          ),
                                          const Text(
                                            'Follow this seller',
                                            style: TextStyle(fontSize: 13),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 0.7,
                            width: 100.w,
                            color: Colors.black,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Container(
                              height: 50,
                              child: Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      PageTransition.fadeInNavigation(
                                          page: const ABoutSellerScreen());
                                      // Get.to(()=>ABoutSellerScreen());
                                    },
                                    child: Container(
                                        width: 50.w,
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Container(
                                                    height: 22,
                                                    width: 22,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                        color: Colors.yellow
                                                            .withOpacity(0.6)),
                                                    child: Center(
                                                        child: Text(
                                                      avator,
                                                      style: TextStyles
                                                          .TitleTexStyle11(),
                                                    )),
                                                  ),
                                                  const SizedBox(
                                                    width: 3,
                                                  ),
                                                  Text(
                                                    widget.product.sellerName,
                                                    style: TextStyles
                                                        .TitleTexStyle11(),
                                                  )
                                                ],
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 7),
                                                child: Container(
                                                  height: 16,
                                                  width: 52,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              2),
                                                      color: Colors.black),
                                                  child: Center(
                                                    child: Text(
                                                      'Superseller',
                                                      style: TextStyles
                                                              .TitleTexStyle10()
                                                          .copyWith(
                                                              fontSize: 8,
                                                              color:
                                                                  Colors.white),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ])),
                                  ),
                                  Container(
                                    height: 50,
                                    width: 0.8,
                                    color: Colors.black,
                                  ),
                                  Row(
                                    children: [
                                      const SizedBox(
                                        width: 6,
                                      ),
                                      Container(
                                        child: Column(
                                          children: [
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              'Location',
                                              style:
                                                  TextStyles.TitleTexStyle11()
                                                      .copyWith(
                                                          fontWeight: FontWeight
                                                              .normal),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 25),
                                              child: Image.asset(
                                                'assets/images/flag.png',
                                                height: 23,
                                                width: 18,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    height: 50,
                                    width: 0.8,
                                    color: Colors.black,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text(
                                              'Shipping to',
                                              textAlign: TextAlign.right,
                                              style:
                                                  TextStyles.TitleTexStyle11()
                                                      .copyWith(
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Image.asset(
                                              'assets/images/flag.png',
                                              height: 23,
                                              width: 18,
                                            ),
                                            const SizedBox(
                                              width: 7,
                                            ),
                                            Image.asset(
                                              'assets/images/flag.png',
                                              height: 23,
                                              width: 18,
                                            ),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 1.3,
                            width: 100.w,
                            color: Colors.black,
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 12),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Comments ' + '(988)',
                                        style: TextStyles.TitleTexStyle12(),
                                      ),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      Container(
                                        height: 20,
                                        width: 27,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: AppColors.redContainer),
                                        child: Center(
                                            child: Text(
                                          'Hot',
                                          style: TextStyles.TitleTexStyle10()
                                              .copyWith(color: Colors.white),
                                        )),
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        right: 8,
                                      ),
                                      child: Text(
                                        'Available language',
                                        style: TextStyles.TitleTexStyle11()
                                            .copyWith(
                                                fontWeight: FontWeight.normal),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Image.asset(
                                          'assets/images/flag.png',
                                          height: 21,
                                          width: 16,
                                        ),
                                        const SizedBox(
                                          width: 7,
                                        ),
                                        Image.asset(
                                          'assets/images/flag.png',
                                          height: 21,
                                          width: 16,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ]),
                          // CommonUiWidget.DividerWidthOneNThree(),
                          for (int i = 0; i < 5; i++)
                            Column(
                              children: [
                                Container(
                                  height: 0.8,
                                  width: 100.w,
                                  color: Colors.black.withOpacity(0.8),
                                ),
                                ExpansionTile(
                                  textColor: Colors.black,
                                  collapsedTextColor: Colors.black,
                                  title: Row(
                                    children: [
                                      Container(
                                        height: 24,
                                        width: 24,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color:
                                                Colors.blue.withOpacity(0.6)),
                                        child: Center(
                                            child: Text(
                                          'JJ',
                                          style: TextStyles.TitleTexStyle12(),
                                        )),
                                      ),
                                      const SizedBox(
                                        width: 6,
                                      ),
                                      Text(
                                        'Jil Jacquemus (2)',
                                        style: TextStyles.TitleTexStyle12(),
                                      ),
                                      Image.asset(
                                        'assets/images/af24icon.png',
                                        height: 26,
                                        width: 26,
                                      )
                                    ],
                                  ),
                                  onExpansionChanged: (bool expanded) {
                                    setState(() =>
                                        _customTileExpanded[i] = expanded);
                                  },
                                  trailing: Container(
                                    width: 130,
                                    child: Row(
                                      children: [
                                        Text(
                                          '15:12:23 12.12.2022.',
                                          style: TextStyles.TitleTexStyle12()
                                              .copyWith(
                                                  fontWeight:
                                                      FontWeight.normal),
                                        ),
                                        const SizedBox(
                                          width: 13,
                                        ),
                                        _customTileExpanded[i]
                                            ? Image.asset(
                                                ('assets/images/closeexpansion.png'),
                                                height: 15,
                                                width: 15,
                                              )
                                            : Image.asset(
                                                ('assets/images/openexpansion.png'),
                                                height: 15,
                                                width: 15,
                                              ),
                                      ],
                                    ),
                                  ),
                                  children: [
                                    Container(
                                      height: 20.h,
                                      color: AppColors.expansiotile,
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 20.h,
                                            child: ListView.builder(
                                              itemCount: 6,
                                              itemBuilder: (context, index) =>
                                                  Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 3),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 25, top: 5),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        '18:06:10 12.12.2022.',
                                                        style: TextStyles
                                                                .TitleTexStyle11()
                                                            .copyWith(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal),
                                                      ),
                                                      const SizedBox(
                                                        width: 20,
                                                      ),
                                                      Container(
                                                        height: 22,
                                                        width: 22,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20),
                                                            color: Colors.blue
                                                                .withOpacity(
                                                                    0.6)),
                                                        child: Center(
                                                            child: Text(
                                                          'JJ',
                                                          style: TextStyles
                                                              .TitleTexStyle12(),
                                                        )),
                                                      ),
                                                      const SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text(
                                                        'Do you have white one?',
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        maxLines: 1,
                                                        style: TextStyles
                                                                .TitleTexStyle12()
                                                            .copyWith(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: InkWell(
          onTap: () {
            PageTransition.fadeInNavigation(page: const CommentDetailScreen());
          },
          child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(
                    color: Colors.black,
                  ),
                ),
              ),
              height: 100,
              child: Column(
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Are you interested in this product? ',
                    style: TextStyles.TitleTexStyle12()
                        .copyWith(fontWeight: FontWeight.normal),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(5)),
                          width: 90.w,
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/comment.png',
                                height: 23,
                                width: 18,
                                color: Colors.white,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Leave a Comment to the seller',
                                style: TextStyles.TitleTexStyle13().copyWith(
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white),
                              ),
                            ],
                          )),
                    ],
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
