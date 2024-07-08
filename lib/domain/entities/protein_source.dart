class ProteinSource {
  ProteinSource({
    required this.name,
    required this.proteinGramsPerKg,
    required this.rawYieldPercentage,
    this.cookedYieldPercentage,
    this.proteinLossAfterCookingPercentage,
  })  : assert(proteinGramsPerKg >= 0 && proteinGramsPerKg <= 1000,
            'proteinGramsPerKg must be between 0 and 1000'),
        assert(rawYieldPercentage >= 0 && rawYieldPercentage <= 1,
            'rawYieldPercentage must be between 0 and 1'),
        assert(
            proteinLossAfterCookingPercentage == null ||
                (proteinLossAfterCookingPercentage >= 0 &&
                    proteinLossAfterCookingPercentage <= 1),
            'proteinLossAfterCookedPercentage must be between 0 and 1'),
        assert(
            cookedYieldPercentage == null ||
                (cookedYieldPercentage >= 0 && cookedYieldPercentage <= 1),
            'cookedYieldPercentage must be between 0 and 1');

  /// protein source name
  final String name;

  /// grams of protein per kg
  final double proteinGramsPerKg;

  /// not including bones, cartilage or skin
  /// values from 0 to 1
  final double rawYieldPercentage;

  /// not including bones, cartilage or skin
  /// values from 0 to 1
  final double? cookedYieldPercentage;

  final double? proteinLossAfterCookingPercentage;

  double? pricePerKg;

  //

  /// raw protein yield (not including bones, cartilage or skin)
  double get rawProteinYield => proteinGramsPerKg * rawYieldPercentage;

  /// protein yield after cooked (not including bones, cartilage or skin)
  double? get cookedProteinYield {
    if (proteinLossAfterCookingPercentage == null) return null;
    return rawProteinYield * (1 - proteinLossAfterCookingPercentage!);
  }
}
