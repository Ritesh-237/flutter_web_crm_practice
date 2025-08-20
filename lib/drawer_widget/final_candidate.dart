import 'package:flutter/material.dart';
import 'package:practice_app/utils/extensions.dart';

class FinalCandidateScreen extends StatelessWidget {
  const FinalCandidateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.themeRef.colorScheme.onPrimary,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Buttons
            Row(
              children: [
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 14,
                    ),
                  ),
                  onPressed: () {},
                  icon: const Icon(Icons.person_add, color: Colors.white),
                  label: const Text(
                    "NEW CANDIDATE",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(width: 16),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 14,
                    ),
                  ),
                  onPressed: () {},
                  icon: Icon(
                    Icons.group_add,
                    color: context.themeRef.colorScheme.onPrimary,
                  ),
                  label: const Text(
                    "ASSIGN CANDIDATE TO STAFF",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            Text(
              "FINAL CANDIDATE SUMMARY",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: context.themeRef.colorScheme.error,
              ),
            ),

            // const SizedBox(height: 12),
            Wrap(
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

            const SizedBox(height: 24),
            const Text(
              "ASSIGN CANDIDATE FOR CUSTOMER REPORT",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),

            const SizedBox(height: 12),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              childAspectRatio: 3,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              children: [
                _buildReportCard("Daily Report", "0", Colors.blue.shade200),
                _buildReportCard("Monthly Report", "0", Colors.green.shade200),
              ],
            ),

            const SizedBox(height: 24),
            const Text(
              "ADVANCE SEARCH",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 12),

            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                _buildTextField("Enter Location"),
                _buildDropdown("Select Service"),
                _buildDropdown("Select Gender"),
                _buildTextField("Enter Age"),
                _buildDateField("From Date"),
                _buildDateField("To Date"),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 16,
                    ),
                  ),
                  onPressed: () {},
                  icon: const Icon(Icons.search, color: Colors.white),
                  label: const Text(
                    "SEARCH",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                headingRowColor: WidgetStateProperty.all(Colors.deepPurple),
                headingTextStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                columns: const [
                  DataColumn(label: Text("DATE")),
                  DataColumn(label: Text("PHOTO")),
                  DataColumn(label: Text("NAME")),
                  DataColumn(label: Text("MOBILE NO")),
                  DataColumn(label: Text("SERVICE")),
                  DataColumn(label: Text("RELIGION")),
                  DataColumn(label: Text("WORKING HOURS")),
                  DataColumn(label: Text("LOCATION")),
                  DataColumn(label: Text("REMARK")),
                  DataColumn(label: Text("STATUS")),
                  DataColumn(label: Text("JOB STATUS")),
                  DataColumn(label: Text("ADDED BY")),
                  DataColumn(label: Text("ACTION")),
                ],
                rows: const [],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildReportCard(String title, String count, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const Spacer(),
          Text(
            count,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  static Widget _buildTextField(String hint) {
    return SizedBox(
      width: 200,
      child: TextField(
        decoration: InputDecoration(
          hintText: hint,
          border: const OutlineInputBorder(),
          isDense: true,
        ),
      ),
    );
  }

  static Widget _buildDropdown(String hint) {
    return SizedBox(
      width: 200,
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: hint,
          isDense: true,
        ),
        items: const [],
        onChanged: (value) {},
      ),
    );
  }

  static Widget _buildDateField(String hint) {
    return SizedBox(
      width: 200,
      child: TextField(
        decoration: InputDecoration(
          hintText: hint,
          border: const OutlineInputBorder(),
          prefixIcon: const Icon(Icons.calendar_today),
          isDense: true,
        ),
        readOnly: true,
      ),
    );
  }
}

class SummaryCard extends StatelessWidget {
  final String title;
  final String count;
  final String percent;
  final Color color;

  const SummaryCard({
    super.key,
    required this.title,
    required this.count,
    required this.percent,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    ColorScheme myColors = context.themeRef.colorScheme;
    return Container(
      height: context.media.height * 0.15,
      width: context.media.width * 0.15,
      decoration: BoxDecoration(
        color: color.withOpacity(0.9),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: myColors.surface,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          Text(
            count,
            style: TextStyle(
              color: myColors.surfaceContainer,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Monthly increase ($percent)",
            style: TextStyle(color: myColors.surfaceContainer),
          ),
        ],
      ),
    );
  }
}
