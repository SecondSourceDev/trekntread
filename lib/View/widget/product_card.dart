// import 'package:flutter/material.dart';

// class Product {
//   final String name;
//   final double price;
//   final double originalPrice; // Added originalPrice property
//   final String imageUrl;
//   final int discount; // Added discount property

//   Product({
//     required this.name,
//     required this.price,
//     required this.originalPrice, // Initialize originalPrice
//     required this.imageUrl,
//     required this.discount, // Initialize discount
//   });
// }

// class ProductCard extends StatelessWidget {
//   final Product product;
//   final VoidCallback onAddToCart;

//   const ProductCard({
//     super.key,
//     required this.product,
//     required this.onAddToCart,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(8),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.1),
//             spreadRadius: 1,
//             blurRadius: 4,
//             offset: const Offset(0, 1),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Product Image
//           ClipRRect(
//             borderRadius: const BorderRadius.only(
//               topLeft: Radius.circular(8),
//               topRight: Radius.circular(8),
//             ),
//             child: AspectRatio(
//               aspectRatio: 1,  // Square aspect ratio like the reference
//               child: Image.network(
//                 product.imageUrl,
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           // Product Details
//           Padding(
//             padding: const EdgeInsets.all(12.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   product.name,
//                   style: const TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w600,
//                     color: Colors.black87,
//                   ),
//                   maxLines: 2,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//                 const SizedBox(height: 8),
//                 Row(
//                   children: [
//                     Text(
//                       'BDT ${product.price.toStringAsFixed(0)}',
//                       style: const TextStyle(
//                         fontSize: 15,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.red,
//                       ),
//                     ),
//                     const SizedBox(width: 8),
//                     Text(
//                       'BDT ${product.originalPrice.toStringAsFixed(0)}',
//                       style: const TextStyle(
//                         fontSize: 14,
//                         decoration: TextDecoration.lineThrough,
//                         color: Colors.grey,
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 12),
//                 SizedBox(
//                   width: double.infinity,
//                   height: 36,
//                   child: TextButton(
//                     onPressed: onAddToCart,
//                     style: TextButton.styleFrom(
//                       backgroundColor: Colors.red,
//                       foregroundColor: Colors.white,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(4),
//                       ),
//                     ),
//                     child: const Text(
//                       'Add to cart',
//                       style: TextStyle(
//                         fontSize: 14,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }





import 'package:flutter/material.dart';
import 'package:trekntread/Model/product.dart';

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
        return Container(
          width: constraints.maxWidth,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 4,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Image
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.network(
                    product.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // Product Details
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Text(
                            'BDT ${product.price.toStringAsFixed(0)}',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'BDT ${product.originalPrice.toStringAsFixed(0)}',
                            style: const TextStyle(
                              fontSize: 12,
                              decoration: TextDecoration.lineThrough,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        width: double.infinity,
                        height: 32,
                        child: TextButton(
                          onPressed: onAddToCart,
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                          ),
                          child: const Text(
                            'Add to cart',
                            style: TextStyle(fontSize: 12),
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
      }
    );
  }
}


//  F I X E D      F I L E S-------------->