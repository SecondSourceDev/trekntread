import 'dart:math';

import 'package:flutter/material.dart';
import 'package:trekntread/Model/banner.dart';
import 'package:trekntread/Model/mock_products.dart';
import 'package:trekntread/View/screen/cart_screen.dart';
import 'package:trekntread/View/screen/menu_screen.dart';
import 'package:trekntread/View/screen/product_listing_screen.dart' as listing;
import 'package:trekntread/View/screen/profile.dart';
import 'package:trekntread/View/widget/auto_scroll_banner.dart';
import 'package:trekntread/View/widget/category_item.dart';
import 'package:trekntread/View/widget/product_card.dart';
import 'package:trekntread/View/widget/search_header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0; // Tracks the currently selected index
  String selectedCategory = 'All';

  // Update your pages list to use a getter instead of a final field
  List<Widget> get _pages => [
        HomeScreenContent(
          selectedCategory: selectedCategory,
          categories: categories,
          onCategoryChanged: handleCategoryChange,
        ),
        const MenuScreen(),
        const CartScreen(),
        const ProfileScreen(),
      ];

  final List<String> categories = [
    'All',
    'Sneakers',
    'Running',
    'Basketball',
    'Casual',
  ];

  // handle category changes
  void handleCategoryChange(String? newCategory) {
    if (newCategory != null) {
      setState(() {
        selectedCategory = newCategory;
      });
    }
  }

  final List<BannerImage> banners = [
    BannerImage(
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS5T0BOQM3O97OYrwurTmC7GmGPNoG8z3QSBg&s',
      title: 'New Collection',
    ),
    BannerImage(
      imageUrl:
          'https://img.freepik.com/free-vector/special-offer-creative-sale-banner-design_1017-16284.jpg?t=st=1736147666~exp=1736151266~hmac=3428f620e37ebc10b66f0920b14628f930e7f0b07b12deec786e9bfdd53e5456&w=740',
      title: 'Special Offer',
    ),
    BannerImage(
      imageUrl:
          'https://img.freepik.com/free-vector/sales-banner-origami-style_23-2148390344.jpg?t=st=1736149095~exp=1736152695~hmac=e4f21706189b309608f56110e183f4c1f97e15623b629b15a57a1d874fce8120&w=740',
      title: 'Limited Edition',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: _currentIndex == 0
            ? HomeScreenContent(
                selectedCategory: selectedCategory,
                categories: categories,
                onCategoryChanged: handleCategoryChange,
              )
            : _pages[_currentIndex],
      ),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  Widget buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _currentIndex, // Highlight the selected tab
      onTap: (index) {
        setState(() {
          _currentIndex = index; // Update the selected index
        });
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu),
          label: 'Menu',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }
}

class HomeScreenContent extends StatelessWidget {
  final String selectedCategory;
  final List<String> categories;
  final Function(String?) onCategoryChanged;

  const HomeScreenContent({
    super.key,
    required this.selectedCategory,
    required this.categories,
    required this.onCategoryChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Search Header with proper props
          SearchHeader(
            selectedCategory: selectedCategory,
            categories: categories,
            onCategoryChanged: onCategoryChanged,
          ),

          // Auto-scrolling Banners
          Container(
            color: const Color(0xFFFF3807),
            padding: const EdgeInsets.only(bottom: 16),
            child: AutoScrollBanner(
              banners: [
                BannerImage(
                  imageUrl:
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS5T0BOQM3O97OYrwurTmC7GmGPNoG8z3QSBg&s',
                  title: 'New Collection',
                ),
                BannerImage(
                  imageUrl:
                      'https://img.freepik.com/free-vector/special-offer-creative-sale-banner-design_1017-16284.jpg?t=st=1736147666~exp=1736151266~hmac=3428f620e37ebc10b66f0920b14628f930e7f0b07b12deec786e9bfdd53e5456&w=740',
                  title: 'Special Offer',
                ),
                BannerImage(
                  imageUrl:
                      'https://img.freepik.com/free-vector/sales-banner-origami-style_23-2148390344.jpg?t=st=1736149095~exp=1736152695~hmac=e4f21706189b309608f56110e183f4c1f97e15623b629b15a57a1d874fce8120&w=740',
                  title: 'Limited Edition',
                ),
              ],
            ),
          ),

          // Location Bar
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            color: const Color(0xFFFF3807),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Row(
                children: [
                  Icon(Icons.location_on, color: Colors.grey, size: 20),
                  SizedBox(width: 8),
                  Text(
                    'Mirpur Dohs, Gate, 1 kalshi flyover',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
          ),

          // Flash Sale Section
          buildFlashSaleSection(),

          // Categories Section
          buildCategoriesSection(context),

          // You May Also Love Section
          buildYouMayAlsoLoveSection()
        ],
      ),
    );
  }

