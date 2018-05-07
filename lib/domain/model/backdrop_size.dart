class BackdropSize {
  static const SMALL = const BackdropSize._("w300");
  static const BIG = const BackdropSize._("w780");

  static get values => [SMALL, BIG];

  final String value;

  const BackdropSize._(this.value);
}