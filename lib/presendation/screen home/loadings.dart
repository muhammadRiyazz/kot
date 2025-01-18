// Attractive Shimmer List Placeholder
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget ordersloading() {
  return ListView(
    children: [
      const SizedBox(height: 10.0),
      Column(
        children: List.generate(
          // itemCount: 10, // Number of shimmer items
          55,
          (index) {
            return Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        // Profile icon or image placeholder
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 16.0),
                        // Text and button placeholders
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Title placeholder
                              Container(
                                width: double.infinity,
                                height: 20.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 8.0),
                              // Subtitle placeholder
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 150.0,
                                    height: 15.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.white,
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: Container(
                                      width: 55.0,
                                      height: 55.0,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              // Another placeholder (e.g., button or short text)
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 18.0),
                    Container(
                      width: double.infinity,
                      height: 1.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    ],
  );
}
