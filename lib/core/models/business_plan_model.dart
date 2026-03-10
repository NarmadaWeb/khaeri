import 'package:freezed_annotation/freezed_annotation.dart';

part 'business_plan_model.freezed.dart';
part 'business_plan_model.g.dart';

@freezed
class BusinessPlanModel with _$BusinessPlanModel {
  const factory BusinessPlanModel({
    required String id,
    required String userId,
    String? interestCategory, // Kuliner, Kerajinan, Wisata, Retail
    double? initialCapital, // Modal Awal
    double? fixedCosts, // Biaya Tetap
    double? variableCosts, // Biaya Variabel
    double? estimatedSellingPrice, // Harga Jual
    @Default(3) int marketPotentialScore, // Skala 1-5
    @Default(3) int competitionScore, // Skala 1-5
    @Default(3) int riskScore, // Skala 1-5
    @Default(false) bool isEvaluated,
    double? sawFinalScore,
    String? sawCategory,
    double? bepUnits,
    double? bepRupiah,
  }) = _BusinessPlanModel;

  factory BusinessPlanModel.fromJson(Map<String, dynamic> json) =>
      _$BusinessPlanModelFromJson(json);
}
