import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class StackedBarChartExample extends StatelessWidget {
  const StackedBarChartExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('누적 바 차트'),
      ),
      body: SafeArea(child: _Body()),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          maxY: 100, // Y축의 최대 값
          barGroups: _createBarGroups(), // 바 데이터 그룹
          titlesData: _buildTitlesData(), // X, Y 축 레이블
          borderData: FlBorderData(show: false), // 테두리 제거
        ),
      ),
    );
  }

  /// X축, Y축 타이틀 데이터
  FlTitlesData _buildTitlesData() {
    return FlTitlesData(
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 40,
        ),
      ),
      bottomTitles: AxisTitles(
          sideTitles: SideTitles(
        showTitles: true,
        interval: 1,
        reservedSize: 30,
        getTitlesWidget: (value, meta) => SideTitleWidget(
          axisSide: meta.axisSide,
          child: Text('Day ${value.toInt()}'),
        ),
      )),
      rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
    );
  }

  /// Bar 데이터를 생성
  List<BarChartGroupData> _createBarGroups() {
    return List.generate(5, (i) {
      return BarChartGroupData(
        x: i, // X축 위치
        barRods: [
          BarChartRodData(
            toY: 100, // 바의 전체 높이 (누적)
            rodStackItems: [
              BarChartRodStackItem(0, 30, Colors.blue), // 첫 번째 섹션
              BarChartRodStackItem(30, 70, Colors.red), // 두 번째 섹션
              BarChartRodStackItem(70, 100, Colors.green), // 세 번째 섹션
            ],
            width: 20, // 바의 너비
          ),
        ],
      );
    });
  }
}
