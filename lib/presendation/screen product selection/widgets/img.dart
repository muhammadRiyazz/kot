import 'package:flutter/material.dart';
import 'package:restaurant_kot/domain/cus/customer_model.dart';
import 'package:shimmer/shimmer.dart';
import 'dart:developer';
import 'package:http/http.dart' as http;

class ProductImageWidget extends StatefulWidget {
  final String itemCode;

  const ProductImageWidget({required this.itemCode, Key? key})
      : super(key: key);

  @override
  _ProductImageWidgetState createState() => _ProductImageWidgetState();
}

class _ProductImageWidgetState extends State<ProductImageWidget> {
  String? imageUrl;
  bool isLoading = true;
// Update this with your actual IP or domain

  @override
  void initState() {
    super.initState();
    loadImageUrl();
  }

  Future<void> loadImageUrl() async {
    final List<String> extensions = ['jpg', 'jpeg', 'png'];
    try {
      for (final ext in extensions) {
        final url = 'http://$ipid/${widget.itemCode}.$ext';
        log("Trying URL: $url");
        final response = await http.head(Uri.parse(url));

        if (response.statusCode == 200) {
          setState(() {
            imageUrl = url;
            isLoading = false;
          });
          return;
        }
      }
    } catch (e) {
      log("Error loading image: $e");
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 60,
      decoration: BoxDecoration(
        color: Colors.grey[200], // Placeholder background color
        borderRadius: BorderRadius.circular(10),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: isLoading
            ? Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  height: 150,
                  width: double.infinity,
                  color: Colors.white,
                ),
              )
            : imageUrl != null
                ? Image.network(
                    imageUrl!,
                    fit: BoxFit.fill,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        'assets/img/no data/noimg.png',
                        fit: BoxFit.fill,
                      );
                    },
                  )
                : Image.asset(
                    'assets/img/no data/noimg.png',
                    fit: BoxFit.fill,
                  ),
      ),
    );
  }
}


String getimgpath(String path) {
  log(path);
  // Normalize path separators for cross-platform compatibility
  final normalizedPath = path.replaceAll('\\', '/');
  final fileName = normalizedPath.split('/').last; // Extract the file name
  String url = 'http://$ipid/$fileName'; // Construct the URL
  log(url);
  return url;
}
