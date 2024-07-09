
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wattchecker/bar%20graph/bottom_tiles.dart';
import 'package:wattchecker/bar%20graph/makegroup_data.dart';
import 'package:wattchecker/constants/colors.dart';
import 'package:wattchecker/models/device_info.dart';

class BarGraph extends StatefulWidget {
  final Device device_1;
  final Device device_2;
  final Device? device_3;
  const BarGraph({super.key, required this.device_1, required this.device_2, this.device_3});

  @override
  State<BarGraph> createState() => _BarGraphState();
}

class _BarGraphState extends State<BarGraph> {

  late List<BarChartGroupData> rawBarGroups;
  late List<BarChartGroupData> showingBarGroups;

  @override
  void initState() {
    super.initState();
    final barGroup1 = makeGroupData(0, widget.device_1.powerRatingPerYear.toDouble(), widget.device_1.powerRatingPerYear*1.2);
    final barGroup2 = makeGroupData(1, widget.device_2.powerRatingPerYear.toDouble(), widget.device_2.powerRatingPerYear*1.2);
    final barGroup3 = makeGroupData(2, widget.device_3!=null? widget.device_3!.powerRatingPerYear.toDouble() : 0, widget.device_3!=null? widget.device_3!.powerRatingPerYear*1.2 : 0);

    final items = [
      barGroup1,
      barGroup2,
      barGroup3
    ];
    rawBarGroups = items;
    showingBarGroups = rawBarGroups;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Expanded(
            child: BarChart(
              BarChartData(
                maxY: 1000,
                titlesData: const FlTitlesData(
                        show: true,
                        rightTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        topTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: bottomTitles,
                            reservedSize: 42,
                          ),
                        ),
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: false,
                            
                          ),
                        ),
                      ),
                      borderData: FlBorderData(
                        show: false,
                      ),
                      barGroups: showingBarGroups,
                      gridData: const FlGridData(show: false),
                    ),
                
              ),
          ),
          SizedBox(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Container(
                      height: 10,
                      width: 10,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: appCream
                      ),
                    ),
                    const SizedBox(width: 5,),
                    const Text('Annual energy usage', style: TextStyle(fontFamily: 'Inter', fontSize: 11, color: textGrey),)
                  ],
                ),
                Row(
                  children: [
                    Container(
                      height: 10,
                      width: 10,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: appGreen
                      ),
                    ),
                    const SizedBox(width: 5,),
                    const Text('Estimated annual cost', style: TextStyle(fontFamily: 'Inter', fontSize: 11, color: textGrey))
                  ],
                )
              ],
            ),
          )
        ],
      )
      );
    
  }
}