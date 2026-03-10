enum CriteriaType { benefit, cost }

class SAWCriteria {
  final String name;
  final double weight; // Bobot (total harus 1.0)
  final CriteriaType type;

  const SAWCriteria({
    required this.name,
    required this.weight,
    required this.type,
  });
}

class SAWEvaluator {
  // Bobot kriteria yang di-hardcode
  static const List<SAWCriteria> criteria = [
    SAWCriteria(name: 'Potensi Pasar', weight: 0.30, type: CriteriaType.benefit),
    SAWCriteria(name: 'Modal Awal', weight: 0.25, type: CriteriaType.cost), // Semakin kecil modal semakin baik
    SAWCriteria(name: 'Tingkat Persaingan', weight: 0.20, type: CriteriaType.cost), // Semakin sedikit saingan semakin baik
    SAWCriteria(name: 'Estimasi Keuntungan', weight: 0.15, type: CriteriaType.benefit),
    SAWCriteria(name: 'Risiko Usaha', weight: 0.10, type: CriteriaType.cost), // Semakin kecil risiko semakin baik
  ];

  /// Menghitung skor akhir berdasarkan input pengguna (skala 1-5)
  /// scores: List nilai 1-5 berurutan sesuai kriteria di atas
  double evaluate(List<double> scores) {
    if (scores.length != criteria.length) {
      throw Exception('Jumlah skor tidak sama dengan jumlah kriteria');
    }

    // Untuk normalisasi, kita asumsikan nilai max = 5, min = 1
    // Dalam kasus nyata, kita butuh min/max dari seluruh alternatif (calon bisnis)
    // Di sini kita simplifikasi dengan menggunakan batas absolut 1 dan 5
    const double maxAbs = 5.0;
    const double minAbs = 1.0;

    double finalScore = 0.0;

    for (int i = 0; i < criteria.length; i++) {
      double normalizedValue = 0.0;
      if (criteria[i].type == CriteriaType.benefit) {
        // Normalisasi benefit: nilai / max
        normalizedValue = scores[i] / maxAbs;
      } else {
        // Normalisasi cost: min / nilai
        normalizedValue = minAbs / scores[i];
      }

      finalScore += normalizedValue * criteria[i].weight;
    }

    return finalScore;
  }

  String getCategory(double finalScore) {
    if (finalScore >= 0.8) return 'Sangat Layak';
    if (finalScore >= 0.6) return 'Layak';
    if (finalScore >= 0.4) return 'Cukup Layak';
    return 'Tidak Layak';
  }
}
