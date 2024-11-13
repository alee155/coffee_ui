import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductBottomSheet extends StatefulWidget {
  final Map<String, dynamic> product;
  final int productIndex;
  final List<List<bool>> selectedVariants;

  final Function(int, int, bool) onVariantChange;

  const ProductBottomSheet({
    super.key,
    required this.product,
    required this.productIndex,
    required this.selectedVariants,
    required this.onVariantChange,
  });

  @override
  State<ProductBottomSheet> createState() => _ProductBottomSheetState();
}

class _ProductBottomSheetState extends State<ProductBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20.h)),
      child: Container(
        color: Colors.white,
        child: Stack(
          children: [
            Positioned.fill(
              child: Stack(
                children: [
                  Image.asset(
                    'assets/stack.jpg',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 25.0, sigmaY: 25.0),
                    child: Container(color: Colors.black.withOpacity(0)),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Add the top row with the close icon and coffee name
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.product['name']!,
                          style: TextStyle(
                            fontSize: 22.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.close, color: Colors.white),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.h),
                      child: Image.asset(
                        widget.product['image']!,
                        height: 150.h,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      widget.product['description']!,
                      style: TextStyle(fontSize: 16.sp, color: Colors.white),
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      'Variants:',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(widget.product['variants'].length,
                          (index) {
                        final variant = widget.product['variants'][index];
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 5.h),
                          child: CheckboxListTile(
                            value: widget.selectedVariants[widget.productIndex]
                                [index],
                            onChanged: (bool? value) {
                              setState(() {
                                widget.onVariantChange(
                                    widget.productIndex, index, value!);
                              });
                            },
                            title: Text(
                              '${variant['size']} - Rs ${variant['price']}',
                              style: TextStyle(
                                color:
                                    widget.selectedVariants[widget.productIndex]
                                            [index]
                                        ? Colors.green
                                        : Colors.white,
                                fontSize: 16.sp,
                              ),
                            ),
                            activeColor: Colors.green,
                            checkColor: Colors.white,
                          ),
                        );
                      }),
                    ),
                    SizedBox(height: 40.h),
                    SizedBox(
                      height: 40.h,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle Add to Cart action here
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.brown,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        child: Text(
                          'Add to cart',
                          style: TextStyle(
                            fontSize: 18.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
