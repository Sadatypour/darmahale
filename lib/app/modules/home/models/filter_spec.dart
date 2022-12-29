class FilterSpecification {
  FilterSpecification({
    required this.specId,
    this.itemId,
    this.value,
    this.valueFrom,
    this.valueTo,
    this.itemTitle,
  });

  int specId;
  int? itemId;
  int? value;
  int? valueFrom;
  int? valueTo;
  String? itemTitle;
}
