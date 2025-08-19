import 'package:flutter/material.dart';
import 'package:practice_app/utils/extensions.dart';

class LeadScreen extends StatelessWidget {
  const LeadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.themeRef.colorScheme.onPrimary,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                _topButton("NEW LEADS", Icons.add, Colors.deepPurple, context),
                const SizedBox(width: 10),
                _topButton(
                  "TODAY'S REMINDER",
                  Icons.notifications,
                  Colors.purple,
                  context,
                ),
                const SizedBox(width: 10),
                _topButton(
                  "ASSIGN LEAD TO STAFF",
                  Icons.group,
                  Colors.deepPurple,
                  context,
                ),
              ],
            ),
            const SizedBox(height: 20),

            const Text(
              "LEADS SUMMARY",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                _summaryCard(
                  "Total Leads",
                  "12",
                  "100%",
                  "+0%",
                  Colors.green,
                  Colors.blue,
                ),
                _summaryCard(
                  "No Response",
                  "1",
                  "8%",
                  "+0%",
                  Colors.red,
                  Colors.teal,
                ),
                _summaryCard(
                  "Follow Up",
                  "3",
                  "25%",
                  "+0%",
                  Colors.purple,
                  Colors.deepPurple,
                ),
                _summaryCard(
                  "Not Interested",
                  "3",
                  "25%",
                  "+0%",
                  Colors.green,
                  Colors.red,
                ),
                _summaryCard(
                  "Paid",
                  "5",
                  "42%",
                  "+0%",
                  Colors.green,
                  Colors.orange,
                ),
              ],
            ),

            const SizedBox(height: 30),

            // Advance Search
            const Text(
              "ADVANCE SEARCH",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            Row(
              children: [
                _searchField("Enter Location"),
                const SizedBox(width: 10),
                _dropdownField("Select Service"),
                const SizedBox(width: 10),
                _dropdownField("Select Status"),
                const SizedBox(width: 10),
                _datePickerField(),
                const SizedBox(width: 10),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                  label: const Text("SEARCH"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                  ),
                ),
              ],
            ),
            SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  Widget _topButton(String text, IconData icon, Color color, context) {
    return ElevatedButton.icon(
      onPressed: () {
        if (text == "NEW LEADS") {
          showDialog(context: context, builder: (context) => AddLeadDialog());
        }
      },
      icon: Icon(icon, color: Colors.white),
      label: Text(text, style: const TextStyle(color: Colors.white)),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      ),
    );
  }

  Widget _summaryCard(
    String title,
    String count,
    String percent,
    String monthly,
    Color monthlyColor,
    Color cardColor,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        width: 290,
        height: 130,
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
            const SizedBox(height: 4),
            Text(
              count,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Monthly increase ($monthly)",
                  style: TextStyle(color: monthlyColor, fontSize: 12),
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 40,
                      height: 40,
                      child: CircularProgressIndicator(
                        value: double.parse(percent.replaceAll("%", "")) / 100,
                        strokeWidth: 4,
                        color: Colors.white,
                        backgroundColor: Colors.black26,
                      ),
                    ),
                    Text(
                      percent,
                      style: const TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _searchField(String hint) {
    return Expanded(
      child: TextField(
        decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 10,
          ),
        ),
      ),
    );
  }

  Widget _dropdownField(String hint) {
    return Expanded(
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 10,
          ),
        ),
        hint: Text(hint),
        items: const [
          DropdownMenuItem(value: "1", child: Text("Option 1")),
          DropdownMenuItem(value: "2", child: Text("Option 2")),
        ],
        onChanged: (value) {},
      ),
    );
  }

  Widget _datePickerField() {
    return Expanded(
      child: TextField(
        readOnly: true,
        decoration: InputDecoration(
          hintText: "dd-mm-yyyy",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          suffixIcon: const Icon(Icons.calendar_today),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 10,
          ),
        ),
        onTap: () {
          // implement date picker
        },
      ),
    );
  }
}

class AddLeadDialog extends StatefulWidget {
  const AddLeadDialog({super.key});

  @override
  State<AddLeadDialog> createState() => _AddLeadDialogState();
}

