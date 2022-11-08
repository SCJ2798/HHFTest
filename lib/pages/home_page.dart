import 'package:flutter/material.dart';
import 'package:ftest/components/badge.dart';
import 'package:ftest/pages/booking_page.dart';
import 'package:ftest/pages/find_page.dart';
import 'package:ftest/pages/menu_page.dart';
import 'package:ftest/pages/notification_page.dart';
import 'package:ftest/pages/saved_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //
  int _currentPageIndex = 0;
  final _pageController = PageController();

  ///
  ///  Pages list
  final _pages = [
    const FindPage(),
    const BookingPage(),
    const SavedPage(),
    const NotificationPage(),
    const MenuPage()
  ];

  ///
  ///List of Bottom Navigation Items
  final _bottomNavigationItems = [
    const BottomNavigationBarItem(icon: Icon(Icons.search), label: "Find"),
    const BottomNavigationBarItem(
        icon: Icon(Icons.business_center), label: "Bookings"),
    const BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Saved"),
    BottomNavigationBarItem(
        icon: Badge(count: 1, child: const Icon(Icons.notifications)),
        label: "Notification"),
    const BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Menu"),
  ];

  ///
  /// Action that occurs when a navigation item is tapped
  void _onItemTapped(int index) {
    setState(() {
      _currentPageIndex = index;
      _pageController.jumpToPage(_currentPageIndex);
    });
  }

  ///
  /// Action that occurs when the page is changed
  void _onPageChange(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              /**
           * 
           */
            },
            icon: const Icon(Icons.arrow_back)),
        foregroundColor: Colors.black,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        ///
        /// Pageviewer
        child: PageView.builder(
          controller: _pageController,
          itemCount: _pages.length,
          onPageChanged: _onPageChange,
          itemBuilder: (context, index) => _pages[index],
        ),
      ),

      ///
      /// Bottom navigation
      bottomNavigationBar: BottomNavigationBar(
          items: _bottomNavigationItems,
          elevation: 0,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          currentIndex: _currentPageIndex,
          showUnselectedLabels: true,
          onTap: _onItemTapped,
          selectedLabelStyle: const TextStyle(fontSize: 8),
          unselectedLabelStyle: const TextStyle(fontSize: 8)),
    );
  }
}
