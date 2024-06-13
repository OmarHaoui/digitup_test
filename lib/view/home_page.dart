// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:math';

import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/constants.dart';
import '../utils/widgets.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _selectedIndex = 4;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  var chatIcon = svgIcon2('assets/images/svg/chat.svg');
  var dashIcon = svgIcon2('assets/images/svg/dashboard.svg');
  var transIcon = svgIcon2('assets/images/svg/trans.svg');
  var sendIcon = svgIcon2('assets/images/svg/send.svg');
  var profileIcon = svgIcon2('assets/images/svg/profile.svg');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Color(0xfff8f8f8),
        //backgroundColor: Colors.transparent,
        flexibleSpace: ClipPath(
          clipper: ThreePeakWavesClipper(),
          child: Container(
            height: screenHeight(context) / 6.5,
            color: primaryColor,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 35.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () {
                          // Handle navigation to menu
                        },
                      ),
                      Text('Profile',
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                      IconButton(
                        icon: Icon(Icons.close_rounded, color: Colors.white),
                        onPressed: () {
                          // Handle navigation to settings
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          // Modified app bar

          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                          ),
                          color: Color(0xffF8F8F8),
                        ),
                        padding: EdgeInsets.only(top: 10),
                        child: Padding(
                          padding: EdgeInsets.only(
                              bottom: 8, left: 8, right: 8, top: 0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: primaryColor,
                                    width: 2.0,
                                  ),
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/profileImage.png'), // Replace with your image path
                                    fit: BoxFit.cover,
                                    alignment: Alignment
                                        .topCenter, // Aligns the image to the top
                                  ),
                                ),
                                child: CircleAvatar(
                                  // Profile picture
                                  radius: 50.0,
                                  backgroundColor: Colors.transparent,
                                ),
                              ),
                              SizedBox(width: 16.0),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Maryam.Bernoussy', // Replace with your name
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    children: [
                                      Text('Member since '),
                                      Text('6th March 2024',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600)),
                                    ],
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.only(top: 5.0, bottom: 10),
                                    height: 5,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      color: primaryColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  // bio text
                                  Container(
                                    height: 100,
                                    width: 215,
                                    child: Text(
                                      softWrap: true,
                                      'Insert a mini bio below. Share a snippet about yourself—interests, background, or achievements—to give others a quick glimpse of who you are.',
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.edit_calendar_rounded),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Profile details
                            Text(
                              'My Stories',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Container(
                              height: screenHeight(context) / 3.4,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: myStories.length + 1,
                                itemBuilder: (context, index) {
                                  return index == myStories.length
                                      ? GestureDetector(
                                          onTap: () {
                                            //TODO: Add a new story
                                          },
                                          child: Container(
                                            margin: EdgeInsets.only(
                                                right: 8, bottom: 40),
                                            width: screenWidth(context) / 2.7,
                                            height: screenHeight(context) / 3.4,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.grey[300]!,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              color: Colors.white,
                                            ),
                                            child: Center(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.grey[300]!),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  color: Colors.white,
                                                ),
                                                child: Icon(
                                                  Icons.add,
                                                  color: Colors.grey[300],
                                                  size: 30.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      : Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8),
                                          child: Stack(
                                            children: [
                                              Container(
                                                margin: EdgeInsets.only(
                                                    bottom: 40.0),
                                                height: double.infinity,
                                                width:
                                                    screenWidth(context) / 2.7,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        myStories[index]),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                bottom: 5,
                                                right: 0.0,
                                                left: 0.0,
                                                child: Center(
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                          color: Colors.grey,
                                                          width: 1.0),
                                                    ),
                                                    child: IconButton(
                                                      style: ButtonStyle(
                                                          backgroundColor:
                                                              MaterialStateProperty
                                                                  .all(Colors
                                                                      .white)),
                                                      onPressed: () {
                                                        //TODO: delete the story
                                                      },
                                                      icon: Icon(
                                                        Icons.close_rounded,
                                                        color: Colors.grey,
                                                        size: 30.0,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                },
                              ),
                            ),
                            SizedBox(height: 16.0),
                            // **My about me section**
                            Text('About Me',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w700,
                                )),

                            SizedBox(height: 8.0),
                            TextButton(
                              onPressed: () {
                                //TODO: Navigate to the personal information screen
                              },
                              child: Row(
                                children: [
                                  Icon(Icons.man_rounded, color: primaryColor),

                                  SizedBox(
                                      width:
                                          8.0), // Add some spacing between icon and text
                                  Expanded(
                                    child: Text(
                                      'Personal informations',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ), // Text expands to fill remaining space
                                ],
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Icon(Icons.person_pin_outlined,
                                      color: primaryColor),
                                  SizedBox(
                                      width:
                                          8.0), // Add some spacing between icon and text
                                  Expanded(
                                      child: Text(
                                    'My identity',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700),
                                  )), // Text expands to fill remaining space
                                ],
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Icon(Icons.star_half_outlined,
                                      color: primaryColor),
                                  SizedBox(
                                      width:
                                          8.0), // Add some spacing between icon and text
                                  Expanded(
                                      child: Text(
                                    'Sendyo embassador',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700),
                                  )), // Text expands to fill remaining space
                                ],
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Icon(Icons.person_pin_rounded,
                                      color: primaryColor),
                                  SizedBox(
                                      width:
                                          8.0), // Add some spacing between icon and text
                                  Expanded(
                                      child: Text(
                                    'Account and security',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700),
                                  )), // Text expands to fill remaining space
                                ],
                              ),
                            ),
                            // **End of the about me section**

                            // **My payments section**
                            Text('Payments',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w700)),
                            SizedBox(height: 8.0),
                            TextButton(
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Icon(Icons.credit_card, color: primaryColor),
                                  SizedBox(
                                      width:
                                          8.0), // Add some spacing between icon and text
                                  Expanded(
                                      child: Text(
                                    'Transfer options',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700),
                                  )), // Text expands to fill remaining space
                                ],
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Icon(Icons.money, color: primaryColor),
                                  SizedBox(
                                      width:
                                          8.0), // Add some spacing between icon and text
                                  Expanded(
                                      child: Text(
                                    'Paiment methods',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700),
                                  )), // Text expands to fill remaining space
                                ],
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Icon(Icons.wallet, color: primaryColor),
                                  SizedBox(
                                      width:
                                          8.0), // Add some spacing between icon and text
                                  Expanded(
                                      child: Text(
                                    'Wallet',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700),
                                  )), // Text expands to fill remaining space
                                ],
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Row(
                                children: [
                                  svgIcon('assets/images/svg/MoneyGraph.svg'),
                                  SizedBox(
                                      width:
                                          8.0), // Add some spacing between icon and text
                                  Expanded(
                                      child: Text(
                                    'Transaction history',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700),
                                  )), // Text expands to fill remaining space
                                ],
                              ),
                            ),
                            // **End of the payments section**
                            // **More section**
                            Text('More',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w700)),
                            SizedBox(height: 8.0),
                            TextButton(
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Icon(Icons.error_outline,
                                      color: primaryColor),
                                  SizedBox(
                                      width:
                                          8.0), // Add some spacing between icon and text
                                  Expanded(
                                      child: Text(
                                    'Notifications',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700),
                                  )), // Text expands to fill remaining space
                                ],
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Icon(Icons.help_outline, color: primaryColor),
                                  SizedBox(
                                      width:
                                          8.0), // Add some spacing between icon and text
                                  Expanded(
                                      child: Text(
                                    'FAQ and help',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700),
                                  )), // Text expands to fill remaining space
                                ],
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Icon(Icons.handyman_outlined,
                                      color: primaryColor),
                                  SizedBox(
                                      width:
                                          8.0), // Add some spacing between icon and text
                                  Expanded(
                                      child: Text(
                                    'Terms and conditions',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700),
                                  )), // Text expands to fill remaining space
                                ],
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Row(
                                children: [
                                  svgIcon('assets/images/svg/logout.svg'),
                                  SizedBox(
                                      width:
                                          8.0), // Add some spacing between icon and text
                                  Expanded(
                                      child: Text(
                                    'Logout',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700),
                                  )), // Text expands to fill remaining space
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      // **End of the more section**
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: ConvexAppBar(
        height: 80,
        onTap: _onItemTapped,
        activeColor: Color(0xff133BB7),
        style: TabStyle.react,
        items: [
          TabItem(icon: sendIcon),
          TabItem(icon: transIcon),
          TabItem(icon: dashIcon),
          TabItem(icon: chatIcon),
          TabItem(icon: profileIcon),
        ],
        initialActiveIndex: _selectedIndex,
        backgroundColor: primaryColor,
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   backgroundColor: primaryColor, // Adjust color as needed
      //   selectedItemColor: selectedNavTabBarColor,
      //   unselectedItemColor: Colors.white,
      //   type: BottomNavigationBarType.shifting, // This makes the icons animate
      //   currentIndex:
      //       _selectedIndex, // This will be updated when a new item is tapped
      //   onTap: _onItemTapped, // Handles taps
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.send),
      //       label: 'Send',
      //       backgroundColor: primaryColor, // This is needed for the animation
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.directions_car),
      //       label: 'Transport',
      //       backgroundColor: primaryColor, // This is needed for the animation
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.dashboard),
      //       label: 'Dashboard',
      //       backgroundColor: primaryColor, // This is needed for the animation
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.chat),
      //       label: 'Chat',
      //       backgroundColor: primaryColor, // This is needed for the animation
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person),
      //       label: 'Profile',
      //       backgroundColor: primaryColor, // This is needed for the animation
      //     ),
      //   ],
      // ),

//----------------------------------

      // bottomNavigationBar: CurvedNavigationBar(
      //   backgroundColor: Colors.blueAccent,
      //   items: <Widget>[
      //     Icon(Icons.send),
      //     Icon(Icons.directions_car),
      //     Icon(Icons.dashboard),
      //     Icon(Icons.chat),
      //     Icon(Icons.person),
      //   ],
      //   onTap: _onItemTapped,
      // ),
    );
  }
}

List<String> myStories = [
  'assets/images/story1.png',
  'assets/images/story2.png',
];
