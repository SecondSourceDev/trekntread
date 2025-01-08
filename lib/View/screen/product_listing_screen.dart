import 'package:flutter/material.dart';
import 'package:trekntread/Model/product.dart';
import 'package:trekntread/Model/mock_products.dart';
import 'package:trekntread/View/widget/search_header.dart';

class ProductListingScreen extends StatefulWidget {
  final String category;
  final String brand;

  const ProductListingScreen({
    super.key,
    required this.category,
    required this.brand,
  });

  @override
  State<ProductListingScreen> createState() => _ProductListingScreenState();
}

class _ProductListingScreenState extends State<ProductListingScreen> {
  late List<Product> filteredProducts;
  String selectedBrand = 'Nike';
  String selectedCategory = 'All';

  @override
  void initState() {
    super.initState();
    filterProducts();
  }

  void filterProducts() {
    filteredProducts = mockProducts.where((product) {
      bool matchesBrand = selectedBrand.isEmpty ||
          product.brand.toLowerCase() == selectedBrand.toLowerCase();
      return matchesBrand;
    }).toList();
  }

  void onAddToCart() {
    // Handle sort functionality
    print('Sort button pressed');
  }

  void handleCategoryChange(String? newCategory) {
    if (newCategory != null) {
      setState(() {
        selectedCategory = newCategory;
        filterProducts();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      body: SafeArea(
        child: Column(
          children: [
            // Implement SearchHeader
            SearchHeader(
              selectedCategory: selectedCategory,
              categories: const ['All', 'Sneakers', 'Running', 'Basketball', 'Casual'],
              onCategoryChanged: handleCategoryChange,
            ),
            // Category Section
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              color: const Color(0xFFFFF4F2),
              child: Row(
                children: [
                  Text(
                    widget.category,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Icon(Icons.keyboard_arrow_down),
                ],
              ),
            ),

            // Brand Filter
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const SizedBox(width: 16),
                    for (String brand in ['Nike', 'Adidas', 'Puma'])
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: FilterChip(
                          label: Text(
                            brand,
                            style: TextStyle(
                              color: selectedBrand == brand
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          selected: selectedBrand == brand,
                          selectedColor: const Color(0xFFFF3807),
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          onSelected: (bool selected) {
                            setState(() {
                              selectedBrand = selected ? brand : '';
                              filterProducts();
                            });
                          },
                        ),
                      ),
                  ],
                ),
              ),
            ),

            // Products Count and Sort
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Products (${filteredProducts.length})',
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextButton.icon(
                    onPressed: onAddToCart,
                    icon: const Text('Sort by'),
                    label: const Icon(Icons.arrow_drop_down),
                  ),
                ],
              ),
            ),

           // Update the GridView part in ProductListingScreen
Expanded(
  child: LayoutBuilder(
    builder: (context, constraints) {
      int crossAxisCount;
      // Responsive column count based on screen width
      if (screenSize.width > 1200) {
        crossAxisCount = 4;
      } else if (screenSize.width > 900) {
        crossAxisCount = 3;
      } else if (screenSize.width > 600) {
        crossAxisCount = 2;
      } else {
        crossAxisCount = 2;
      }

      return GridView.builder(
        padding: EdgeInsets.all(screenSize.width * 0.02),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          childAspectRatio: _calculateAspectRatio(context, constraints, crossAxisCount),
          crossAxisSpacing: screenSize.width * 0.02,
          mainAxisSpacing: screenSize.width * 0.02,
        ),
        itemCount: filteredProducts.length,
        itemBuilder: (context, index) {
          final product = filteredProducts[index];
          return ProductCard(
            product: product,
            onAddToCart: () {
              print('Added ${product.name} to cart');
            },
          );
        },
      );
    },
  ),
),
          ],
        ),
      ),
    );
  }
}

// Updated aspect ratio calculation for better proportions
double _calculateAspectRatio(BuildContext context, BoxConstraints constraints, int crossAxisCount) {
  double screenWidth = MediaQuery.of(context).size.width;
  double horizontalPadding = screenWidth * 0.02 * (crossAxisCount + 1);
  double cardWidth = (constraints.maxWidth - horizontalPadding) / crossAxisCount;
  
  // Golden ratio-based height calculation
  double goldenRatio = 1.618;
  double cardHeight = cardWidth * goldenRatio;
  
  return cardWidth / (cardWidth * 1.5); // 1.5 ratio for height
}


class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onAddToCart;

  const ProductCard({
    super.key,
    required this.product,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // More readable font size calculations based on width
        final double cardWidth = constraints.maxWidth;
        final double titleSize = cardWidth * 0.09; // Larger base size for title
        final double priceSize = cardWidth * 0.07;
        final double discountSize = cardWidth * 0.06;
        final double buttonSize = cardWidth * 0.055;
        
        return Card(
          elevation: 2, // Slight elevation for better visibility
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              // Image Container - Fixed ratio
              Expanded(
                flex: 5,
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                      ),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                        child: Image.network(
                          product.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    if (product.discount > 0)
                      Positioned(
                        top: 12,
                        left: 12,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFF3807),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            '-${product.discount.toStringAsFixed(0)}%',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: discountSize,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),

              // Content Container - Fixed height for consistency
              Expanded(
                flex: 4,
                child: Container(
                  padding: EdgeInsets.all(cardWidth * 0.04),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Product Name
                      Text(
                        product.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: titleSize,
                          fontWeight: FontWeight.w600,
                          height: 1.2,
                          color: Colors.black87,
                        ),
                      ),
                      
                      const Spacer(),
                      
                      // Price Section
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'BDT ${product.price.toStringAsFixed(0)}',
                            style: TextStyle(
                              fontSize: priceSize,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFFFF3807),
                              height: 1.2,
                            ),
                          ),
                          if (product.discount > 0)
                            Text(
                              'BDT ${product.originalPrice.toStringAsFixed(0)}',
                              style: TextStyle(
                                fontSize: discountSize,
                                decoration: TextDecoration.lineThrough,
                                color: Colors.grey.shade600,
                                height: 1.2,
                              ),
                            ),
                        ],
                      ),
                      
                      SizedBox(height: cardWidth * 0.03),
                      
                      // Add to Cart Button - Fixed at bottom
                      SizedBox(
                        width: double.infinity,
                        height: cardWidth * 0.2, // Responsive button height
                        child: ElevatedButton(
                          onPressed: onAddToCart,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFFF3807),
                            foregroundColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            'Add to Cart',
                            style: TextStyle(
                              fontSize: buttonSize,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
