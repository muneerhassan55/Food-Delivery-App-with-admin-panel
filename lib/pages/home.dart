// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/services/database.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/widget_support.dart';
import 'details.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool icecream = false, pizza = false, burger = false, salad = false;
  Stream? foodItemStream;

  @override
  void initState() {
    super.initState();
  }

  Widget allItems() {
    return FutureBuilder(
        future: DatabaseMethods().getFoodItem('Burger'),
        builder: (ctx, snapshotData) {
          if (snapshotData.hasError) {
            return Center(child: Text('Error: ${snapshotData.error}'));
          }

          if (!snapshotData.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          return StreamBuilder(
              stream: snapshotData.data,
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }

                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }

                return ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: snapshot.data.docs.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snapshot.data.docs[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Details()));
                      },
                      child: Container(
                        margin: EdgeInsets.all(4),
                        child: Material(
                          borderRadius: BorderRadius.circular(20),
                          elevation: 5,
                          child: Container(
                            padding: EdgeInsets.all(14),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.network(
                                  ds['Image'],
                                  height: 150,
                                  width: 150,
                                  fit: BoxFit.cover,
                                ),
                                Text(
                                  ds['Name'],
                                  style: AppWidget.semiBoldTextFieldStyle(),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  ds['Detail'],
                                  style: AppWidget.LightTextFieldStyle(),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  '\$' + ds['Price'],
                                  style: AppWidget.semiBoldTextFieldStyle(),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              });
        });
  }

  // Widget allItems() {
  //   return StreamBuilder(
  //       stream: foodItemStream,
  //       builder: (context, AsyncSnapshot snapshot) {
  //         print(snapshot.data);
  //         return snapshot.hasData
  //             ? ListView.builder(
  //                 padding: EdgeInsets.zero,
  //                 itemCount: snapshot.data.docs.length,
  //                 shrinkWrap: true,
  //                 scrollDirection: Axis.horizontal,
  //                 itemBuilder: (context, index) {
  //                   DocumentSnapshot ds = snapshot.data.docs[index];
  //                   return GestureDetector(
  //                     onTap: () {
  //                       Navigator.push(context,
  //                           MaterialPageRoute(builder: (context) => Details()));
  //                     },
  //                     child: Container(
  //                       margin: EdgeInsets.all(4),
  //                       child: Material(
  //                         borderRadius: BorderRadius.circular(20),
  //                         elevation: 5,
  //                         child: Container(
  //                           padding: EdgeInsets.all(14),
  //                           child: Column(
  //                             crossAxisAlignment: CrossAxisAlignment.start,
  //                             children: [
  //                               Image.network(
  //                                 ds['Image'],
  //                                 height: 150,
  //                                 width: 150,
  //                                 fit: BoxFit.cover,
  //                               ),
  //                               Text(
  //                                 ds['Name'],
  //                                 style: AppWidget.semiBoldTextFieldStyle(),
  //                               ),
  //                               SizedBox(
  //                                 height: 5,
  //                               ),
  //                               Text(
  //                                 ds['Detail'],
  //                                 style: AppWidget.LightTextFieldStyle(),
  //                               ),
  //                               SizedBox(
  //                                 height: 5,
  //                               ),
  //                               Text(
  //                                 '\$' + ds['Price'],
  //                                 style: AppWidget.semiBoldTextFieldStyle(),
  //                               )
  //                             ],
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                   );
  //                 })
  //             : Center(child: CircularProgressIndicator());
  //       });
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 50, left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Heloo Muneer',
                    style: AppWidget.boldTextFieldStyle(),
                  ),
                  Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Discover food',
                style: AppWidget.HeadLineboldTextFieldStyle(),
              ),
              Text(
                'Discover and take great food ',
                style: AppWidget.LightTextFieldStyle(),
              ),
              SizedBox(
                height: 20,
              ),
              showItem(),
              SizedBox(
                height: 20,
              ),
              Container(height: 270, child: allItems()),
              SizedBox(
                height: 30,
              ),
              Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  padding: EdgeInsets.all(5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'images/salad2.png',
                        height: 120,
                        width: 120,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: [
                          Container(
                            width: MediaQuery.sizeOf(context).width / 2,
                            child: Text(
                              'Miditerranean Chickepa Salad',
                              style: AppWidget.semiBoldTextFieldStyle(),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: MediaQuery.sizeOf(context).width / 2,
                            child: Text(
                              'Honey goot  cheese',
                              style: AppWidget.LightTextFieldStyle(),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: MediaQuery.sizeOf(context).width / 2,
                            child: Text(
                              '\$28',
                              style: AppWidget.semiBoldTextFieldStyle(),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  padding: EdgeInsets.all(5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'images/salad2.png',
                        height: 120,
                        width: 120,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: [
                          Container(
                            width: MediaQuery.sizeOf(context).width / 2,
                            child: Text(
                              'Miditerranean Chickepa Salad',
                              style: AppWidget.semiBoldTextFieldStyle(),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: MediaQuery.sizeOf(context).width / 2,
                            child: Text(
                              'Honey goot  cheese',
                              style: AppWidget.LightTextFieldStyle(),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: MediaQuery.sizeOf(context).width / 2,
                            child: Text(
                              '\$28',
                              style: AppWidget.semiBoldTextFieldStyle(),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget showItem() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            icecream = true;
            pizza = false;
            burger = false;
            salad = false;
            setState(() {});
          },
          child: Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                  color: icecream ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.all(8),
              child: Image.asset(
                'images/ice-cream.png',
                color: icecream ? Colors.white : Colors.black,
                height: 40,
                width: 40,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            icecream = false;
            pizza = true;
            burger = false;
            salad = false;
            setState(() {});
          },
          child: Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                  color: pizza ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.all(8),
              child: Image.asset(
                color: pizza ? Colors.white : Colors.black,
                'images/pizza.png',
                height: 40,
                width: 40,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            icecream = false;
            pizza = false;
            salad = true;
            burger = false;

            setState(() {});
          },
          child: Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                  color: salad ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.all(8),
              child: Image.asset(
                color: salad ? Colors.white : Colors.black,
                'images/salad.png',
                height: 40,
                width: 40,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            icecream = false;
            pizza = false;

            salad = false;
            burger = true;
            setState(() {});
          },
          child: Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                  color: burger ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.all(8),
              child: Image.asset(
                color: burger ? Colors.white : Colors.black,
                'images/burger.png',
                height: 40,
                width: 40,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
