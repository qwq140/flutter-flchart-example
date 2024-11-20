import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarChartExample extends StatelessWidget {
  const BarChartExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: BarChart(
          BarChartData(
            barTouchData: BarTouchData(
              enabled: true,
            ),
            maxY: 110, // y축 최대값
            barGroups: [
              makeGroupData(0, 60, 20), // July
              makeGroupData(1, 50, 30), // August
              makeGroupData(2, 80, 20), // September
            ],
            titlesData: FlTitlesData(
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: bottomTitles,
                )
              ),
              leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: leftTitles,
                    reservedSize: 40,
                  )
              ),
              topTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              rightTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
            ),
            gridData: FlGridData(
              show: false,
            ),
            // TODO 테두리
            borderData: FlBorderData(
              show: false,
            )
          )
        ),
      ),
    );
  }

  Widget leftTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      fontSize: 10,
    );
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(
        '${meta.formattedValue} kg',
        style: style,
      ),
    );
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    const style = TextStyle(fontSize: 10);
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'July';
        break;
      case 1:
        text = 'Aug';
        break;
      case 2:
        text = 'Sep';
        break;
      default:
        text = '';
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(text, style: style),
    );
  }

  // BarGroup 데이터를 생성하는 메서드
  BarChartGroupData makeGroupData(int x, double muscleMass, double bodyFat) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: muscleMass+bodyFat,
          width: 15,
          borderRadius: BorderRadius.zero,
          rodStackItems: [
            BarChartRodStackItem(0, muscleMass, Colors.deepPurple),
            BarChartRodStackItem(muscleMass, muscleMass+bodyFat, Colors.redAccent),
          ]
        ),
      ],
    );
  }
}
