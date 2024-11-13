import 'dart:ui';

import 'package:coffee/prac/coffee_widget.dart';
import 'package:coffee/prac/product_bottom_sheet.dart';
import 'package:coffee/prac/slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'product_list.dart';

class TimsScreen extends StatefulWidget {
  const TimsScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TimsScreenState createState() => _TimsScreenState();
}

class _TimsScreenState extends State<TimsScreen> {
  List<List<bool>> selectedVariants = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildBackground(),
          _buildContent(context),
        ],
      ),
    );
  }

  Widget _buildBackground() {
    return Positioned.fill(
      child: Stack(
        children: [
          Image.asset(
            'assets/back.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 18.0, sigmaY: 18.0),
            child: Container(color: Colors.black.withOpacity(0)),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: Colors.transparent,
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50.h),
              // Address Section (fixed position)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Deliver now',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Roboto',
                      fontSize: 12.sp,
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.white,
                        size: 18.h,
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        'Allama Iqbal Town, Lahore',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20.h),

              CustomTextField(
                hintText: 'Search for coffee...',
                onSearchTap: () {
                  print('Search icon tapped');
                },
              ),
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
                const SampleDesign(),
                SizedBox(height: 20.h),
                _buildProductRow(context),
                SizedBox(height: 20.h),
                _buildCategorySection(
                    context, 'Hot Coffee Offers', hotproducts),
                _buildCategorySection(context, 'Cold Coffee', coldproducts),
                _buildCategorySection(
                    context, 'Tims Classic Special', timsproducts),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCategorySection(
      BuildContext context, String title, List<Map<String, dynamic>> products) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 20.sp,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 5.h),
        SizedBox(
          height: 120.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];

              if (selectedVariants.length <= index) {
                selectedVariants
                    .add(List.filled(product['variants'].length, false));
              }
              return GestureDetector(
                onTap: () {
                  _showBottomSheet(context, product, index);
                },
                child: buildProductCard(
                    product['image']!, product['name']!, product['price']!),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildProductRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildProductColumn('Hot Coffee', 'assets/coffee1.jpg'),
        buildProductColumn('Cold Coffee', 'assets/cold.jpg'),
        buildProductColumn('Cooler', 'assets/iced.jpeg'),
        buildProductColumn('Tims Classic', 'assets/tims.jpg'),
      ],
    );
  }

  void _showBottomSheet(
      BuildContext context, Map<String, dynamic> product, int index) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return ProductBottomSheet(
          product: product,
          productIndex: index,
          selectedVariants: selectedVariants,
          onVariantChange: (productIdx, variantIdx, isSelected) {
            setState(() {
              selectedVariants[productIdx][variantIdx] = isSelected;
            });
          },
        );
      },
    );
  }
}
