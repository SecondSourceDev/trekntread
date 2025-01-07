// import 'package:flutter/material.dart';

// class CustomDropdownSearch extends StatefulWidget {
//   final List<String> categories;
  
//   const CustomDropdownSearch({
//     Key? key,
//     required this.categories,
//   }) : super(key: key);

//   @override
//   State<CustomDropdownSearch> createState() => _CustomDropdownSearchState();
// }

// class _CustomDropdownSearchState extends State<CustomDropdownSearch> {
//   String selectedCategory = 'All';

//   @override
//   void initState() {
//     super.initState();
//     if (widget.categories.isNotEmpty) {
//       selectedCategory = widget.categories[0];
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: Row(
//         children: [
//           // Dropdown
//           Container(
//             padding: const EdgeInsets.only(right: 8),
//             decoration: const BoxDecoration(
//               border: Border(
//                 right: BorderSide(color: Colors.grey, width: 0.5),
//               ),
//             ),
//             child: DropdownButton<String>(
//               value: selectedCategory,
//               underline: const SizedBox(),
//               icon: const Icon(Icons.arrow_drop_down),
//               items: widget.categories.map((String category) {
//                 return DropdownMenuItem<String>(
//                   value: category,
//                   child: Text(category),
//                 );
//               }).toList(),
//               onChanged: (String? newValue) {
//                 if (newValue != null) {
//                   setState(() {
//                     selectedCategory = newValue;
//                   });
//                 }
//               },
//             ),
//           ),
//           // Search TextField
//           const Expanded(
//             child: TextField(
//               decoration: InputDecoration(
//                 hintText: 'Search for shoes, brands, or styles...',
//                 border: InputBorder.none,
//                 prefixIcon: Icon(Icons.search, color: Colors.grey),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