  Widget buildFlashSaleSection() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Flash sale',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: Colors.red[50],
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Text(
                  'Ends in 11:51:00',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // In buildFlashSaleSection()
          SizedBox(
            height: 260, // Increased height
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: SizedBox(
                      width: 150, // Adjusted width
                      child: ProductCard(
                        product: mockProducts[index], // Pass individual product
                        onAddToCart: () {
                          // Implement your cart functionality here
                          print('Added ${mockProducts[index].name} to cart');
                        },
                      )),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  // Y O U   M A Y  A L S O   L I K E
  Widget buildYouMayAlsoLoveSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            'You May Also Love',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.6, // Adjusted for better product card fit
            ),
            itemCount: mockProducts.length, // Use mock data length
            itemBuilder: (context, index) {
              return ProductCard(
                product: mockProducts[index], // Pass individual product
                onAddToCart: () {
                  // Implement your cart functionality here
                  print('Added ${mockProducts[index].name} to cart');
                },
              );
            },
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

// In buildCategoriesSection() method, update the CategoryItem:
  Widget buildCategoriesSection(BuildContext context) {
    final List<Map<String, String>> categories = [
      {'icon': 'assets/images/all.png', 'label': 'All products'},
      {'icon': 'assets/images/mens.png', 'label': "Men's"},
      {'icon': 'assets/images/womens.png', 'label': "Women's"},
      {'icon': 'assets/images/unisex.png', 'label': 'Unisex'},
      {'icon': 'assets/images/accessories.png', 'label': 'Accessories'},
      {'icon': 'assets/images/seasonal.png', 'label': 'Seasonal'},
      {'icon': 'assets/images/comfort.png', 'label': 'Comfort'},
    ];

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Categories',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const listing.ProductListingScreen(
                        category: 'All',
                        brand: '',
                      ),
                    ),
                  );
                },
                child: const Text('See all'),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.65,
            child: PageView.builder(
              itemCount: (categories.length / 6).ceil(),
              itemBuilder: (context, pageIndex) {
                return GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemCount: min(6, categories.length - pageIndex * 6),
                  itemBuilder: (context, index) {
                    final actualIndex = pageIndex * 6 + index;
                    final category = categories[actualIndex];
                    return CategoryItem(
                      icon: category['icon']!,
                      label: category['label']!,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => listing.ProductListingScreen(
                              category: category['label']!,
                              brand: '',
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

//  F I X E D      F I L E S-------------->

// Widget buildYouMayAlsoLoveSection() {
//   final productService = ProductService();

//   return FutureBuilder<List<Product>>(
//     future: productService.fetchProducts(),
//     builder: (context, snapshot) {
//       if (snapshot.connectionState == ConnectionState.waiting) {
//         return const Center(child: CircularProgressIndicator());
//       } else if (snapshot.hasError) {
//         return const Center(child: Text('Failed to load products'));
//       } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//         return const Center(child: Text('No products available'));
//       }

//       final products = snapshot.data!;

//       return Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Padding(
//             padding: EdgeInsets.all(16),
//             child: Text(
//               'You May Also Love',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           const SizedBox(height: 16),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16),
//             child: GridView.builder(
//               physics: const NeverScrollableScrollPhysics(),
//               shrinkWrap: true,
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 crossAxisSpacing: 16,
//                 mainAxisSpacing: 16,
//                 childAspectRatio: 0.6,
//               ),
//               itemCount: products.length,
//               itemBuilder: (context, index) {
//                 return ProductCard(
//                   product: products[index],
//                   onAddToCart: () {
//                     print('Added ${products[index].name} to cart');
//                   },
//                 );
//               },
//             ),
//           ),
//           const SizedBox(height: 16),
//         ],
//       );
//     },
//   );
// }
