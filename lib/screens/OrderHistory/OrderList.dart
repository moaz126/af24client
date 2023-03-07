import 'package:af24client/models/OrderListModel.dart';
import 'package:af24client/Api/globalVariables.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:http/http.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

import '../../Api/Auth_af24.dart';
import '../../localization/languages/languages.dart';
import 'OrderDetails.dart';

class OrderList extends StatefulWidget {
  @override
  _OrderList createState() => _OrderList();
}

class _OrderList extends State<OrderList> {
  int pressed = 0;

  List<String> buttontext = [];
  String now = DateFormat("dd-MM-yyyy").format(DateTime.now());
  List<OrderListModel> neworderlist = [];
  List<OrderListModel> pendingOrderList = [];
  List<OrderListModel> processingOrderList = [];
  List<OrderListModel> confiremedOrderList = [];
  List<OrderListModel> deliverdOrderList = [];
  List<OrderListModel> canceledOrderList = [];

  List<OrderListModel> dateOrderList = [];
  List<OrderListModel> selectedOrderList = [];

  List<TextEditingController> trackController = [];
  List<TextEditingController> deliveryController = [];
  DateTime selectdate = DateTime.now();
  int count = 0;
  bool searchDate = false;

  bool loader = false;

  filterListByStatus() {
    print('123');
    // setState(() {});
    for (var model in orderList) {
      if (model.orderStatus == 'pending') {
        pendingOrderList.add(model);
      } else if (model.orderStatus == 'processing') {
        processingOrderList.add(model);
      } else if (model.orderStatus == 'confirmed') {
        confiremedOrderList.add(model);
      } else if (model.orderStatus == 'delivered') {
        deliverdOrderList.add(model);
      } else if (model.orderStatus == 'confirmed') {
        confiremedOrderList.add(model);
      } else if (model.orderStatus == 'canceled') {
        canceledOrderList.add(model);
      }
    }

    // setState(() {});
    print('456');
  }

  generateController() {
    trackController.clear();
    for (var i = 0; i < selectedOrderList.length; i++) {
      print('controller');
      print(i);
      trackController.add(TextEditingController());
      deliveryController.add(TextEditingController());
    }
  }

  filterbyDate(DateTime date) {
    pendingOrderList.clear();
    processingOrderList.clear();
    confiremedOrderList.clear();
    deliverdOrderList.clear();
    canceledOrderList.clear();
    for (var model in orderList) {
      if (date.toString().substring(0, 10) ==
              model.createdAt.toString().substring(0,
                  10) /* &&
              model.orderStatus == 'pending' ||
          model.orderStatus == 'processing' ||
          model.orderStatus == 'confirmed' ||
          model.orderStatus == 'delivered' ||
          model.orderStatus == 'canceled' */
          ) {
        dateOrderList.add(model);
      }
      print('dateOrderList');
      print(dateOrderList.length);

      if (date.toString().substring(0, 10) ==
              model.createdAt.toString().substring(0, 10) &&
          model.orderStatus == 'pending') {
        print('yes');
        pendingOrderList.add(model);
      } else if (date.toString().substring(0, 10) ==
              model.createdAt.toString().substring(0, 10) &&
          model.orderStatus == 'processing') {
        processingOrderList.add(model);
      } else if (date.toString().substring(0, 10) ==
              model.createdAt.toString().substring(0, 10) &&
          model.orderStatus == 'confirmed') {
        confiremedOrderList.add(model);
      } else if (date.toString().substring(0, 10) ==
              model.createdAt.toString().substring(0, 10) &&
          model.orderStatus == 'delivered') {
        deliverdOrderList.add(model);
      } else if (date.toString().substring(0, 10) ==
              model.createdAt.toString().substring(0, 10) &&
          model.orderStatus == 'canceled') {
        canceledOrderList.add(model);
      } /*  else {
        dateOrderList.add(model);
      } */
    }
  }

  callApi() async {
    setState(() {
      loader = true;
    });

    await DataApiService.instance.getOrderList();
    selectedOrderList = orderList;
    await filterListByStatus();
    await generateController();
    setState(() {
      loader = false;
    });
  }

  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  Future<void> _pullRefresh() async {
    callApi();
    _refreshController.refreshCompleted();
  }

  bool loaderButton = false;
  int checkloader = 0;
  final spinkit = SpinKitSpinningLines(
    size: 5.h,
    color: Colors.black,
  );
  bool loadertable = false;
  final spinkittable = SpinKitSpinningLines(
    size: 5.h,
    color: Colors.black,
  );
  final saveSpinkit = SpinKitSpinningLines(
    size: 2.h,
    color: Colors.white,
  );

