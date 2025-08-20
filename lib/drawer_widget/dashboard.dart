import 'package:flutter/material.dart';
import 'package:practice_app/drawer_widget/final_candidate.dart';
import 'package:practice_app/utils/extensions.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.media.width;
    final isWeb = screenWidth > 600;
    ColorScheme myColors = context.themeRef.colorScheme;

    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: myColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(10),
      ),
      height: context.media.height,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: context.media.height * 0.15,
              child: Wrap(
                spacing: 16,
                runSpacing: 16,
                children: [
                  SummaryCard(
                    title: "Available Candidates",
                    count: "20",
                    percent: "+ 1 %",
                    color: myColors.primaryContainer,
                  ),

                  SummaryCard(
                    title: "Working Candidates",
                    count: "0",
                    percent: "+ 0 %",
                    color: myColors.tertiary,
                  ),
                  SummaryCard(
                    title: "Job Left",
                    count: "0",
                    percent: "+ 0 %",
                    color: myColors.secondaryContainer,
                  ),

                  SummaryCard(
                    title: "My Insentives",
                    count: "₹ 1000",
                    percent: "+ 0 %",
                    color: myColors.secondary,
                  ),
                  SummaryCard(
                    title: "Disputes",
                    count: "0",
                    percent: "+ 0 %",
                    color: myColors.error,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
