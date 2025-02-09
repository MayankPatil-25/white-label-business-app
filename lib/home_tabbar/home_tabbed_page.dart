import 'package:flutter/material.dart';
import 'package:white_label_business_app/constants/color_constants.dart';
import 'package:white_label_business_app/home_tabbar/services_tab/services_page.dart';

class HomeTabbedPage extends StatefulWidget {
  @override
  _HomeTabbedPageState createState() => _HomeTabbedPageState();
}

class _HomeTabbedPageState extends State<HomeTabbedPage> with SingleTickerProviderStateMixin  {
  late TabController _tabController;

  @override void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        backgroundColor: MColors.pageBackgroundColor,
        appBar: AppBar(title: Text('')),
        bottomNavigationBar:
        Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 0,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(padding: EdgeInsets.zero, child:
            Container(height: 2,width: double.infinity,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: MColors.secondaryTextColor.withAlpha(30), // Shadow color with opacity
                    offset: Offset(0, 5), // Negative Y value to create a top shadow
                    blurRadius: 1, // Adjust the blur of the shadow
                    spreadRadius: 1, // Adjust the spread of the shadow
                  ),
                ]))),
            TabBar(
            controller: _tabController,
            labelColor: MColors.primaryAppColor, // Selected text/icon color
            unselectedLabelColor: Colors.grey, // Unselected color
            indicatorSize: TabBarIndicatorSize.label,
            // Indicator size
            indicator:  UnderlineTabIndicator( // Moves selection to top
              borderSide: BorderSide(color: Colors.green, width: 3), // Green top bar
              insets: EdgeInsets.symmetric(horizontal: 16), // Adjust width
            ), // Adjust width
            tabs: [
              Tab(icon: Icon(Icons.work_outline_rounded), text: "Service"),
              Tab(icon: Icon(Icons.people), text: "Customers"),
              Tab(icon: Icon(Icons.cut_rounded), text: "Workers"),
            ],

    )]),
        body: TabBarView(
          controller: _tabController,
          children: [
            ServicesPage(),
            SearchScreen(),
            ProfileScreen(),
          ],
        ),
      ),
    );
  }
}

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return

      Scaffold( backgroundColor: Colors.brown,
          body: Container(alignment: Alignment.center,
              child: TextButton(onPressed: () {
                Navigator.of(context).push( MaterialPageRoute(builder: (context) => ServicesPage()));
              },
                  child: Text("Navigate"))));
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text("Profile Screen", style: TextStyle(fontSize: 20)));
  }
}
