import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

// 히스토그램은 데이터를 구간(bin)으로 나누고, 각 구간에 속한 값의 개수를 계산해야 한다.
// 각 구간(bin)데이터 개수를 BarChart로 시각화한다.
class HistogramExample extends StatelessWidget {
  const HistogramExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('히스토그램'),
      ),
      body: SafeArea(child: _Body()),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({super.key});

  @override
  Widget build(BuildContext context) {
    // 히스토그램 데이터
    final histogramData = [1, 2, 2, 3, 3, 3, 4, 5, 5, 5, 5, 6, 7, 7, 8, 8, 9, 10];

    // 구간(bin) 개수 및 데이터 처리
    final binCount = 5; // 구간(bin) 개수
    final bins = _generateHistogramBins(histogramData, binCount);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          maxY: bins.values.reduce((a, b) => a > b ? a : b).toDouble() + 1,
          // Y축 최대 값
          borderData: FlBorderData(show: true),
          barGroups: _createBarGroups(bins),
          titlesData: _buildTitlesData(bins.keys),
        ),
      ),
    );
  }

  // 데이터를 구간(bin)으로 그룹화하고 각 구간에 속한 데이터 개수를 계산
  Map<String, int> _generateHistogramBins(List<int> data, int binCount) {
    // 1. 데이터의 최솟값과 최댓값을 계산
    final min = data.reduce((a, b) => a < b ? a : b); // 최솟값
    final max = data.reduce((a, b) => a > b ? a : b); // 최댓값

    // 2. 각 구간의 크기 계산
    // ceil : 소수점을 올림 처리하여 정수로 만듬
    // (10 - 1) / 5 = 1.8 -> binSize = 2
    final binSize = ((max - min) / binCount).ceil();

    // 3. 빈 데이터를 저장할 맵 생성
    Map<String, int> bins = {};

    // 4. 구간(bin)별 데이터 개수 계산
    for (int i = 0; i < binCount; i++) {
      // 각 구간의 시작과 끝 값 계산
      final lowerBound =
          min + (i * binSize); // 구간 시작값 : 1 + (0 * 2), 1 + (1 * 2) ...
      final upperBound = lowerBound + binSize - 1; // 구간 끝값

      // 구간 이름을 문자열로 정의 (예 : 1-2)
      final key = "$lowerBound - $upperBound";

      // 현재 구간에 속하는 데이터 개수 계산
      bins[key] = data
          .where((value) => value >= lowerBound && value <= upperBound)
          .length;
    }
    return bins;
  }

  List<BarChartGroupData> _createBarGroups(Map<String, int> bins) {
    int index = 0;
    return bins.values.map(
      (e) {
        return BarChartGroupData(
          x: index++,
          barRods: [
            BarChartRodData(
              toY: e.toDouble(),
              width: 30,
              borderRadius: BorderRadius.circular(4),
              color: Colors.blueAccent,
            ),
          ],
        );
      },
    ).toList();
  }

  FlTitlesData _buildTitlesData(Iterable<String> binLabels) {
    return FlTitlesData(
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          getTitlesWidget: (value, meta) => SideTitleWidget(
            child: Text('${binLabels.elementAt(value.toInt())}'),
            axisSide: meta.axisSide,
          ),
          interval: 1,
          reservedSize: 40,
        ),
      ),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 40,
          interval: 1,
        ),
      ),
      rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
    );
  }
}