class _AddLeadDialogState extends State<AddLeadDialog> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController enquiryDateCtrl = TextEditingController();
  final TextEditingController nameCtrl = TextEditingController();
  final TextEditingController mobileCtrl = TextEditingController();
  final TextEditingController altMobileCtrl = TextEditingController();
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController locationCtrl = TextEditingController();
  final TextEditingController sizeCtrl = TextEditingController();
  final TextEditingController peopleCtrl = TextEditingController();
  final TextEditingController salaryCtrl = TextEditingController();
  final TextEditingController remarkCtrl = TextEditingController();

  String? source;
  String? prefix;
  String? enquiryFor;
  String? workingHours;
  String? status;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    enquiryDateCtrl.text =
        "${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year} "
        "${TimeOfDay.now().format(context)}";
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      insetPadding: const EdgeInsets.all(16),
      child: Container(
        width: context.media.width * 0.8,
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    "ADD LEAD",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        enabled: false,
                        initialValue: "test user",
                        decoration: const InputDecoration(
                          labelText: "Added By *",
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: TextFormField(
                        controller: enquiryDateCtrl,
                        readOnly: true,
                        decoration: InputDecoration(
                          labelText: "Enquiry Date *",
                          suffixIcon: Icon(Icons.calendar_today),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                Row(
                  children: [
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        decoration: const InputDecoration(
                          labelText: "Source *",
                        ),
                        items:
                            ["Google", "Referral", "Other"]
                                .map(
                                  (e) => DropdownMenuItem(
                                    value: e,
                                    child: Text(e),
                                  ),
                                )
                                .toList(),
                        onChanged: (val) => setState(() => source = val),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        decoration: const InputDecoration(
                          labelText: "Prefix *",
                        ),
                        items:
                            ["Mr.", "Mrs.", "Ms."]
                                .map(
                                  (e) => DropdownMenuItem(
                                    value: e,
                                    child: Text(e),
                                  ),
                                )
                                .toList(),
                        onChanged: (val) => setState(() => prefix = val),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: nameCtrl,
                        decoration: const InputDecoration(labelText: "Name *"),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: TextFormField(
                        controller: mobileCtrl,
                        decoration: const InputDecoration(
                          labelText: "Mobile No *",
                        ),
                        keyboardType: TextInputType.phone,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: altMobileCtrl,
                        decoration: const InputDecoration(
                          labelText: "Alternate Mobile No",
                        ),
                        keyboardType: TextInputType.phone,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: TextFormField(
                        controller: emailCtrl,
                        decoration: const InputDecoration(
                          labelText: "Email Id",
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: locationCtrl,
                        decoration: const InputDecoration(
                          labelText: "Location *",
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        decoration: const InputDecoration(
                          labelText: "Enquiry For *",
                        ),
                        items:
                            ["Service 1", "Service 2"]
                                .map(
                                  (e) => DropdownMenuItem(
                                    value: e,
                                    child: Text(e),
                                  ),
                                )
                                .toList(),
                        onChanged: (val) => setState(() => enquiryFor = val),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                Row(
                  children: [
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        decoration: const InputDecoration(
                          labelText: "Working Hours *",
                        ),
                        items:
                            ["4 Hours", "8 Hours", "12 Hours"]
                                .map(
                                  (e) => DropdownMenuItem(
                                    value: e,
                                    child: Text(e),
                                  ),
                                )
                                .toList(),
                        onChanged: (val) => setState(() => workingHours = val),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: TextFormField(
                        controller: sizeCtrl,
                        decoration: const InputDecoration(
                          labelText: "Size of the House",
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: peopleCtrl,
                        decoration: const InputDecoration(
                          labelText: "Number of people in house",
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: TextFormField(
                        controller: salaryCtrl,
                        decoration: const InputDecoration(labelText: "Salary"),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                Row(
                  children: [
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        decoration: const InputDecoration(
                          labelText: "Status *",
                        ),
                        items:
                            ["Open", "Pending", "Closed"]
                                .map(
                                  (e) => DropdownMenuItem(
                                    value: e,
                                    child: Text(e),
                                  ),
                                )
                                .toList(),
                        onChanged: (val) => setState(() => status = val),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                TextFormField(
                  controller: remarkCtrl,
                  decoration: const InputDecoration(labelText: "Remark *"),
                  maxLines: 2,
                ),

                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      child: const Text("Cancel"),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      child: const Text("Save"),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // TODO: Handle save action
                          Navigator.pop(context);
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
