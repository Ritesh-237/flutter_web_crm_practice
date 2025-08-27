import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:practice_app/drawer_widget/final_candidate.dart';
import 'package:practice_app/models/candidates.dart';
import 'package:practice_app/utils/extensions.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'summarycard.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = context.media.width;
    final isWeb = screenWidth > 600;
    ColorScheme myColors = context.themeRef.colorScheme;

    return Container(
      width: screenWidth,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: myColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(10),
      ),
      height: context.media.height,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Row(children: []),
            Container(
              // height: context.media.wi * 0.15,
              width: screenWidth,
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: myColors.onTertiaryContainer,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: myColors.shadow.withAlpha(10),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(2, 5),
                  ),
                ],
              ),
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  SummaryCard(
                    title: "Available Candidates",
                    count: "20",
                    percent: "+ 1 %",
                    color: Colors.green,
                    icon: Icons.card_travel,
                  ),

                  SummaryCard(
                    title: "Working Candidates",
                    count: "0",
                    percent: "+ 0 %",
                    color: Colors.blue,
                    icon: Icons.card_travel,
                  ),
                  SummaryCard(
                    title: "Job Left",
                    count: "0",
                    percent: "+ 0 %",
                    color: Colors.pink,
                    icon: Icons.card_travel,
                  ),

                  SummaryCard(
                    title: "My Insentives",
                    count: "₹ 1000",
                    percent: "+ 0 %",
                    color: Colors.purple,
                    icon: Icons.card_travel,
                  ),
                  SummaryCard(
                    title: "Disputes",
                    count: "0",
                    percent: "+ 0 %",
                    color: Colors.deepOrangeAccent,
                    icon: Icons.card_travel,
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
