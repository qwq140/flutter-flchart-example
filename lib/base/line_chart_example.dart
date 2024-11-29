import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartExample extends StatelessWidget {
  const LineChartExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Line Chart Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: LineChart(
          LineChartData(
            maxY: 4,
            titlesData: FlTitlesData(
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 30,
                )
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 30,
                  interval: 1,
                ),
              ),
              rightTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              topTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
            ),
            borderData: FlBorderData(
              show: true,
              border: Border.all(
                color: Colors.black,
                width: 1
              )
            ),
            lineBarsData: [
              LineChartBarData(
                spots: [
                  FlSpot(0, 1), // (X축, Y축) 좌표
                  FlSpot(1, 1.5),
                  FlSpot(2, 1.4),
                  FlSpot(3, 3.4),
                  FlSpot(4, 2),
                  FlSpot(5, 2.2),
                  FlSpot(6, 1.8),
                ],
                isCurved: false, // 곡선 형태로 표시, 곡선으로 표시할 때 모양은 이뻐보이지만 정확도가 떨어지는 느낌
                color: Colors.blue,
                barWidth: 3, // 선 두께
                isStrokeCapRound: true,
                belowBarData: BarAreaData(
                  show: true,
                  color: Colors.blue.withOpacity(0.3),
                ),
                dotData: FlDotData(
                  show: false,
                ),
              )
            ]
          )
        ),
      ),
    );
  }
}
