import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ubereats_clone_ui/pages/home_page.dart';


class RootApp extends StatefulWidget {
  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      bottomNavigationBar: getFooter(),
    );
  }

  Widget getBody() {
    List<Widget> pages = [
      HomePage(),
      Center(
        child: Text(
          "Search Page",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      Center(
        child: Text(
          "Grocery Page",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      Center(
        child: Text(
          "Orders Page",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      Center(
        child: Text(
          "Account Page",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      )
    ];
    return IndexedStack(
      index: pageIndex,
      children: pages,
    );
  }

  Widget getFooter() {
    List bottomItems = [
      "assets/images/home_icon.svg",
      "assets/images/search_icon.svg",
      "assets/images/grocery_icon.svg",
      "assets/images/order_icon.svg",
      "assets/images/account_icon.svg"
    ];
    List textItems = ["Home", "Search", "Grocery", "Orders", "Account"];
    return Container(
      width: double.infinity,
      height: 77,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
              top: BorderSide(width: 2, color: Colors.black.withOpacity(0.06)))),
      child: Padding(
        padding:
        const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(textItems.length, (index) {
            return InkWell(
                onTap: () {
                  selectedTab(index);
                },
                child: Column(
                  children: [
                    SvgPicture.asset(
                      bottomItems[index],
                      width: 22,
                      color: pageIndex == index ? Colors.black : Colors.grey,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      textItems[index],
                      style: TextStyle(
                          fontSize: 10,
                          color: pageIndex == index
                              ? Colors.black
                              : Colors.black.withOpacity(0.5)),
                    )
                  ],
                ));
          }),
        ),
      ),
    );
  }

  selectedTab(index) {
    setState(() {
      pageIndex = index;
    });
  }
}
