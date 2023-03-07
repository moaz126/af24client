import 'package:af24client/screens/AddToFavouritesScreen/AddToFavouriteScreen.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../Api/Auth_af24.dart';
import '../../Provider/cartProvider.dart';
import '../../localization/languages/languages.dart';
import '../../Api/globalVariables.dart';
import '../Brand/brand.dart';
import '../Cart/cart.dart';
import '../LoginCreateAccount/login.dart';


class FavouritesListScreen extends StatefulWidget {
  const FavouritesListScreen({Key? key}) : super(key: key);

  @override
  State<FavouritesListScreen> createState() => _FavouritesListScreenState();
}

class _FavouritesListScreenState extends State<FavouritesListScreen> {
  fun() async {
    setState(() {
      loader = true;
    });
    await DataApiService.instance.getFavouritesSellersList();
    setState(() {
      loader = false;
    });
    await DataApiService.instance.getCartCount(sellerinfo!.id!.toInt());
    setState(() {

    });
  }
  initializeButtonLoader(){
    for(int i=0; i<allSellers.length; i++)
    {
      ButtonLoader.add(false);
    }
  }
  bool CheckFavourite(int index){
    print(index);

    for(int i=0; i<AddToFavouriteSellersButton.length;i++)
    {
      if(AddToFavouriteSellersButton[i].toString()==allSellers[index].sellerId.toString())
      {
        print('Match');
        // print('Test');
        // print(allSellers[index].id.toString());
        // print(AddToFavouriteSellersButton[i]);
        return true;
      }
    }
    return false;
  }
  List<bool> ButtonLoader = [false];
  bool loader = false;
  final spinkit = SpinKitSpinningLines(
    size: 5.h,
    color: Colors.black,
  );
  final Buttonspinkit = SpinKitSpinningLines(
    size: 3.h,
    color: Colors.white,
  );
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
  @override
  initState() {
    // TODO: implement initState
    fun();
    initializeButtonLoader();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return
      // Scaffold(
      //   appBar: AppBar(
      //     backgroundColor: Colors.white,
      //     titleSpacing: 0,
      //     elevation: 0,
      //     leading: InkWell(
      //       onTap: (){
      //         Get.back();
      //       },
      //       child:
      //       Padding(
      //         padding: const EdgeInsets.only(top: 8.0),
      //         child: Icon(
      //           Icons.arrow_back_ios,
      //           size: 23,
      //           color: Colors.black,
      //           //Icon Size
      //         ),
      //       ),
      //     ),
      //     title: Padding(
      //       padding: const EdgeInsets.only(top: 9.0),
      //       child: Text("Favourite Sellers",
      //           style:
      //           TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      //     ),
      //     actions: [
      //       SizedBox(
      //         width: 3.w,
      //       ),
      //       InkWell(
      //         onTap: () async {
      //           Get.to(Carts());
      //         },
      //         child: Padding(
      //           padding: const EdgeInsets.only(bottom: 16),
      //           child: Stack(
      //             alignment: Alignment.bottomRight,
      //             children: [
      //               Image.asset(
      //                 'assets/icons/Seller app icon (6).png',
      //                 height: 3.7.h,
      //               ),
      //               Container(
      //                 height: 1.5.h,
      //                 padding: EdgeInsets.only(left: 1.5,right: 1),
      //                 decoration: BoxDecoration(
      //                     color: Colors.orange[700],
      //                     borderRadius: BorderRadius.circular(100)
      //                 ),
      //                 //color: Colors.blue,
      //                 child:
      //                 Guest == 1 ?
      //                 Text(
      //                   "0",
      //                   style: TextStyle(color: Colors.black, fontSize: 8),
      //                 )
      //                     :
      //                 Text(
      //                   cartCount.toString(),
      //                   style: TextStyle(color: Colors.black, fontSize: 8),
      //                 ),
      //               )
      //             ],
      //           ),
      //         ),
      //       ),
      //       SizedBox(
      //         width: 10,
      //       ),
      //     ],
      //   ),
      //   body:
      //   loader == true ? spinkit :
      //   Padding(
      //     padding: const EdgeInsets.all(10.0),
      //     child: SingleChildScrollView(
      //       child: Column(
      //         children: [
      //           Row(
      //             children: [
      //               Padding(
      //                 padding: const EdgeInsets.only(left: 8.0),
      //                 child: Text('Favourite Sellers ('+'${favouritesList.length}'+')',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14.sp),),
      //               ),
      //             ],
      //           ),
      //           // GridView(
      //           //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //           //     crossAxisCount: 2,
      //           //     crossAxisSpacing: 5,
      //           //     mainAxisSpacing: 5,
      //           //   ),
      //           //   children: [
      //           //     Card(
      //           //       color: Colors.green,
      //           //       child: Text("1", style: TextStyle(color: Colors.white,fontSize: 30),),
      //           //     ),
      //           //     Card(
      //           //       color: Colors.green,
      //           //       child: Text("2", style: TextStyle(color: Colors.white,fontSize: 30),),
      //           //     ),
      //           //     Card(
      //           //       color: Colors.green,
      //           //       child: Text("3", style: TextStyle(color: Colors.white,fontSize: 30),),
      //           //     ),
      //           //     Card(
      //           //       color: Colors.green,
      //           //       child: Text("4", style: TextStyle(color: Colors.white,fontSize: 30),),
      //           //     ),
      //           //   ],
      //           // )
      //
      //
      //           GridView.builder(
      //             itemCount: favouritesList.length,
      //             itemBuilder: (BuildContext context, int index) {
      //               return Container(
      //                 child: Column(
      //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                   children: [
      //                     InkWell(
      //                       onTap: () async {
      //                         // await DataApiService.instance
      //                         //     .getSellerProductsList(allSellers[index].sellerId);
      //                         // Get.to(brand(index));
      //                       },
      //                       child: Container(
      //                         child: Column(
      //                           mainAxisAlignment: MainAxisAlignment.center,
      //                           crossAxisAlignment: CrossAxisAlignment.center,
      //                           children: [
      //                             ClipOval(
      //                               child:
      //                               CachedNetworkImage(
      //                                 height: 9.h,
      //                                 width: 9.h,
      //                                 imageUrl:
      //                                 'https://becknowledge.com/af24/public/storage/shop/' + favouritesList[index].image,
      //                                 fit: BoxFit.cover,
      //                                 placeholder: (context, url) =>
      //                                     shimmerCategoryLoader(),
      //                                 errorWidget:
      //                                     (context, url, error) =>
      //                                     Image.asset(
      //                                       'assets/images/NoPic.jpg',
      //                                       height: 9.h,
      //                                       width: 9.h,
      //                                     ),
      //                               ),
      //                               // allSellers[index].image.toString() == "def.png" || allSellers[index].image.toString() == "" ?
      //                               // Image.asset('assets/icons/Seller app icon (8).png',height: 9.h,width: 9.h,fit: BoxFit.cover,)
      //                               //     :
      //                               // Image.network(
      //                               //     height: 9.h,
      //                               //     width: 9.h,
      //                               //     fit: BoxFit.cover,
      //                               //     'https://becknowledge.com/af24/public/storage/shop/' +
      //                               //         allSellers[index].image),
      //                             ),
      //                             SizedBox(
      //                               height: 1.0.h,
      //                             ),
      //                             Row(
      //                               mainAxisAlignment:
      //                               MainAxisAlignment.center,
      //                               children: [
      //                                 Text(
      //                                   '${favouritesList[index].name}',
      //                                   style: TextStyle(
      //                                       fontWeight: FontWeight.bold,
      //                                       fontSize: 9.sp),
      //                                   maxLines: 1,
      //                                   overflow: TextOverflow.ellipsis,
      //                                 ),
      //                               ],
      //                             ),
      //                           ],
      //                         ),
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //               );
      //             },
      //             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //               crossAxisCount: 4,
      //               mainAxisSpacing: 1,
      //               crossAxisSpacing: 1,
      //               mainAxisExtent: 17.h,
      //             ),
      //             shrinkWrap: true,
      //             physics: ScrollPhysics(),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ),
      // );
      Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          titleSpacing: 0,
          elevation: 0,
          leading: InkWell(
            onTap: (){
              Navigator.pushReplacement<void, void>(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const AddToFavouritesScreen(),
                ),
              );
            },
            child:
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Icon(
                Icons.arrow_back_ios,
                size: 23,
                color: Colors.black,
                //Icon Size
              ),
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(top: 9.0),
            child: Text(Languages.of(context)!.FAVOURITE_SELLERS,
                style:
                TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          ),
          actions: [
            SizedBox(
              width: 3.w,
            ),
            InkWell(
              onTap: () async {
                if(Guest == 1)
                {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.INFO,
                    animType: AnimType.BOTTOMSLIDE,
                    title: Languages.of(context)!.GUEST_MODE,
                    desc: Languages.of(context)!.LOGIN_FIRST,
                    btnCancelOnPress: (){},
                    btnCancelText: Languages.of(context)!.CANCEL,
                    btnOkText: Languages.of(context)!.LOGIN,
                    btnOkOnPress: () {
                      Get.to(()=>Login());
                    },
                  ).show();
                }
                else {
                  Get.to(() => FavouritesListScreen());
                }
              },
              child: Consumer<MyCart>(builder: (context, value, child) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 11.0),
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Image.asset(
                        'assets/icons/Seller app icon (6).png',
                        height: 4.5.h,
                      ),
                      // Container(
                      //   height: 12,
                      //   width: 12,
                      //   decoration: BoxDecoration(
                      //       color: Colors.orange[700],
                      //       borderRadius: BorderRadius.circular(10)),
                      // ),
                      Container(
                        height: 1.5.h,
                        padding: EdgeInsets.only(left: 1.5, right: 1),
                        decoration: BoxDecoration(
                            color: Colors.orange[700],
                            borderRadius: BorderRadius.circular(100)),
                        //color: Colors.blue,
                        child: Guest == 1
                            ? Text(
                          "0",
                          style:
                          TextStyle(color: Colors.black, fontSize: 8),
                        )
                            : Text(
                          value.getCartLength().toString(),
                          style:
                          TextStyle(color: Colors.black, fontSize: 8),
                        ),
                      )
                    ],
                  ),
                );
              }),
              // child: Center(child: Text("View Favouriets",style: TextStyle(color: Colors.black,fontSize: 7.sp),)),
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
        body:
        loader == true ? spinkit :
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(Languages.of(context)!.FAVOURITE_SELLERS+ ' ('+'${favouritesList.length}'+')',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14.sp),),
                    ),
                  ],
                ),
                // GridView(
                //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //     crossAxisCount: 2,
                //     crossAxisSpacing: 5,
                //     mainAxisSpacing: 5,
                //   ),
                //   children: [
                //     Card(
                //       color: Colors.green,
                //       child: Text("1", style: TextStyle(color: Colors.white,fontSize: 30),),
                //     ),
                //     Card(
                //       color: Colors.green,
                //       child: Text("2", style: TextStyle(color: Colors.white,fontSize: 30),),
                //     ),
                //     Card(
                //       color: Colors.green,
                //       child: Text("3", style: TextStyle(color: Colors.white,fontSize: 30),),
                //     ),
                //     Card(
                //       color: Colors.green,
                //       child: Text("4", style: TextStyle(color: Colors.white,fontSize: 30),),
                //     ),
                //   ],
                // )
                // favouritesList.length != 0 ?
                GridView.builder(
                  itemCount: favouritesList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () async {
                              // await DataApiService.instance
                              //     .getSellerProductsList(allSellers[index].sellerId);
                              Get.to(brand(index));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 25.0),
                                  child: Container(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        ClipOval(
                                          child:
                                          CachedNetworkImage(
                                            height: 9.h,
                                            width: 9.h,
                                            imageUrl:
                                            'https://becknowledge.com/af24/public/storage/shop/' + favouritesList[index].image,
                                            fit: BoxFit.cover,
                                            placeholder: (context, url) =>
                                                shimmerCategoryLoader(),
                                            errorWidget:
                                                (context, url, error) =>
                                                Image.asset(
                                                  'assets/images/NoPic.jpg',
                                                  height: 9.h,
                                                  width: 9.h,
                                                ),
                                          ),
                                          // allSellers[index].image.toString() == "def.png" || allSellers[index].image.toString() == "" ?
                                          // Image.asset('assets/icons/Seller app icon (8).png',height: 9.h,width: 9.h,fit: BoxFit.cover,)
                                          //     :
                                          // Image.network(
                                          //     height: 9.h,
                                          //     width: 9.h,
                                          //     fit: BoxFit.cover,
                                          //     'https://becknowledge.com/af24/public/storage/shop/' +
                                          //         allSellers[index].image),
                                        ),
                                        SizedBox(
                                          height: 1.0.h,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              '${favouritesList[index].name}',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 9.sp),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 25.0),
                                  child: SizedBox(
                                    width: 43.w,
                                    child: ElevatedButton(
                                      onPressed: () async {
                                        if(Guest == 1) {
                                          AwesomeDialog(
                                            context: context,
                                            dialogType: DialogType.INFO,
                                            animType: AnimType.BOTTOMSLIDE,
                                            title: Languages.of(context)!.LOGIN,
                                            desc: Languages.of(context)!.LOGIN_FIRST,
                                            btnCancelOnPress: (){},
                                            btnCancelText: Languages.of(context)!.CANCEL,
                                            btnOkText: Languages.of(context)!.LOGIN,
                                            btnOkOnPress: () {
                                              Get.to(()=>Login());
                                            },
                                          ).show();
                                        }
                                        else
                                        {
                                          setState(() {
                                            ButtonLoader[index] = true;
                                          });
                                          await DataApiService.instance.addToFavourites(favouritesList[index].seller_id.toString());
                                          await DataApiService.instance.getFavouritesSellersList();
                                          setState(() {

                                          });
                                          setState(() {
                                            ButtonLoader[index] = false;
                                          });
                                          StatusCode != '200'
                                              ? AwesomeDialog(
                                            context: context,
                                            dialogType:
                                            DialogType.ERROR,
                                            animType: AnimType
                                                .BOTTOMSLIDE,
                                            title: Languages.of(context)!.ERROR,
                                            desc: Languages.of(context)!.ERROR,
                                            btnOkOnPress: () {},
                                          ).show()
                                              : AwesomeDialog(
                                            context: context,
                                            dialogType:
                                            DialogType.SUCCES,
                                            animType: AnimType
                                                .BOTTOMSLIDE,
                                            title: Languages.of(context)!.SUCCESS,
                                            desc:
                                            AddToFavouriteResponse,
                                            btnOkOnPress: () {
                                              if(favouritesList.length == 0)
                                                {
                                                  Navigator.pushReplacement<void, void>(
                                                    context,
                                                    MaterialPageRoute<void>(
                                                      builder: (BuildContext context) => const AddToFavouritesScreen(),
                                                    ),
                                                  );
                                                }
                                            },
                                          ).show();
                                        }
                                      },
                                      child:
                                      ButtonLoader[index] == true ? Buttonspinkit :
                                      Text(Languages.of(context)!.REMOVE_FAVOURITES,maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 10.sp),),
                                      style: ButtonStyle(
                                          backgroundColor:
                                          MaterialStateProperty.all(Colors.black)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: 1,
                    crossAxisSpacing: 1,
                    mainAxisExtent: 17.h,
                  ),
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                )
                    // :
                    // Center(child: Padding(
                    //   padding: const EdgeInsets.only(top: 250.0,bottom: 250.0),
                    //   child: Text("No favourite sellers found."),
                    // )),
              ],
            ),
          ),
        ),
      );
  }
}
