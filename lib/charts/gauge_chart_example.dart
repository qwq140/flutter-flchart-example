import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

/**
 * 게이지 차트
 * 주로 속도계, 진행 상황, 퍼센트를 시각화하는 데 사용
 * 반원형 또는 원형 형태의 눈금과 색상 구분을 포함
 * 값의 크기에 따라 색상이나 게이지의 크기를 변화시켜 데이터를 표현
 */
class GaugeChartExample extends StatelessWidget {
  const GaugeChartExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gauge Chart'),
      ),
      body: _Body(),
    );
  }
}

class _Body extends StatefulWidget {
  const _Body({super.key});

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {

  // slider 초기값
  double _value = 50;

  // 값에 따라 색상을 결정하는 함수
  Color _getGaugeColor(double value) {
    if (value < 30) {
      return Colors.green;
    } else if (value < 70) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // 게이지 차트
        SizedBox(
          height: 200,
          child: PieChart(
            PieChartData(
              sections: [
                PieChartSectionData(
                  value: _value, // 현재값
                  title: _value.toStringAsFixed(1),
                  color: _getGaugeColor(_value),
                  radius: 50,
                ),
                PieChartSectionData(
                  value: 100 - _value, // 남은 부분
                  title: (100 - _value).toStringAsFixed(1),
                  color: Colors.grey[300],
                  radius: 50,
                ),
              ],
              startDegreeOffset: -90, // 12시 방향 시작
              centerSpaceRadius: 40, // 중앙 공간
            ),
          ),
        ),

        // 값 표시
        Text(
          "${_value.toInt()}%",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),

        // Slider
        Slider(
          value: _value,
          min: 0,
          max: 100,
          divisions: 100,
          label: "${_value.toInt()}",
          onChanged: (newValue) {
            setState(() {
              _value = newValue; // 값 업데이트
            });
          },
        ),
      ],
    );
  }
}
