class Helper {
  static List<double> convertCoordinate(String coordinate) {
    var list = coordinate.split(",");
    return list.map((e) => double.parse(e)).toList();
  }
}
