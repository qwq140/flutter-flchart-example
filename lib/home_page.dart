import 'package:chart_example/base/bar_chart_example.dart';
import 'package:chart_example/base/donut_chart_example.dart';
import 'package:chart_example/base/line_chart_example.dart';
import 'package:chart_example/base/radar_chart_example.dart';
import 'package:chart_example/charts/gauge_chart_example.dart';
import 'package:chart_example/base/scatter_chart_example.dart';
import 'package:chart_example/charts/histogram_example.dart';
import 'package:chart_example/charts/stacked_bar_chart_example.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('fl_chart example')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BarChartExample(),
                  ),
                );
              },
              child: Text('Bar Chart Example'),
            ),
            SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LineChartExample(),
                  ),
                );
              },
              child: Text('Line Chart Example'),
            ),
            SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DonutChartExample(),
                  ),
                );
              },
              child: Text('Donut Chart Example'),
            ),
            SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ScatterChartExample(),
                  ),
                );
              },
              child: Text('Scatter Chart Example'),
            ),
            SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RadarChartExample(),
                  ),
                );
              },
              child: Text('Radar Chart Example'),
            ),
            SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GaugeChartExample(),
                  ),
                );
              },
              child: Text('Gauge Chart Example'),
            ),
            SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StackedBarChartExample(),
                  ),
                );
              },
              child: Text('Stacked Bar Chart Example'),
            ),
            SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HistogramExample(),
                  ),
                );
              },
              child: Text('Histogram Example'),
            ),
          ],
        ),
      ),
    );
  }
}
