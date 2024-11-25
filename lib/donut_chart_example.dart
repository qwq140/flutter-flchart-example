import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class DonutChartExample extends StatelessWidget {
  const DonutChartExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Donut Chart'),
      ),
      body: _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        PieChart(
          // 도넛 차트를 위한 데이터를 설정합니다.
          PieChartData(
            sectionsSpace: 2, // 조각 간 가격
            centerSpaceRadius: 50, // 도넛 내부의 빈 공간 반지름
            sections: _getSections(), // 각 섹션의 값, 색상, 제목 등을 설정
          ),
        ),
        Text(
          '70%', // 중심에 표시할 텍스트
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }

  List<PieChartSectionData> _getSections() {
    return [
      PieChartSectionData(
          value: 40, // 섹션의 값 (퍼센트로 나뉨)
          color: Colors.blue, // 섹션의 색상
          title: '40%', // 섹션에 표시할 텍스트
          radius: 60, // 섹션의 반지름
          titleStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          )),
      PieChartSectionData(
          value: 30,
          // 데이터 값 (퍼센트로 계산 가능)
          color: Colors.red,
          title: '30%',
          radius: 60,
          titleStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          )),
      PieChartSectionData(
          value: 20,
          // 데이터 값 (퍼센트로 계산 가능)
          color: Colors.green,
          title: '20%',
          radius: 60,
          titleStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          )),
      PieChartSectionData(
          value: 10,
          // 데이터 값 (퍼센트로 계산 가능)
          color: Colors.yellow,
          title: '10%',
          radius: 60,
          titleStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          )),
    ];
  }
}
