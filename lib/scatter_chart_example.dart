import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ScatterChartExample extends StatelessWidget {
  const ScatterChartExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scatter Chart'),
      ),
      body: _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ScatterChart(
        ScatterChartData(
          scatterSpots: _getSpots(),
          minX: 0,
          maxX: 10,
          minY: 0,
          maxY: 10,
          gridData: FlGridData(
            show: true,
            drawHorizontalLine: true,
            drawVerticalLine: true,
            horizontalInterval: 2,
            verticalInterval: 2,
            getDrawingHorizontalLine: (value) => FlLine(
              color: Colors.grey.withOpacity(0.5),
              strokeWidth: 1,
              dashArray: [4, 4],
            ),
            getDrawingVerticalLine: (value) => FlLine(
              color: Colors.grey.withOpacity(0.5),
              strokeWidth: 1,
              dashArray: [4, 4],
            ),
          ),
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 2,
                reservedSize: 20,
                getTitlesWidget: (value, meta) {
                  return Text('${value.toInt()}');
                },
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 2,
                reservedSize: 20,
                getTitlesWidget: (value, meta) {
                  return Text('${value.toInt()}');
                },
              ),
            ),
            topTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: false,
              )
            ),
            rightTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: false,
              )
            )
          ),
          borderData: FlBorderData(
            show: true,
            border: Border.all(color: Colors.black, width: 1),
          )
        ),
      ),
    );
  }

  List<ScatterSpot> _getSpots() {
    return [
      ScatterSpot(1, 1, dotPainter: FlDotCirclePainter(color: Colors.red)),
      ScatterSpot(2, 3, dotPainter: FlDotCirclePainter(color: Colors.green)),
      ScatterSpot(3, 7, dotPainter: FlDotCirclePainter(color: Colors.blue)),
      ScatterSpot(6, 5, dotPainter: FlDotCirclePainter(color: Colors.orange)),
    ];
  }
}
