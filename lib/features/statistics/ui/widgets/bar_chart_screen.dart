import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BarChartScreen extends StatefulWidget {
  const BarChartScreen({super.key});

  @override
  _BarChartScreenState createState() => _BarChartScreenState();
}

class _BarChartScreenState extends State<BarChartScreen> {
  String selectedPeriod = 'Weekly'; // Dropdown uchun tanlangan holat
  final Map<String, List<double>> dummyData = {
    'Daily': [1, 2, 3, 4, 5, 6, 7],
    'Weekly': [5, 10, 20, 15, 18, 25, 30],
    'Monthly': [50, 60, 70, 80, 90, 100, 110],
    'Yearly': [200, 300, 400, 500, 600, 700, 800],
  };
  List<String> dropDownItems = ['Daily', 'Weekly', 'Monthly', 'Yearly'];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Select Period',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff171818),
                ),
              ),
              DropdownButton(
                value: selectedPeriod,
                items: dropDownItems
                    .map(
                      (period) => DropdownMenuItem(
                        value: period,
                        child: Text(
                          period,
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff171818),
                          ),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedPeriod  = value!;
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 16,),
          SizedBox(
            height: 200,
            child: BarChart(
              BarChartData(
                barGroups: _buildBarChartGroups(dummyData[selectedPeriod]!),
                titlesData: _buildTitles(),
                borderData: FlBorderData(
                  border: const Border.symmetric(
                    horizontal: BorderSide(color: Colors.grey, width: 1)
                  ),
                ),
                gridData: const FlGridData(drawHorizontalLine: true),

              ),
            ),
          ),
        ],
      ),
    );
  }
}

// BarChartGroupData ma'lumotlarini hosil qilish
List<BarChartGroupData> _buildBarChartGroups(List<double> values) {
  return values.asMap().entries.map((entry) {
    int index = entry.key;
    double value = entry.value;

    return BarChartGroupData(
      x: index,
      barRods: [
        BarChartRodData(
          toY: value,
          width: 12,
          borderRadius: BorderRadius.circular(8),
          color: Color(0xff66FBFF),
        ),
      ],
    );
  }).toList();
}

// X va Y o'qlar uchun yozuvlar
FlTitlesData _buildTitles() {
  return FlTitlesData(
    leftTitles: AxisTitles(
      sideTitles: SideTitles(
        showTitles: false,
        reservedSize: 40,
        getTitlesWidget: (value, meta) {
          return Text(
            value.toString(),
            style: const TextStyle(fontSize: 12),
          );
        },
      ),
    ),
    bottomTitles: AxisTitles(
      sideTitles: SideTitles(
        showTitles: true,
        getTitlesWidget: (value, meta) {
          const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
          return Text(
            days[value.toInt()],
            style: const TextStyle(fontSize: 12),
          );
        },
      ),
    ),
    topTitles: const AxisTitles(
      sideTitles: SideTitles(
        showTitles: false,
      )
    ),
    rightTitles: const AxisTitles(
        sideTitles: SideTitles(
          showTitles: false,
        )
    ),
  );
}


