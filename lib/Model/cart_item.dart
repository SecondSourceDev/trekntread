class CartItem {
  final String id;
  final String productId;
  final int quantity;
  final Map<String, dynamic> selectedAttributes; // size, color, etc.
  final double price; // Price at the time of adding to cart

  CartItem({
    required this.id,
    required this.productId,
    required this.quantity,
    required this.selectedAttributes,
    required this.price,
  });
}