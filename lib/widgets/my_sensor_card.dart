
import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_5/constants.dart';


class MySensorCard extends StatelessWidget {
  const MySensorCard(
      {super.key, 
      required this.value,
      required this.name,
      required this.assetImage,
      required this.unit,
      required this.trendData,
      required this.linePoint});

  final double value;
  final String name;
  final String unit;
  final List<double> trendData;
  final Color linePoint;
  final AssetImage assetImage;

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        shadowColor: const Color.fromARGB(255, 210, 236, 176),
        elevation: 24,
        color: kBackgroundColor,
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          height: 180,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image(
                      width: 60,
                      image: assetImage,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(name, style: const TextStyle(color: Colors.white)),
                    const SizedBox(
                      height: 10,
                    ),
                    Text('$value$unit',
                        style: const TextStyle(color: Colors.white)),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 8),
                  child: Sparkline(
                    data: trendData,
                    lineWidth: 5.0,
                    lineColor: linePoint,
                    averageLine: true,
                    fillMode: FillMode.below,
                    sharpCorners: false,
                    pointsMode: PointsMode.last,
                    pointSize: 20,
                    pointColor: linePoint,
                    useCubicSmoothing: true,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
  }
}