
// import 'package:flutter/material.dart';

// class CategoryItem extends StatelessWidget {
//   final String icon;
//   final String label;
//   final VoidCallback onTap;

//   const CategoryItem({
//     super.key,
//     required this.icon,
//     required this.label,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Column(
//         children: [
//           Image.asset(
//             icon,
//             height: 40,
//             width: 40,
//           ),
//           const SizedBox(height: 4),
//           Text(
//             label,
//             style: const TextStyle(fontSize: 12),
//           ),
//         ],
//       ),
//     );
//   }
// }




import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String icon;
  final String label;
  final VoidCallback onTap;

  const CategoryItem({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 60, // 60% of container height (assuming ~100dp total height)
                child: Image.asset(
                  icon,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}


//  F I X E D      F I L E S-------------->