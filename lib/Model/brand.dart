class Brand {
  final String id;
  final String name;
  final String logo;
  final String description;
  final bool isActive;

  Brand({
    required this.id,
    required this.name,
    required this.logo,
    this.description = '',
    this.isActive = true,
  });
}