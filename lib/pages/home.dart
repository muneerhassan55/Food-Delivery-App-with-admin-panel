// // ignore_for_file: prefer_const_constructors

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:food_delivery_app/services/database.dart';
// import 'package:google_fonts/google_fonts.dart';

// import '../widgets/widget_support.dart';
// import 'details.dart';

// class Home extends StatefulWidget {
//   const Home({super.key});

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   bool icecream = false, pizza = false, burger = false, salad = false;
//   Stream? foodItemStream;

//   @override
//   void initState() {
//     super.initState();
//   }

//   Widget allItems() {
//     return FutureBuilder(
//         future: DatabaseMethods().getFoodItem('Burger'),
//         builder: (ctx, snapshotData) {
//           if (snapshotData.hasError) {
//             return Center(child: Text('Error: ${snapshotData.error}'));
//           }

//           if (!snapshotData.hasData) {
//             return Center(child: CircularProgressIndicator());
//           }

//           return StreamBuilder(
//               stream: snapshotData.data,
//               builder: (context, AsyncSnapshot snapshot) {
//                 if (snapshot.hasError) {
//                   return Center(child: Text('Error: ${snapshot.error}'));
//                 }

//                 if (!snapshot.hasData) {
//                   return Center(child: CircularProgressIndicator());
//                 }

//                 return ListView.builder(
//                   padding: EdgeInsets.zero,
//                   itemCount: snapshot.data.docs.length,
//                   shrinkWrap: true,
//                   scrollDirection: Axis.horizontal,
//                   itemBuilder: (context, index) {
//                     DocumentSnapshot ds = snapshot.data.docs[index];
//                     return GestureDetector(
//                       onTap: () {
//                         Navigator.push(context,
//                             MaterialPageRoute(builder: (context) => Details()));
//                       },
//                       child: Padding(
//                         padding: const EdgeInsets.only(right: 10),
//                         child: Container(
//                           margin: EdgeInsets.all(4),
//                           child: Material(
//                             borderRadius: BorderRadius.circular(20),
//                             elevation: 5,
//                             child: Container(
//                               padding: EdgeInsets.all(14),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   ClipRRect(
//                                     borderRadius: BorderRadius.circular(20),
//                                     child: Image.network(
//                                       ds['Image'],
//                                       height: 150,
//                                       width: 150,
//                                       fit: BoxFit.cover,
//                                     ),
//                                   ),
//                                   Text(
//                                     ds['Name'],
//                                     style: AppWidget.semiBoldTextFieldStyle(),
//                                   ),
//                                   SizedBox(height: 5),
//                                   Text(
//                                     ds['Detail'],
//                                     style: AppWidget.LightTextFieldStyle(),
//                                   ),
//                                   SizedBox(height: 5),
//                                   Text(
//                                     '\$' + ds['Price'],
//                                     style: AppWidget.semiBoldTextFieldStyle(),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 );
//               });
//         });
//   }

//   Widget allItemsVertically() {
//     return FutureBuilder(
//         future: DatabaseMethods().getFoodItem('Burger'),
//         builder: (ctx, snapshotData) {
//           if (snapshotData.hasError) {
//             return Center(child: Text('Error: ${snapshotData.error}'));
//           }

//           if (!snapshotData.hasData) {
//             return Center(child: CircularProgressIndicator());
//           }

//           return StreamBuilder(
//               stream: snapshotData.data,
//               builder: (context, AsyncSnapshot snapshot) {
//                 if (snapshot.hasError) {
//                   return Center(child: Text('Error: ${snapshot.error}'));
//                 }

//                 if (!snapshot.hasData) {
//                   return Center(child: CircularProgressIndicator());
//                 }

