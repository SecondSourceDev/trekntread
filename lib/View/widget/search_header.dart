// import 'package:flutter/material.dart';

// class SearchHeader extends StatelessWidget {
//   final String selectedCategory;
//   final List<String> categories;
//   final Function(String?) onCategoryChanged;

//   const SearchHeader({
//     Key? key,
//     required this.selectedCategory,
//     required this.categories,
//     required this.onCategoryChanged,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       color: const Color(0xFFFF3807),
//       child: Row(
//         children: [
//           Expanded(
//             child: Container(
//               padding: const EdgeInsets.symmetric(horizontal: 8),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: Row(
//                 children: [
//                   Container(
//                     padding: const EdgeInsets.symmetric(horizontal: 8),
//                     decoration: BoxDecoration(
//                       border: Border(
//                         right: BorderSide(
//                           color: Colors.grey.shade300,
//                           width: 1,
//                         ),
//                       ),
//                     ),
//                     child: DropdownButtonHideUnderline(
//                       child: DropdownButton<String>(
//                         value: selectedCategory,
//                         icon: const Icon(Icons.arrow_drop_down),
//                         style: const TextStyle(
//                           color: Colors.black,
//                           fontSize: 14,
//                         ),
//                         onChanged: onCategoryChanged,
//                         items: categories.map<DropdownMenuItem<String>>(
//                           (String value) {
//                             return DropdownMenuItem<String>(
//                               value: value,
//                               child: Text(value),
//                             );
//                           },
//                         ).toList(),
//                       ),
//                     ),
//                   ),
//                   const Expanded(
//                     child: TextField(
//                       decoration: InputDecoration(
//                         hintText: 'Search for shoes, brands, or styles...',
//                         border: InputBorder.none,
//                         contentPadding: EdgeInsets.symmetric(horizontal: 16),
//                         icon: Icon(Icons.search, color: Colors.grey),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           const SizedBox(width: 16),
//           const Icon(Icons.notifications, color: Colors.white),
//           const SizedBox(width: 16),
//           const Icon(Icons.chat, color: Colors.white),
//         ],
//       ),
//     );
//   }
// }



// Updated SearchHeader:
import 'package:flutter/material.dart';

class SearchHeader extends StatelessWidget {
  final String selectedCategory;
  final List<String> categories;
  final Function(String?) onCategoryChanged;

  const SearchHeader({
    super.key,
    required this.selectedCategory,
    required this.categories,
    required this.onCategoryChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: const Color(0xFFFF3807),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    margin: const EdgeInsets.all(4),
                    child: DropdownButtonHideUnderline(
                      child: ButtonTheme(
                        alignedDropdown: true,
                        child: DropdownButton<String>(
                          value: selectedCategory, // This will now update correctly
                          icon: const Icon(Icons.keyboard_arrow_down),
                          style: const TextStyle(
                            color: Colors.black87,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                          isDense: true,
                          alignment: AlignmentDirectional.center,
                          dropdownColor: Colors.white,
                          menuMaxHeight: 300,
                          borderRadius: BorderRadius.circular(10),
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          onChanged: onCategoryChanged, // This will update the state
                          items: categories.map<DropdownMenuItem<String>>(
                            (String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                alignment: Alignment.center,
                                child: Text(
                                  value,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontSize: 14),
                                ),
                              );
                            },
                          ).toList(),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        // Dynamic hint text based on selected category
                        hintText: 'Search ${selectedCategory.toLowerCase()}...',
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                        icon: Icon(Icons.search, color: Colors.grey[400]),
                        hintStyle: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 16),
          const Icon(Icons.notifications_none, color: Colors.white),
          const SizedBox(width: 16),
          const Icon(Icons.chat_bubble_outline, color: Colors.white),
        ],
      ),
    );
  }
}