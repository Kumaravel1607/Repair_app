import 'package:flutter/material.dart';
import 'package:repair/Constant/color.dart';
import 'package:repair/Home.dart';
import 'package:repair/Booking/MyBooking.dart';
import 'package:repair/Myprofile.dart';
import 'package:repair/SelectService.dart';
import 'package:repair/Services/MyService.dart';

class Navigation extends StatefulWidget {
  final String name;
  Navigation({Key? key, required this.name}) : super(key: key);

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
//   PersistentTabController _controller =
//       PersistentTabController(initialIndex: 0);

//   @override
//   Widget build(BuildContext context) {
//     return PersistentTabView(
//       context,
//       controller: _controller,
//       screens: _buildScreens(),
//       items: _navBarItems(),
//       confineInSafeArea: true,
//       backgroundColor: yellow,
//       // backgroundColor: Color.fromARGB(255, 14, 13, 13),
//       itemAnimationProperties: const ItemAnimationProperties(
//         duration: Duration(milliseconds: 200),
//         curve: Curves.ease,
//       ),
//       screenTransitionAnimation: const ScreenTransitionAnimation(
//           duration: Duration(milliseconds: 200),
//           curve: Curves.ease,
//           animateTabTransition: true),
//       navBarStyle: NavBarStyle.style6,
//     );
//   }
// }

// List<PersistentBottomNavBarItem> _navBarItems() {
//   return [
//     PersistentBottomNavBarItem(
//       //icon: Image.asset('assets/images/home.png'),
//       icon: const Icon(
//         Icons.home,
//         color: black,
//       ),
//       title: ('Home'),
//       activeColorPrimary: black,
//       inactiveColorPrimary: black,
//     ),
//     PersistentBottomNavBarItem(
//       icon: const Icon(
//         Icons.card_travel_outlined,
//         color: black,
//       ),
//       title: ('My Trips'),
//       activeColorPrimary: black,
//       inactiveColorPrimary: black,
//     ),
//     PersistentBottomNavBarItem(
//       icon: const Icon(
//         Icons.brightness_5_outlined,
//         color: black,
//       ),
//       title: ('Offer'),
//       activeColorPrimary: black,
//       inactiveColorPrimary: black,
//     ),
//     PersistentBottomNavBarItem(
//       icon: const Icon(
//         Icons.person,
//         color: black,
//       ),
//       title: ('My Account'),
//       activeColorPrimary: black,
//       inactiveColorPrimary: black,
//     ),
//   ];
// }

// List<Widget> _buildScreens() {
//   return [Home(), Mytrip(), Offer(), Myaccount()];
// }

  var tabIndex = 0;
  void changeTab(int index) {
    setState(() {
      tabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      body: IndexedStack(
        index: tabIndex,
        children: [Home(name: widget.name), Services(), MyBooking(), Profile()],
      ),
      bottomNavigationBar: BottomAppBar(
        clipBehavior: Clip.antiAlias,
        shape: const CircularNotchedRectangle(),
        notchMargin: 4,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          // borderRadius: BorderRadius.circular(20),
          child: BottomNavigationBar(
            unselectedLabelStyle: TextStyle(
                fontSize: 12, fontWeight: FontWeight.w500, color: black),
            selectedLabelStyle: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w600, color: black),
            backgroundColor: orange,
            elevation: 1,
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 12,
            currentIndex: tabIndex,
            onTap: changeTab,
            selectedItemColor: black,
            unselectedItemColor: black,
            items: [
              BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/images/home.png',
                    width: 25,
                  ),
                  label: "Home"),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/images/tool.png',
                  color: black,
                  width: 25,
                ),
                label: "Services",
              ),
              BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/images/clip.png',
                    width: 25,
                  ),
                  label: "My Booking"),
              BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/images/profile1.png',
                    width: 25,
                  ),
                  label: "My Profile")
            ],
          ),
        ),
      ),
    );
  }
}

itemBar(Image image, String label) {
  return BottomNavigationBarItem(
      icon: Image.asset('assets/images/$image.png'), label: label);
}
