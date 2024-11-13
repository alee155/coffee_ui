import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CoffeeProfileScreen extends StatelessWidget {
  const CoffeeProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image with Blur Effect
          Positioned.fill(
            child: Stack(
              children: [
                Image.asset(
                  'assets/por.jpeg',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
                  child: Container(color: Colors.brown.withOpacity(0.5)),
                ),
              ],
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 100.h),
                // Profile Picture
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 6),
                  ),
                  child: CircleAvatar(
                    radius: 60.r,
                    backgroundImage: const AssetImage('assets/ali.jpeg'),
                    backgroundColor: Colors.transparent,
                  ),
                ),
                SizedBox(height: 20.h),
                // Name and Email
                Text(
                  'Muhammad Ali Tahir',
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'ali12@gmail.com',
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 40.h),
                // Profile Options List
                const ProfileRow(
                  iconPath: 'assets/new/order.svg',
                  title: 'My Orders',
                ),
                const ProfileRow(
                  iconPath: 'assets/new/delivery.svg',
                  title: 'Delivery Address',
                ),
                const ProfileRow(
                  iconPath: 'assets/new/history.svg',
                  title: 'Order History',
                ),
                const ProfileRow(
                  iconPath: 'assets/new/setting.svg',
                  title: 'Settings',
                ),
                const ProfileRow(
                  iconPath: 'assets/new/help.svg',
                  title: 'Help',
                ),
                const ProfileRow(
                  iconPath: 'assets/new/shop.svg',
                  title: 'Locator',
                ),
                const ProfileRow(
                  iconPath: 'assets/new/membership.svg',
                  title: 'Membership',
                ),
                const ProfileRow(
                  iconPath: 'assets/new/leave.svg',
                  title: 'Logout',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Reusable widget for profile rows with icons and arrow
class ProfileRow extends StatelessWidget {
  final String iconPath;
  final String title;

  const ProfileRow({
    super.key,
    required this.iconPath,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                iconPath,
                height: 20.h,
                width: 20.w,
                color: Colors.white,
              ),
              SizedBox(width: 10.w),
              Text(
                title,
                style: TextStyle(
                  fontSize: 18.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Icon(
            Icons.arrow_forward_ios,
            size: 16.sp,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
