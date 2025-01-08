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
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 4,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    // decoration: BoxDecoration(
                    //   color: Colors.grey[200],
                    //   borderRadius: BorderRadius.circular(20),
                    // ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: selectedCategory,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        style: const TextStyle(
                          color: Colors.black87,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        onChanged: onCategoryChanged,
                        items: categories.map<DropdownMenuItem<String>>(
                          (String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: const TextStyle(fontSize: 14),
                              ),
                            );
                          },
                        ).toList(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
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