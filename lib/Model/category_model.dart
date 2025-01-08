
// class Category {
//   final String icon;
//   final String label;

//   Category({required this.icon, required this.label});
// }






// category.dart
class Category {
  final String id; // Add unique identifier
  final String icon;
  final String label;
  final String? parentId; // For subcategories
  final List<String>? subCategories; // IDs of subcategories

  Category({
    required this.id,
    required this.icon,
    required this.label,
    this.parentId,
    this.subCategories,
  });

  // Add fromJson constructor
  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'] as String,
      icon: json['icon'] as String,
      label: json['label'] as String,
      parentId: json['parentId'] as String?,
      subCategories: (json['subCategories'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );
  }

  // Add toJson method
  Map<String, dynamic> toJson() => {
        'id': id,
        'icon': icon,
        'label': label,
        'parentId': parentId,
        'subCategories': subCategories,
      };
}