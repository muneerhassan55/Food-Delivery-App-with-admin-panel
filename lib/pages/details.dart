import 'package:flutter/material.dart';

import '../widgets/widget_support.dart';

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  int a = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Colors.black,
            )),
        Image.asset(
          'images/salad2.png',
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height / 2.5,
          fit: BoxFit.fill,
        ),
        Row(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Mediterrranean',
                  style: AppWidget.semiBoldTextFieldStyle(),
                ),
                Text(
                  'Chickpea Salad',
                  style: AppWidget.boldTextFieldStyle(),
                ),
              ],
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                if (a > 1) {
                  --a;
                }

                setState(() {});
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.black,
                ),
                child: Icon(
                  Icons.remove,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              a.toString(),
              style: AppWidget.semiBoldTextFieldStyle(),
            ),
            SizedBox(
              width: 20,
            ),
            GestureDetector(
              onTap: () {
                ++a;
                setState(() {});
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.black,
                ),
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
        Text(
            maxLines: 3,
            "Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborumnumquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentiumoptio, eaque rerum! Provident similique accusantium nemo autem. Veritatisobcaecati tenetur iure eius earum ut molestias architecto voluptate aliquamnihil, eveniet aliquid culpa officia aut! Impedit sit sunt quaerat, odit,"),
        SizedBox(
          height: 30,
        ),
        Row(
          children: [
            Text(
              'Delivery Time',
              style: AppWidget.semiBoldTextFieldStyle(),
            ),
            SizedBox(
              width: 25,
            ),
            Icon(
              Icons.alarm,
              color: Colors.black54,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              '30 min',
              style: AppWidget.semiBoldTextFieldStyle(),
            )
          ],
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.only(bottom: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  'Total Price',
                  style: AppWidget.semiBoldTextFieldStyle(),
                ),
                Text(
                  '\$28',
                  style: AppWidget.semiBoldTextFieldStyle(),
                ),
              ]),
              Container(
                width: MediaQuery.of(context).size.width / 2,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Add to cart",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontFamily: 'Poppins'),
                    ),
                    SizedBox(
                      width: 30.0,
                    ),
                    Container(
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(8)),
                      child: Icon(
                        Icons.shopping_cart_outlined,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ]),
    ));
  }
}
