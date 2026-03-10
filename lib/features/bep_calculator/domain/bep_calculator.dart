class BEPCalculator {
  final double fixedCosts; // Biaya tetap per bulan (sewa, gaji, listrik, dll)
  final double variableCostPerUnit; // Biaya bahan baku/produksi per unit
  final double pricePerUnit; // Harga jual per unit

  BEPCalculator({
    required this.fixedCosts,
    required this.variableCostPerUnit,
    required this.pricePerUnit,
  });

  /// Menghitung Break Even Point dalam unit
  /// Rumus BEP = Biaya Tetap / (Harga Jual - Biaya Variabel)
  double calculateBEPUnits() {
    if (pricePerUnit <= variableCostPerUnit) {
      throw Exception('Harga jual harus lebih besar dari biaya variabel');
    }
    return fixedCosts / (pricePerUnit - variableCostPerUnit);
  }

  /// Menghitung Break Even Point dalam Rupiah
  double calculateBEPRupiah() {
    return calculateBEPUnits() * pricePerUnit;
  }

  /// Simulasi proyeksi laba/rugi berdasarkan target penjualan (unit)
  double calculateProfit(double unitsSold) {
    final totalRevenue = unitsSold * pricePerUnit;
    final totalVariableCosts = unitsSold * variableCostPerUnit;
    final totalCosts = fixedCosts + totalVariableCosts;
    return totalRevenue - totalCosts;
  }
}
