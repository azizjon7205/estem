import 'package:estem/core/styles/app_colors.dart';
import 'package:estem/features/statistics/bloc/statistics_state.dart';
import 'package:estem/features/statistics/ui/widgets/bar_chart_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pie_chart/pie_chart.dart';

class StatisticsContent extends StatelessWidget {
  const StatisticsContent({super.key, required this.state});

  final StatisticsLoaded state;

  @override
  Widget build(BuildContext context) {
    List<Color> colorList = [
      const Color(0xffF59762),
      const Color(0xff29D697),
      const Color(0xff46CDFB),
      const Color(0xffFA4A42),
      const Color(0xff8C3EF1),
      const Color(0xffFDC400)
    ];

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Total surveys
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: 0.2),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    height: 72,
                    width: 72,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                            color:
                                const Color(0xff5669FF).withValues(alpha: 0.2))
                      ],
                    ),
                    child: Image.asset('assets/images/graph.png'),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${state.totalSurveys}',
                        style: GoogleFonts.inter(
                            fontSize: 48, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        'Completed surveys',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          color: AppColors.textSub1,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              padding: const EdgeInsets.only(
                  left: 20, top: 24, right: 20, bottom: 33),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: 0.2),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'By category',
                    style: GoogleFonts.inter(
                        fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      PieChart(
                        dataMap: state.categoryStats,
                        animationDuration: const Duration(milliseconds: 800),
                        chartLegendSpacing: 32,
                        chartRadius: MediaQuery.of(context).size.width / 3.2,
                        colorList: colorList,
                        chartType: ChartType.ring,
                        ringStrokeWidth: 26,
                        chartValuesOptions: const ChartValuesOptions(
                          showChartValues: false,
                        ),
                        legendOptions: LegendOptions(
                          showLegendsInRow: false,
                          legendPosition: LegendPosition.right,
                          showLegends: false,
                          legendShape: BoxShape.rectangle,
                          legendTextStyle: GoogleFonts.inter(
                              fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: state.categoryStats.entries.map((entry) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 6),
                            child: Row(
                              children: [
                                Container(
                                  height: 14,
                                  width: 14,
                                  color: colorList[state.categoryStats.keys
                                      .toList()
                                      .indexOf(entry.key)],
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  entry.key,
                                  style: GoogleFonts.inter(
                                      fontSize: 12, fontWeight: FontWeight.w400),
                                ),
                                const SizedBox(
                                  width: 18,
                                ),
                                Text(
                                  '${entry.value.toStringAsFixed(1)}%',
                                  style: GoogleFonts.inter(
                                      fontSize: 12, fontWeight: FontWeight.w400),
                                ),

                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16,),
            Container(
              padding: const EdgeInsets.only(top: 16, left: 12, right: 12, bottom: 12),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: 0.2),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: const BarChartScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
