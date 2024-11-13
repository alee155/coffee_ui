// header_widget.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildHeader(String userName, String balance) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 10.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(
            radius: 30.r, backgroundImage: const AssetImage('assets/ali.jpeg')),
        SizedBox(width: 10.w),
        Expanded(
          child: Text(
            userName,
            style: TextStyle(
                fontSize: 20.sp,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
        ),
        Text(
          balance,
          style: TextStyle(
              fontSize: 16.sp,
              color: Colors.yellow,
              fontWeight: FontWeight.w500),
        ),
      ],
    ),
  );
}

Widget buildProductColumn(String title, String imagePath) {
  return Column(
    children: [
      CircleAvatar(radius: 30.r, backgroundImage: AssetImage(imagePath)),
      SizedBox(height: 5.h),
      Text(
        title,
        style: TextStyle(
            fontSize: 13.sp, color: Colors.white, fontWeight: FontWeight.bold),
      ),
    ],
  );
}

Widget buildProductCard(String image, String name, String price) {
  return Container(
    height: 120.h,
    width: 150.w,
    margin: EdgeInsets.only(right: 10.w),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(
        Radius.circular(10.r),
      ),
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.all(
        Radius.circular(10.r),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              image, // Use the image from the list
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.3),
            ),
          ),
          Positioned(
            bottom: 3.h,
            left: 5.w,
            right: 2.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name, // Use the name from the list
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "Rs: $price", // Use the price from the list
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final VoidCallback? onSearchTap; // Callback for search icon tap

  const CustomTextField({
    super.key,
    required this.hintText,
    this.controller,
    this.onSearchTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.all(
          Radius.circular(20.r),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Row(
          children: [
            // Search Icon
            IconButton(
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: onSearchTap,
            ),
            // Text Field
            Expanded(
              child: TextField(
                controller: controller,
                style: const TextStyle(
                    color: Colors
                        .white), // Set the text color to white for visibility
                decoration: InputDecoration(
                  border: InputBorder.none, // Removes the default underline
                  hintText: hintText,
                  hintStyle: TextStyle(
                      color: Colors.white
                          .withOpacity(0.6)), // Light hint text color
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