  @override
  void initState() {
    callApi();

    super.initState();
    buttontext = [
      'All',
      'Pending',
      'Processing',
      'Confirmed',
      'Delivered',
      'Cancelled',
    ];
  }

/*
  @override
  void dispose() {
    // TODO: implement dispose
    selectedOrderList.clear();

    super.dispose();
  } */

  @override
  Widget build(BuildContext context) {
    // loader = false;
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            leading: InkWell(
                onTap: () {
                  Get.back();
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                )),
            backgroundColor: Colors.white,
            title: Text(
              Languages.of(context)!.MY_ORDER,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    _pullRefresh();
                  },
                  icon: Icon(
                    Icons.refresh_rounded,
                    color: Colors.black,
                  ))
            ],
          ),
          body: loader
              ? spinkit
              : Guest == 1 ? Center(child: Text(Languages.of(context)!.GUEST_MODE,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17.sp),))
              : SafeArea(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 2.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                SizedBox(
                                  height: 3.h,
                                ),
                                Text(
                                  selectdate.toString().substring(0, 10),
                                  style: TextStyle(fontSize: 13.sp),
                                ),
                              ],
                            ),
                            Container(
                              child: Column(
                                children: [
                                  InkWell(
                                      onTap: () {
                                        DatePicker.showDatePicker(context,
                                            showTitleActions: true,
                                            minTime: DateTime(2018, 3, 5),
                                            maxTime: DateTime(2022, 12, 31),
                                            theme: DatePickerTheme(
                                                headerColor: Colors.grey[300],
                                                backgroundColor: Colors.black,
                                                itemStyle: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18),
                                                doneStyle: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16)),
                                            onChanged: (date) {
                                          print('change $date in time zone ' +
                                              date.timeZoneOffset.inHours
                                                  .toString());
                                        }, onConfirm: (date) async {
                                          setState(() {
                                            searchDate = true;
                                            loadertable = true;
                                            selectdate = date;
                                            // pressed = 0;
                                            filterbyDate(date);
                                            if (pressed == 0) {
                                              selectedOrderList = dateOrderList;
                                              generateController();
                                            }
                                            generateController();
                                            // selectedOrderList = dateOrderList;
                                            print('Confirem $date');
                                            loadertable = false;
                                          });

                                          // filterbydate();
                                        },
                                            currentTime: DateTime.now(),
                                            locale: LocaleType.en);
                                      },
                                      child: Icon(Icons.date_range)),
                                  Text(
                                    Languages.of(context)!.SEARCH_DATE,
                                    style: TextStyle(fontSize: 10.sp),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Container(
                        height: 5.h,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                for (int i = 0; i < buttontext.length; i++)
                                  Container(
                                    height: 35,
                                    width: 120,
                                    child: InkWell(
                                      onTap: () async {
                                        // filterListByStatus();
                                        setState(() {
                                          pressed = i;
                                          loader = true;
                                          if (pressed == 1) {
                                            selectedOrderList =
                                                pendingOrderList;
                                            generateController();
                                            print(pendingOrderList.length);
                                          } else if (pressed == 2) {
                                            selectedOrderList =
                                                processingOrderList;
                                            generateController();
                                          } else if (pressed == 3) {
                                            selectedOrderList =
                                                confiremedOrderList;
                                            generateController();
                                          } else if (pressed == 4) {
                                            selectedOrderList =
                                                deliverdOrderList;
                                            generateController();
                                          } else if (pressed == 5) {
                                            selectedOrderList =
                                                canceledOrderList;
                                            generateController();
                                          } else {
                                            if (searchDate) {
                                              selectedOrderList = dateOrderList;
                                              generateController();
                                            } else {
                                              selectedOrderList = orderList;
                                              generateController();
                                            }
                                          }
                                          loader = false;
                                          print(pressed);
                                        });
                                      },
                                      child: Card(
                                        color: (pressed == i)
                                            ? Colors.blue
                                            : Colors.white,
                                        child: Center(
                                            child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 4.0, right: 4),
                                          child: Text(
                                            buttontext[i],
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: (pressed == i)
                                                  ? Colors.white
                                                  : Colors.blue,
                                            ),
                                          ),
                                        )),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: selectedOrderList.isEmpty
                            ? Center(
                                child:
                                    Text(Languages.of(context)!.NO_ORDER_FOUND),
                              )
                            : loadertable
                                ? spinkittable
                                : HorizontalDataTable(
                                    leftHandSideColumnWidth: 80,
                                    rightHandSideColumnWidth: 980,
                                    isFixedHeader: true,
                                    headerWidgets: _getTitleWidget(),
                                    leftSideItemBuilder:
                                        _generateFirstColumnRow,
                                    rightSideItemBuilder:
                                        _generateRightHandSideColumnRow,
                                    itemCount: selectedOrderList.length,
                                    rowSeparatorWidget: const Divider(
                                      color: Colors.black54,
                                      height: 1.0,
                                      thickness: 0.0,
                                    ),
                                    leftHandSideColBackgroundColor:
                                        Color(0xFFFFFFFF),
                                    rightHandSideColBackgroundColor:
                                        Color(0xFFFFFFFF),
                                  ),
                      ),
                    ],
                  ),
                )),
    );
  }

  List<Widget> _getTitleWidget() {
    return [
      _getTitleItemWidget('Order No.', 100),
      _getTitleItemWidget('Date of Order', 100),
      _getTitleItemWidget('User ID', 100),
      _getTitleItemWidget('Tracking ID', 90),
      _getTitleItemWidget('Delivery Company', 150),
      _getTitleItemWidget('Status', 100),
      _getTitleItemWidget('Delivery Method', 130),
      _getTitleItemWidget('Price', 100),
      _getTitleItemWidget('Delivery', 100),
      _getTitleItemWidget(Languages.of(context)!.ORDERS_DETAILS, 100),
    ];
  }

  Widget _getTitleItemWidget(String label, double width) {
    return Container(
      width: width,
      height: 56,
      padding: EdgeInsets.fromLTRB(7, 0, 0, 0),
      alignment: Alignment.centerLeft,
      child: Center(
          child: Text(label, style: TextStyle(fontWeight: FontWeight.bold))),
    );
  }

  Widget _generateFirstColumnRow(BuildContext context, int index) {
    return Container(
      child: Center(child: Text('${selectedOrderList[index].id}')),
      width: 100,
      height: 52,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
    );
  }

  Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
    return Row(
      children: <Widget>[
        Container(
          child: Row(
            children: <Widget>[
              Center(
                  child: Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Text(selectedOrderList[index]
                    .createdAt
                    .toString()
                    .substring(0, 10)),
              ))
            ],
          ),
          width: 100,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        Container(
          child: Center(
              child: Text(selectedOrderList[index].customerId.toString())),
          width: 100,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        Container(
          child: Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: selectedOrderList[index].thirdPartyDeliveryTrackingId == null
                ? Center(child: Text('--'))
                : Center(
                    child: Text(selectedOrderList[index]
                        .thirdPartyDeliveryTrackingId
                        .toString())),
          ),
          width: 100,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        Container(
          child: Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: selectedOrderList[index].deliveryServiceName == null
                ? Center(child: Text('--'))
                : Center(
                    child: Text(selectedOrderList[index]
                        .deliveryServiceName
                        .toString())),
          ),
          width: 150,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        Container(
          child: Row(
            children: <Widget>[
              Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: Text(selectedOrderList[index]
                        .paymentStatus
                        .toString()),
                  ))
            ],
          ),
          width: 100,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        Container(
          child: Row(
            children: <Widget>[
              Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: Text(selectedOrderList[index]
                        .paymentMethod
                        .toString()),
                  ))
            ],
          ),
          width: 130,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        Container(
          child: Row(
            children: <Widget>[
              Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: Text(selectedOrderList[index]
                        .orderAmount
                        .toString()),
                  ))
            ],
          ),
          width: 100,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        Container(
          child: Row(
            children: <Widget>[
              Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: Text(selectedOrderList[index]
                        .orderStatus
                        .toString()),
                  ))
            ],
          ),
          width: 100,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        /*    Container(
          width: 100,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
          child: Center(child: Text('${selectedOrderList[index].orderAmount}')),
        ),
        Container(
          child: Center(
              child: Text(selectedOrderList[index].orderStatus.toString())),
          width: 100,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ), */
        Container(
          child: Center(
            child: SizedBox(
              height: 37,
              width: 75,
              child: ElevatedButton(
                onPressed: () async {
                  /*  await DataApiService.instance.getSellerOrderDetails(
                      selectedOrderList[index].id!.toInt()); */
                  Get.to(() =>
                      OrderDetails(selectedOrderList[index].id.toString()));
                  // selectedOrderList.clear();
                },
                child: Text(
                  Languages.of(context)!.DETAILS,
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
                style: ElevatedButton.styleFrom(primary: Colors.blue),
              ),
            ),
          ),
          width: 100,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
      ],
    );
  }
}
