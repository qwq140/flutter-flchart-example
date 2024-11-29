import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class RadarChartExample extends StatelessWidget {
  const RadarChartExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Radar Chart'),
      ),
      body: _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({super.key});

  @override
  Widget build(BuildContext context) {
    return RadarChart(
      RadarChartData(
        dataSets: _getDataSets(),
        gridBorderData: BorderSide(color: Colors.grey, width: 1),
        radarBorderData: BorderSide(color: Colors.black, width: 2),
        titlePositionPercentageOffset: 0,
        getTitle: (index, angle) {
          const titles = ['A', 'B', 'C', 'D', 'E'];
          return RadarChartTitle(text: titles[index]);
        },
        tickCount: 5, // 격자선의 단계
        tickBorderData: BorderSide(color: Colors.grey, width: 0.5),
        ticksTextStyle: TextStyle(color: Colors.black, fontSize: 10),
      ),
    );
  }

  List<RadarDataSet> _getDataSets() {
    return [
      RadarDataSet(
        dataEntries: [
          RadarEntry(value: 3),
          RadarEntry(value: 4),
          RadarEntry(value: 2),
          RadarEntry(value: 5),
          RadarEntry(value: 3),
        ],
        borderColor: Colors.blue,
        fillColor: Colors.blue.withOpacity(0.3),
        entryRadius: 4,
      ),
      RadarDataSet(
        dataEntries: [
          RadarEntry(value: 2),
          RadarEntry(value: 3),
          RadarEntry(value: 5),
          RadarEntry(value: 4),
          RadarEntry(value: 4),
        ],
        borderColor: Colors.red,
        fillColor: Colors.red.withOpacity(0.3),
        entryRadius: 4,
      ),
    ];
  }
}
