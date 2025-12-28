import 'package:aerium/core/layout/adaptive.dart';
import 'package:aerium/values/values.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class StatItem {
  final String value;
  final String label;

  const StatItem({required this.value, required this.label});
}

class StatsBar extends StatelessWidget {
  const StatsBar({Key? key}) : super(key: key);

  static const List<StatItem> stats = [
    StatItem(value: "18+", label: "Years Experience"),
    StatItem(value: "987", label: "Published Articles"),
    StatItem(value: "65", label: "Sports Events Covered"),
    StatItem(value: "50+", label: "TV Appearances"),
    StatItem(value: "4", label: "Prime Ministers Interviewed"),
    StatItem(value: "3", label: "Continents Covered"),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.deepNavy,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      child: Wrap(
        alignment: WrapAlignment.spaceEvenly,
        spacing: 20,
        runSpacing: 30,
        children: stats.map((stat) => _buildStatItem(context, stat)).toList(),
      ),
    );
  }

  Widget _buildStatItem(BuildContext context, StatItem stat) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            stat.value,
            style: TextStyle(
              color: AppColors.white,
              fontSize: 42,
              fontWeight: FontWeight.w400,
              height: 1.2,
            ),
          ),
          SizedBox(height: 8),
          Text(
            stat.label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.white,
              fontSize: 14,
              fontWeight: FontWeight.w300,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}