//                 return ListView.builder(
//                   padding: EdgeInsets.zero,
//                   itemCount: snapshot.data.docs.length,
//                   shrinkWrap: true,
//                   scrollDirection: Axis.vertical,
//                   itemBuilder: (context, index) {
//                     DocumentSnapshot ds = snapshot.data.docs[index];
//                     return GestureDetector(
//                       onTap: () {
//                         Navigator.push(context,
//                             MaterialPageRoute(builder: (context) => Details()));
//                       },
//                       child: Padding(
//                         padding: const EdgeInsets.only(top: 10, bottom: 10),
//                         child: Material(
//                           elevation: 5,
//                           borderRadius: BorderRadius.circular(20),
//                           child: Container(
//                             padding: EdgeInsets.all(5),
//                             child: Row(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 ClipRRect(
//                                   borderRadius: BorderRadius.circular(20),
//                                   child: Image.network(
//                                     ds['Image'],
//                                     height: 120,
//                                     width: 120,
//                                     fit: BoxFit.cover,
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   width: 20,
//                                 ),
//                                 Column(
//                                   children: [
//                                     Container(
//                                       width:
//                                           MediaQuery.sizeOf(context).width / 2,
//                                       child: Text(
//                                         ds['Name'],
//                                         style:
//                                             AppWidget.semiBoldTextFieldStyle(),
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       height: 5,
//                                     ),
//                                     Container(
//                                       width:
//                                           MediaQuery.sizeOf(context).width / 2,
//                                       child: Text(
//                                         ds['Detail'],
//                                         style: AppWidget.LightTextFieldStyle(),
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       height: 5,
//                                     ),
//                                     Container(
//                                       width:
//                                           MediaQuery.sizeOf(context).width / 2,
//                                       child: Text(
//                                         '\$' + ds['Price'],
//                                         style:
//                                             AppWidget.semiBoldTextFieldStyle(),
//                                       ),
//                                     ),
//                                   ],
//                                 )
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 );
//               });
//         });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         padding: EdgeInsets.only(top: 50, left: 20, right: 20),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     'Heloo Muneer',
//                     style: AppWidget.boldTextFieldStyle(),
//                   ),
//                   Container(
//                     padding: EdgeInsets.all(3),
//                     decoration: BoxDecoration(
//                       color: Colors.black,
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Icon(
//                       Icons.shopping_cart_outlined,
//                       color: Colors.white,
//                     ),
//                   )
//                 ],
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Text(
//                 'Discover food',
//                 style: AppWidget.HeadLineboldTextFieldStyle(),
//               ),
//               Text(
//                 'Discover and take great food ',
//                 style: AppWidget.LightTextFieldStyle(),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               showItem(),
//               SizedBox(
//                 height: 20,
//               ),
//               Container(height: 270, child: allItems()),
//               SizedBox(
//                 height: 30,
//               ),
//               allItemsVertically(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget showItem() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         GestureDetector(
//           onTap: () async {
//             icecream = true;
//             pizza = false;
//             burger = false;
//             salad = false;
//             foodItemStream = await DatabaseMethods().getFoodItem("Ice-cream");
//             setState(() {});
//           },
//           child: Material(
//             elevation: 5,
//             borderRadius: BorderRadius.circular(10),
//             child: Container(
//               decoration: BoxDecoration(
//                   color: icecream ? Colors.black : Colors.white,
//                   borderRadius: BorderRadius.circular(10)),
//               padding: EdgeInsets.all(8),
//               child: Image.asset(
//                 'images/ice-cream.png',
//                 color: icecream ? Colors.white : Colors.black,
//                 height: 40,
//                 width: 40,
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//         ),
//         GestureDetector(
//           onTap: () async {
//             icecream = false;
//             pizza = true;
//             burger = false;
//             salad = false;
//             foodItemStream = await DatabaseMethods().getFoodItem("Pizza");
//             setState(() {});
//           },
//           child: Material(
//             elevation: 5,
//             borderRadius: BorderRadius.circular(10),
//             child: Container(
//               decoration: BoxDecoration(
//                   color: pizza ? Colors.black : Colors.white,
//                   borderRadius: BorderRadius.circular(10)),
//               padding: EdgeInsets.all(8),
//               child: Image.asset(
//                 color: pizza ? Colors.white : Colors.black,
//                 'images/pizza.png',
//                 height: 40,
//                 width: 40,
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//         ),
//         GestureDetector(
//           onTap: () async {
//             icecream = false;
//             pizza = false;
//             salad = true;
//             burger = false;
//             foodItemStream = await DatabaseMethods().getFoodItem("Salad");
//             setState(() {});
//           },
//           child: Material(
//             elevation: 5,
//             borderRadius: BorderRadius.circular(10),
//             child: Container(
//               decoration: BoxDecoration(
//                   color: salad ? Colors.black : Colors.white,
//                   borderRadius: BorderRadius.circular(10)),
//               padding: EdgeInsets.all(8),
//               child: Image.asset(
//                 color: salad ? Colors.white : Colors.black,
//                 'images/salad.png',
//                 height: 40,
//                 width: 40,
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//         ),
//         GestureDetector(
//           onTap: () async {
//             icecream = false;
//             pizza = false;

//             salad = false;
//             burger = true;
//             foodItemStream = await DatabaseMethods().getFoodItem("Burger");
//             setState(() {});
//           },
//           child: Material(
//             elevation: 5,
//             borderRadius: BorderRadius.circular(10),
//             child: Container(
//               decoration: BoxDecoration(
//                   color: burger ? Colors.black : Colors.white,
//                   borderRadius: BorderRadius.circular(10)),
//               padding: EdgeInsets.all(8),
//               child: Image.asset(
//                 color: burger ? Colors.white : Colors.black,
//                 'images/burger.png',
//                 height: 40,
//                 width: 40,
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

//new
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/services/database.dart';
import '../widgets/widget_support.dart';
import 'details.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String selectedCategory = 'Ice-cream';
  Stream? foodItemStream;

  @override
  void initState() {
    super.initState();
    loadFoodItems();
  }

  void loadFoodItems() async {
    foodItemStream = await DatabaseMethods().getFoodItem(selectedCategory);
    setState(() {});
  }

  Widget allItems() {
    return StreamBuilder(
        stream: foodItemStream,
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
                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
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
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                ds['Image'],
                                height: 150,
                                width: 150,
                                fit: BoxFit.cover,
                              ),
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
                ),
              );
            },
          );
        });
  }

  Widget allItemsVertically() {
    return StreamBuilder(
        stream: foodItemStream,
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
            itemBuilder: (context, index) {
              DocumentSnapshot ds = snapshot.data.docs[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Details()));
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      padding: EdgeInsets.all(5),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              ds['Image'],
                              height: 120,
                              width: 120,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            children: [
                              Container(
                                width: MediaQuery.sizeOf(context).width / 2,
                                child: Text(
                                  ds['Name'],
                                  style: AppWidget.semiBoldTextFieldStyle(),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                width: MediaQuery.sizeOf(context).width / 2,
                                child: Text(
                                  ds['Detail'],
                                  style: AppWidget.LightTextFieldStyle(),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                width: MediaQuery.sizeOf(context).width / 2,
                                child: Text(
                                  '\$' + ds['Price'],
                                  style: AppWidget.semiBoldTextFieldStyle(),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 50, left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Hello Muneer',
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
                SizedBox(height: 20),
                Text(
                  'Discover food',
                  style: AppWidget.HeadLineboldTextFieldStyle(),
                ),
                Text(
                  'Discover and take great food',
                  style: AppWidget.LightTextFieldStyle(),
                ),
                SizedBox(height: 20),
                showItem(),
                SizedBox(height: 20),
                Container(height: 270, child: allItems()),
                SizedBox(
                  height: 20,
                ),
                allItemsVertically()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget showItem() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        categoryIcon('Ice-cream', 'images/ice-cream.png'),
        categoryIcon('Pizza', 'images/pizza.png'),
        categoryIcon('Salad', 'images/salad.png'),
        categoryIcon('Burger', 'images/burger.png'),
      ],
    );
  }

  Widget categoryIcon(String category, String imagePath) {
    return GestureDetector(
      onTap: () {
        selectedCategory = category;
        loadFoodItems();
      },
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          decoration: BoxDecoration(
              color: selectedCategory == category ? Colors.black : Colors.white,
              borderRadius: BorderRadius.circular(10)),
          padding: EdgeInsets.all(8),
          child: Image.asset(
            imagePath,
            color: selectedCategory == category ? Colors.white : Colors.black,
            height: 40,
            width: 40,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
