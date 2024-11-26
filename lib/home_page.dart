import 'package:chart_example/bar_chart_example.dart';
import 'package:chart_example/donut_chart_example.dart';
import 'package:chart_example/line_chart_example.dart';
import 'package:chart_example/radar_chart_example.dart';
import 'package:chart_example/scatter_chart_example.dart';
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
          ],
        ),
      ),
    );
  }
}
