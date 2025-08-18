import 'package:flutter/material.dart';
import 'package:practice_app/homepage/drawer_widget/final_candidate.dart';
import 'package:practice_app/theme/theme_extension.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isWeb = screenWidth > 600;

    return Material(
      elevation: 6,
      borderRadius: BorderRadius.circular(10),

      child: Container(
        decoration: BoxDecoration(
          color: context.themeRef.colorScheme.onPrimary,
          borderRadius: BorderRadius.circular(10),
        ),
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
                child: Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  children: [
                    SummaryCard(
                      title: "Final Candidate",
                      count: "0",
                      percent: "+ 0 %",
                      color: Colors.deepPurple,
                    ),

                    SummaryCard(
                      title: "Black List",
                      count: "0",
                      percent: "+ 0 %",
                      color: Colors.red,
                    ),
                    SummaryCard(
                      title: "Job Left",
                      count: "0",
                      percent: "+ 0 %",
                      color: Colors.blue,
                    ),
                    SummaryCard(
                      title: "On Job",
                      count: "0",
                      percent: "+ 0 %",
                      color: Colors.green,
                    ),
                    SummaryCard(
                      title: "On Job",
                      count: "0",
                      percent: "+ 0 %",
                      color: Colors.blueAccent,
                    ),
                    SummaryCard(
                      title: "On Job",
                      count: "0",
                      percent: "+ 0 %",
                      color: Colors.orangeAccent,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 250),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 100,
                      width: 400,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        border: Border.all(
                          color: const Color.fromARGB(255, 235, 232, 232),
                        ),
                      ),
                    ),
                    Container(
                      height: 100,
                      width: 900,
                      decoration: BoxDecoration(
                        color: Colors.orangeAccent,
                        border: Border.all(
                          color: const Color.fromARGB(255, 235, 232, 232),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
