import 'package:flutter/material.dart';
import 'package:practice_app/utils/extensions.dart';

class SummaryCard extends StatelessWidget {
  final String title;
  final String count;
  final String percent;
  final Color color;
  final IconData icon;

  const SummaryCard({
    super.key,
    required this.title,
    required this.count,
    required this.percent,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    ColorScheme myColors = context.themeRef.colorScheme;
    return SizedBox(
      width: context.media.width * 0.15,
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: color.withAlpha(50),
            ),
            child: Icon(icon, color: color),
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 12, color: myColors.outline),
              ),
              Text(
                count,
                style: TextStyle(
                  fontSize: 18,
                  color: myColors.shadow,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                percent,
                style: TextStyle(fontSize: 12, color: Colors.green),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
