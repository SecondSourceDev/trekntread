// class Product {
//   final String name;
//   final double price;
//   final double originalPrice;
//   final String imageUrl;
//   final double discount;

//   Product({
//     required this.name,
//     required this.price,
//     required this.originalPrice,
//     required this.imageUrl,
//     required this.discount,
//   });
// }



class Product {
  final String id; // Add unique identifier
  final String name;
  final double price;
  final double originalPrice;
  final String imageUrl;
  final double discount;
  final String categoryId; // Reference to category
  final String brand;
  final List<String> images; // Multiple product images
  final Map<String, dynamic> attributes; // Dynamic attributes (size, color, etc.)
  final int stockQuantity;
  final DateTime dateAdded;
  final bool isActive;
  final List<String> tags;
  final String description;
  
  // Computed properties
  double get discountAmount => originalPrice - price;
  double get discountPercentage => (discountAmount / originalPrice) * 100;
  bool get inStock => stockQuantity > 0;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.originalPrice,
    required this.imageUrl,
    required this.discount,
    required this.categoryId,
    required this.brand,
    this.images = const [],
    this.attributes = const {},
    this.stockQuantity = 0,
    DateTime? dateAdded,
    this.isActive = true,
    this.tags = const [],
    this.description = '',
  }) : dateAdded = dateAdded ?? DateTime.now();

  // Add fromJson constructor
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as String,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      originalPrice: (json['originalPrice'] as num).toDouble(),
      imageUrl: json['imageUrl'] as String,
      discount: (json['discount'] as num).toDouble(),
      categoryId: json['categoryId'] as String,
      brand: json['brand'] as String,
      images: (json['images'] as List<dynamic>?)?.map((e) => e as String).toList() ?? [],
      attributes: json['attributes'] as Map<String, dynamic>? ?? {},
      stockQuantity: json['stockQuantity'] as int? ?? 0,
      dateAdded: json['dateAdded'] != null 
          ? DateTime.parse(json['dateAdded'] as String)
          : null,
      isActive: json['isActive'] as bool? ?? true,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ?? [],
      description: json['description'] as String? ?? '',
    );
  }

  // Add toJson method
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'price': price,
        'originalPrice': originalPrice,
        'imageUrl': imageUrl,
        'discount': discount,
        'categoryId': categoryId,
        'brand': brand,
        'images': images,
        'attributes': attributes,
        'stockQuantity': stockQuantity,
        'dateAdded': dateAdded.toIso8601String(),
        'isActive': isActive,
        'tags': tags,
        'description': description,
      };

  // Add copyWith method for immutability
  Product copyWith({
    String? id,
    String? name,
    double? price,
    double? originalPrice,
    String? imageUrl,
    double? discount,
    String? categoryId,
    String? brand,
    List<String>? images,
    Map<String, dynamic>? attributes,
    int? stockQuantity,
    DateTime? dateAdded,
    bool? isActive,
    List<String>? tags,
    String? description,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      originalPrice: originalPrice ?? this.originalPrice,
      imageUrl: imageUrl ?? this.imageUrl,
      discount: discount ?? this.discount,
      categoryId: categoryId ?? this.categoryId,
      brand: brand ?? this.brand,
      images: images ?? this.images,
      attributes: attributes ?? this.attributes,
      stockQuantity: stockQuantity ?? this.stockQuantity,
      dateAdded: dateAdded ?? this.dateAdded,
      isActive: isActive ?? this.isActive,
      tags: tags ?? this.tags,
      description: description ?? this.description,
    );
  }
}