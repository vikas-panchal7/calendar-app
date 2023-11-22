extension Ext on String? {
  bool get isNullOrEmpty => (this == null || (this?.isEmpty ?? true));
}
