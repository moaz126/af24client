import 'package:af24client/Api/Auth_af24.dart';
import 'package:af24client/Api/globalVariables.dart';
import 'package:af24client/newBar.dart';
import 'package:af24client/screens/OrderHistory/OrderList.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../localization/languages/languages.dart';
import '../../navBar.dart';

class OrderDetails extends StatefulWidget {
  final String index;
   OrderDetails(this.index);


  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  fun() async {
    setState(() {
      loader = true;
    });
    await DataApiService.instance.getOrderDetails(widget.index);
    setState(() {
      loader = false;
    });
  }
  bool loader = false;
  bool Buttonloader = false;
  final spinkit = SpinKitSpinningLines(
    size: 5.h,
    color: Colors.black,
  );
  final Buttonspinkit = SpinKitSpinningLines(
    size: 3.h,
    color: Colors.white,
  );
  @override
  initState() {
    // TODO: implement initState
    fun();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: newNavBar(
      //   index: 5,
      // ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          Languages.of(context)!.ORDERS_DETAILS,
          style: TextStyle(color: Colors.black),
        ),
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        centerTitle: true,
      ),
      body:
          loader == true ? spinkit :
      SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[100],
          ),
          child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: orderDetails.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          index == 0 ?
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Text(
                                Languages.of(context)!.ORDER_NO + ": " +
                                  orderDetails[index].orderId.toString(),
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          )
                          :
                              Container(),
                          index == 0 ?
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      Languages.of(context)!.METHOD + ": ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      Languages.of(context)!.CASH_ON_DELIVERY,
                                      style: TextStyle(),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      orderDetails[index].createdAt.toString().substring(0,16),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                          :
                              Container(),
                          index == 0 ?
                          Padding(
                            padding: const EdgeInsets.only(bottom: 12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  Languages.of(context)!.PAYMENT_STATUS,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 42.w,
                                ),
                                Container(
                                  width: 15.w,
                                  decoration: BoxDecoration(
                                    color: Colors.red[700],
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                      child: Text(
                                    orderDetails[index]
                                        .paymentStatus
                                        .toString(),
                                    style: TextStyle(color: Colors.white),
                                  )),
                                )
                              ],
                            ),
                          )
                          :
                              Container(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  height: 140,
                                  width: 140,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      border: Border.all(
                                        color: Colors.grey.withOpacity(0.4),
                                      ),
                                      color: Colors.white),
                                  child:
                                      // Padding(
                                      //   padding: const EdgeInsets.all(3.0),
                                      //   child: DottedBorder(
                                      //     dashPattern: [4, 6],
                                      //     strokeWidth: 2,
                                      //     color: Colors.grey,
                                      //     child: Container(
                                      //       alignment: Alignment.center,
                                      //       child: Image.asset(
                                      //         'assets/icons/Seller app icon (19).png',
                                      //         height: 5.h,
                                      //         color: Colors.grey[400],
                                      //       ),
                                      //     ),
                                      //   ),
                                      // ),
                                  CachedNetworkImage(
                                    imageUrl:
                                    'http://becknowledge.com/af24/storage/app/public/product/' +
                                        orderDetails[index]
                                            .productDetails
                                            .images[0],
                                    fit: BoxFit.fill,
                                    placeholder: (context, url) =>
                                        shimmerCategoryLoader(),
                                    errorWidget:
                                        (context, url, error) =>
                                        Image.asset(
                                          'assets/images/NoPic.jpg',
                                          height: 20.h,
                                          width: 20.h,
                                        ),
                                  ),
                                      // Image.network(
                                      //     'http://becknowledge.com/af24/storage/app/public/product/' +
                                      //         orderDetails[index]
                                      //             .productDetails
                                      //             .images[0]),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Center(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        orderDetails[index].productDetails.name,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      // Text(
                                      //   orderDetails[index].variation!.size.toString(),
                                      //   style: TextStyle(
                                      //       fontWeight: FontWeight.bold),
                                      // ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        orderDetails[index].variation.color.toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      orderDetails[index].isDirectOrder == 1
                                      ?
                                      Text(
                                        ((orderDetails[index].price - orderDetails[index].productDetails.shippingCost) / orderDetails[index].qty)
                                            .toString() +
                                            "€ x " +
                                            orderDetails[index].qty.toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )
                                          :
                                      Text(
                                        orderDetails[index]
                                                .productDetails
                                                .unitPrice
                                                .toString() +
                                            "€ x " +
                                            orderDetails[index].qty.toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                            ),
                            height: 200,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 16, right: 8),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 30.w,
                                          child: Text(Languages.of(context)!.SUB_TOTAL),
                                        ),
                                        SizedBox(
                                          width: 30.w,
                                        ),
                                        SizedBox(
                                          width: 20.w,
                                          child:
                                          orderDetails[index].isDirectOrder == 1 ?
                                          Text(
                                            "(+)" +
                                                '${
                                                    ((orderDetails[index].price - orderDetails[index].productDetails.shippingCost) / orderDetails[index].qty) * orderDetails[index].qty.toDouble()
                                                }€',
                                          )
                                              :
                                          Text(
                                            "(+)" +
                                               '${
                                                  orderDetails[index]
                                                            .productDetails.unitPrice.toDouble() * orderDetails[index]
                                                      .qty.toDouble()
                                                      }€',
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 30.w,
                                          child: Text(Languages.of(context)!.TAX),
                                        ),
                                        SizedBox(
                                          width: 30.w,
                                        ),
                                        SizedBox(
                                          width: 20.w,
                                          child: Text(
                                            "(+)" +
                                                orderDetails[index].productDetails
                                                    .tax
                                                    .toString() + '€',
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 30.w,
                                          child: Text(Languages.of(context)!.DISCOUNT),
                                        ),
                                        SizedBox(
                                          width: 30.w,
                                        ),
                                        SizedBox(
                                          width: 20.w,
                                          child: Text(
                                            "(-)" +
                                                orderDetails[index]
                                                    .productDetails
                                                    .discount
                                                    .toString() + '€',
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 30.w,
                                          child: Text(Languages.of(context)!.COUPON),
                                        ),
                                        SizedBox(
                                          width: 30.w,
                                        ),
                                        SizedBox(
                                          width: 20.w,
                                          child: Text(
                                            "(-)0.00€",
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 30.w,
                                          child: Text(Languages.of(context)!.SHIPPING_FEE),
                                        ),
                                        SizedBox(
                                          width: 30.w,
                                        ),
                                        SizedBox(
                                          width: 20.w,
                                          child: Text(
                                            "(+)" +
                                                orderDetails[index]
                                                    .productDetails
                                                    .shippingCost
                                                    .toString() + '€',
                                          ),
                                        )
                                      ],
                                    ),
                                    Divider(
                                      thickness: 1,
                                      height: 1,
                                      color: Colors.grey,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 30.w,
                                          child: Text(
                                            Languages.of(context)!.TOTAL_AMOUNT,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 30.w,
                                        ),
                                        SizedBox(
                                          width: 20.w,
                                          child:
                                          orderDetails[index].isDirectOrder == 1 ?
                                          Text(
                                                ((orderDetails[index]
                                                    .qty
                                                    .toDouble() *
                                                    ((orderDetails[index].price - orderDetails[index].productDetails.shippingCost) / orderDetails[index].qty)) +
                                                    orderDetails[index]
                                                        .tax
                                                        .toDouble() +
                                                    orderDetails[index]
                                                        .productDetails
                                                        .shippingCost
                                                        .toDouble() -
                                                    orderDetails[index]
                                                        .productDetails
                                                        .discount
                                                        .toDouble())
                                                    .toString() + '€',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          )
                                              :
                                          Text(
                                                ((orderDetails[index]
                                                                .qty
                                                                .toDouble() *
                                                            orderDetails[index]
                                                                .productDetails
                                                                .unitPrice
                                                                .toDouble()) +
                                                        orderDetails[index]
                                                            .tax
                                                            .toDouble() +
                                                        orderDetails[index]
                                                            .productDetails
                                                            .shippingCost
                                                            .toDouble() -
                                                        orderDetails[index]
                                                            .productDetails
                                                            .discount
                                                            .toDouble())
                                                    .toString() + '€',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )
                                      ],
                                    ),
                                  ]),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          index == 0 ?
                              orderDetails[index].isDirectOrder == 0 ?
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                Languages.of(context)!.CUSTOMER_CONTACT_DETAILS,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Row(
                                children: [
                                  Text(
                                    Languages.of(context)!.NAME + ": ",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(width: 2.w,),
                                  Text(
                                    orderDetails[index].shippingAddressData!.contactPersonName.toString(),
                                    style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey.shade700),
                                  ),

                                ],
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Row(
                                children: [
                                  Text(
                                  Languages.of(context)!.EMAIL + ": ",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(width: 2.w,),
                                  Text(
                                    orderDetails[index].userEmail.toString(),
                                    style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey.shade700),
                                  ),

                                ],
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Row(
                                children: [
                                  Text(
                                    Languages.of(context)!.CONTACT + ": ",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(width: 2.w,),
                                  Text(
                                    orderDetails[index].shippingAddressData!.phone.toString(),
                                    style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey.shade700),
                                  ),

                                ],
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Row(
                                children: [
                                  Text(
                                    Languages.of(context)!.ADDRESS + ": ",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(width: 2.w,),
                                  Text(
                                    orderDetails[index].shippingAddressData!.address.toString() + ' , ' + orderDetails[index].shippingAddressData!.city.toString(),
                                    style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey.shade700),
                                  ),
                                ],
                              ),
                              Divider(
                                color: Colors.black,
                                height: 3.h,
                                thickness: 0.3.h,
                              )
                            ],
                          )
                              :
                                  Container()
                          :
                              Divider(
                            color: Colors.black,
                            height: 3.h,
                            thickness: 0.3.h,
                          ),
                          orderDetails[index].orderStatus=='delivered' || orderDetails[index].orderStatus=='canceled' || orderDetails[index].orderStatus=='confirmed' ?SizedBox():
                              index == orderDetails.length - 1 ?
                          Center(
                            child: Container(
                              //color: Colors.red,
                              width: 120,
                              height: 6.h,
                              child: Center(
                                // child: FlatButton(
                                //     onPressed: () async {
                                //       StatusCode = '403';
                                //       setState(() {
                                //         Buttonloader = true;
                                //       });
                                //       Map<String, dynamic> cancelinfo = {
                                //         "order_id":
                                //             orderDetails[index].orderId.toString(),
                                //       };
                                //       setState(() {
                                //         Buttonloader = true;
                                //       });
                                //       await DataApiService.instance
                                //           .cancelOrder(cancelinfo);
                                //       setState(() {
                                //         Buttonloader = false;
                                //       });
                                //       AwesomeDialog(
                                //         context: context,
                                //         dialogType: DialogType.SUCCES,
                                //         animType: AnimType.BOTTOMSLIDE,
                                //         title: Languages.of(context)!.SUCCESS,
                                //         desc: 'Order Cancel Successfully.',
                                //         btnOkOnPress: () {
                                //           Navigator.pushReplacement(
                                //               context,
                                //               MaterialPageRoute(
                                //                   builder: (BuildContext context) =>
                                //                       OrderList()));
                                //         },
                                //       ).show();
                                //       // GlobalSnackBar.show(context, EmailVerficationMessage!);
                                //       setState(() {
                                //         Buttonloader = false;
                                //       });
                                //       // GlobalSnackBar.show(context, LoginSnackMessage);
                                //       // StatusCode != '200'
                                //       //     ? AwesomeDialog(
                                //       //         context: context,
                                //       //         dialogType: DialogType.ERROR,
                                //       //         animType: AnimType.BOTTOMSLIDE,
                                //       //         title: 'Error',
                                //       //         desc: 'Error',
                                //       //         btnOkOnPress: () {},
                                //       //       ).show()
                                //       //     : AwesomeDialog(
                                //       //         context: context,
                                //       //         dialogType: DialogType.SUCCES,
                                //       //         animType: AnimType.BOTTOMSLIDE,
                                //       //         title: 'Success',
                                //       //         desc: 'Updated Successfully',
                                //       //         btnOkOnPress: () {
                                //       //           Navigator.of(context).push(
                                //       //               MaterialPageRoute(
                                //       //                   builder: (context) =>
                                //       //                       newBar(
                                //       //                         index: 3,
                                //       //                       )));
                                //       //         },
                                //       //       ).show();
                                //
                                //       // setState(() async {
                                //       //   Emaillogin = emailcontroller.text;
                                //       //   PassLogin = passcontroller.text;
                                //       //   await callApi();
                                //       //   GlobalSnackBar.show(context, LoginSnackMessage),
                                //     },
                                //     child: Buttonloader == true
                                //         ? Buttonspinkit
                                //         : Text(
                                //       Languages.of(context)!.CANCEL_ORDER,
                                //             style: TextStyle(
                                //                 color: Colors.white,
                                //                 fontSize: 15,
                                //                 fontWeight: FontWeight.normal),
                                //           ),
                                //     color: Colors.black,
                                //     shape: RoundedRectangleBorder(
                                //         borderRadius: BorderRadius.circular(6))),
                              ),
                            ),
                          )
                                  :
                                  Container(),
                        ],
                      ),
                    ),
                  );
                },
              )
              // Container(
              //   decoration: BoxDecoration(color: Colors.white),
              //   child: Padding(
              //     padding: const EdgeInsets.all(10.0),
              //     child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //       children: [
              //         SizedBox(
              //           height: 15,
              //         ),
              //         Padding(
              //           padding: const EdgeInsets.only(bottom: 8.0),
              //           child: Text(
              //             "Order_No: "+sellerOrderDetails[0].orderId.toString(),
              //             style: TextStyle(fontWeight: FontWeight.bold),
              //           ),
              //         ),
              //         Padding(
              //           padding: const EdgeInsets.only(bottom: 8.0),
              //           child: Row(
              //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //             children: [
              //               Row(
              //                 mainAxisAlignment: MainAxisAlignment.start,
              //                 children: [
              //                   Text(
              //                     "Method: ",
              //                     style: TextStyle(fontWeight: FontWeight.bold),
              //                   ),
              //                   Text(
              //                     "Cash on delivery",
              //                     style: TextStyle(),
              //                   ),
              //                 ],
              //               ),
              //               Row(
              //                 children: [
              //                   Text(
              //                     "1:51 AM / 18 Mar-2022",
              //                   ),
              //                 ],
              //               )
              //             ],
              //           ),
              //         ),
              //         Padding(
              //           padding: const EdgeInsets.only(bottom: 12.0),
              //           child: Row(
              //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //             children: [
              //               Text(
              //                 "Payment status",
              //                 style: TextStyle(fontWeight: FontWeight.bold),
              //               ),
              //               SizedBox(
              //                 width: 42.w,
              //               ),
              //               Container(
              //                 width: 15.w,
              //                 decoration: BoxDecoration(
              //                   color: Colors.red[700],
              //                   borderRadius: BorderRadius.circular(10),
              //                 ),
              //                 child: Center(
              //                     child: Text(
              //                   sellerOrderDetails[0].paymentStatus.toString(),
              //                   style: TextStyle(color: Colors.white),
              //                 )),
              //               )
              //             ],
              //           ),
              //         ),
              //         Row(
              //           mainAxisAlignment: MainAxisAlignment.start,
              //           children: [
              //             Expanded(
              //               flex: 1,
              //               child: Container(
              //                 height: 140,
              //                 width: 140,
              //                 decoration: BoxDecoration(
              //                     borderRadius:
              //                         BorderRadius.all(Radius.circular(5)),
              //                     border: Border.all(
              //                       color: Colors.grey.withOpacity(0.4),
              //                     ),
              //                     color: Colors.white),
              //                 child:
              //                 // Padding(
              //                 //   padding: const EdgeInsets.all(3.0),
              //                 //   child: DottedBorder(
              //                 //     dashPattern: [4, 6],
              //                 //     strokeWidth: 2,
              //                 //     color: Colors.grey,
              //                 //     child: Container(
              //                 //       alignment: Alignment.center,
              //                 //       child: Image.asset(
              //                 //         'assets/icons/Seller app icon (19).png',
              //                 //         height: 5.h,
              //                 //         color: Colors.grey[400],
              //                 //       ),
              //                 //     ),
              //                 //   ),
              //                 // ),
              //                 Image.network('http://becknowledge.com/af24/storage/app/public/product/'+sellerOrderDetails[0].productDetails.images[0]),
              //               ),
              //             ),
              //             Expanded(
              //               flex: 1,
              //               child: Center(
              //                 child: Column(
              //                   crossAxisAlignment: CrossAxisAlignment.start,
              //                   children: [
              //                     Text(
              //                       "Item name / Brand",
              //                       style: TextStyle(fontWeight: FontWeight.bold),
              //                     ),
              //                     SizedBox(
              //                       height: 5,
              //                     ),
              //                     Text(
              //                       "Size",
              //                       style: TextStyle(fontWeight: FontWeight.bold),
              //                     ),
              //                     SizedBox(
              //                       height: 5,
              //                     ),
              //                     Text(
              //                       "HsCode".toUpperCase(),
              //                       style: TextStyle(fontWeight: FontWeight.bold),
              //                     ),
              //                     SizedBox(
              //                       height: 5,
              //                     ),
              //                     Text(
              //                       sellerOrderDetails[0].productDetails.unitPrice.toString() + " EUR  x " + sellerOrderDetails[0].qty.toString(),
              //                       style: TextStyle(fontWeight: FontWeight.bold),
              //                     ),
              //                     SizedBox(
              //                       height: 5,
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //             ),
              //           ],
              //         ),
              //         SizedBox(
              //           height: 30,
              //         ),
              //         Container(
              //           decoration: BoxDecoration(
              //             color: Colors.grey[100],
              //             borderRadius: BorderRadius.all(Radius.circular(5)),
              //           ),
              //           height: 200,
              //           child: Padding(
              //             padding:
              //                 const EdgeInsets.only(top: 10, left: 16, right: 8),
              //             child: Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //                 children: [
              //                   Row(
              //                     mainAxisAlignment: MainAxisAlignment.center,
              //                     children: [
              //                       SizedBox(
              //                         width: 30.w,
              //                         child: Text("Sub Total"),
              //                       ),
              //                       SizedBox(
              //                         width: 30.w,
              //                       ),
              //                       SizedBox(
              //                         width: 20.w,
              //                         child: Text(
              //                           "(+)\$"+sellerOrderDetails[0].price.toString(),
              //                         ),
              //                       )
              //                     ],
              //                   ),
              //                   Row(
              //                     mainAxisAlignment: MainAxisAlignment.center,
              //                     children: [
              //                       SizedBox(
              //                         width: 30.w,
              //                         child: Text("Tax"),
              //                       ),
              //                       SizedBox(
              //                         width: 30.w,
              //                       ),
              //                       SizedBox(
              //                         width: 20.w,
              //                         child: Text(
              //                           "(+)\$"+sellerOrderDetails[0].tax.toString(),
              //                         ),
              //                       )
              //                     ],
              //                   ),
              //                   Row(
              //                     mainAxisAlignment: MainAxisAlignment.center,
              //                     children: [
              //                       SizedBox(
              //                         width: 30.w,
              //                         child: Text("Discount"),
              //                       ),
              //                       SizedBox(
              //                         width: 30.w,
              //                       ),
              //                       SizedBox(
              //                         width: 20.w,
              //                         child: Text(
              //                           "(-)\$"+sellerOrderDetails[0].productDetails.discount.toString(),
              //                         ),
              //                       )
              //                     ],
              //                   ),
              //                   Row(
              //                     mainAxisAlignment: MainAxisAlignment.center,
              //                     children: [
              //                       SizedBox(
              //                         width: 30.w,
              //                         child: Text("Coupon"),
              //                       ),
              //                       SizedBox(
              //                         width: 30.w,
              //                       ),
              //                       SizedBox(
              //                         width: 20.w,
              //                         child: Text(
              //                           "(-)\$0.00",
              //                         ),
              //                       )
              //                     ],
              //                   ),
              //                   Row(
              //                     mainAxisAlignment: MainAxisAlignment.center,
              //                     children: [
              //                       SizedBox(
              //                         width: 30.w,
              //                         child: Text("Shipping Fee"),
              //                       ),
              //                       SizedBox(
              //                         width: 30.w,
              //                       ),
              //                       SizedBox(
              //                         width: 20.w,
              //                         child: Text(
              //                           "(+)\$"+sellerOrderDetails[0].productDetails.shippingCost.toString(),
              //                         ),
              //                       )
              //                     ],
              //                   ),
              //                   Divider(
              //                     thickness: 1,
              //                     height: 1,
              //                     color: Colors.grey,
              //                   ),
              //                   Row(
              //                     mainAxisAlignment: MainAxisAlignment.center,
              //                     children: [
              //                       SizedBox(
              //                         width: 30.w,
              //                         child: Text(
              //                           "Total Amount",
              //                           style: TextStyle(
              //                               fontWeight: FontWeight.bold),
              //                         ),
              //                       ),
              //                       SizedBox(
              //                         width: 30.w,
              //                       ),
              //                       SizedBox(
              //                         width: 20.w,
              //                         child: Text(
              //                           "\$"+ ((sellerOrderDetails[0].qty!.toDouble() * sellerOrderDetails[0].productDetails.unitPrice!.toDouble()) + sellerOrderDetails[0].tax!.toDouble() + sellerOrderDetails[0].productDetails.shippingCost!.toDouble() - sellerOrderDetails[0].productDetails.discount!.toDouble() ).toString(),
              //                           style: TextStyle(
              //                               fontWeight: FontWeight.bold),
              //                         ),
              //                       )
              //                     ],
              //                   ),
              //                 ]),
              //           ),
              //         ),
              //         SizedBox(
              //           height: 20,
              //         ),
              //         Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Text(
              //               "Customer Contact Details",
              //               style: TextStyle(fontWeight: FontWeight.bold),
              //             ),
              //             SizedBox(
              //               height: 7,
              //             ),
              //             Text(
              //               "Name :",
              //               style: TextStyle(fontWeight: FontWeight.bold),
              //             ),
              //             SizedBox(
              //               height: 7,
              //             ),
              //             Text(
              //               "Email :",
              //               style: TextStyle(fontWeight: FontWeight.bold),
              //             ),
              //             SizedBox(
              //               height: 7,
              //             ),
              //             Text(
              //               "contact :",
              //               style: TextStyle(fontWeight: FontWeight.bold),
              //             ),
              //             SizedBox(
              //               height: 7,
              //             ),
              //             Text(
              //               "Address :",
              //               style: TextStyle(fontWeight: FontWeight.bold),
              //             ),
              //           ],
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              ),
        ),
      ),
    );
  }
}
