import 'package:flutter/material.dart';
import 'package:practice_app/homepage/drawer_widget/dashboard.dart';
import 'package:practice_app/homepage/drawer_widget/final_candidate.dart';
import 'package:practice_app/homepage/drawer_widget/leads.dart';
import 'package:practice_app/test.dart';
import 'package:practice_app/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;

  List<String> drawerContentWeb = [
    "DASHBOARD",
    "LEADS",
    "OPPORTUNITY LEADS",
    "CANDIDATES",
    "FINAL CANDIDATE",
    "CUSTOMERS",
    "PAYMENT LINKS",
    "NEW VACANCY",
    "REPLACEMENTS",
    "TASKS",
    "DISPUTE",
  ];

  @override
  Widget build(BuildContext context) {
    ColorScheme myColors = Theme.of(context).colorScheme;
    final screenWidth = MediaQuery.of(context).size.width;
    final isWeb = screenWidth > 600;
    final isDark = Provider.of<ThemeProvider>(context).isDarkMode(context);

    return Scaffold(
      backgroundColor: myColors.surfaceContainerLow,
      drawer: isWeb ? null : const Drawer(),
      appBar: AppBar(
        elevation: 4,
        backgroundColor: myColors.primaryContainer,
        title:
            isWeb
                ? Row(
                  children: [
                    GestureDetector(
                      onTap:
                          () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Test(),
                            ),
                          ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          "lib/assets/testjdj.png",
                          height: 50,
                          width: 50,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    const SizedBox(width: 50),
                    const Text("PRACTICE APP CRM"),
                  ],
                )
                : SizedBox(
                  width: screenWidth * 0.50,
                  height: MediaQuery.of(context).size.height * 0.045,
                  child: SearchBar(
                    trailing: [Icon(Icons.search)],
                    hintText: "Search lead",
                    elevation: WidgetStateProperty.all(0),
                  ),
                ),
        actions: [
          if (isWeb)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: SizedBox(
                width: 300,
                child: SearchBar(
                  trailing: [Icon(Icons.search)],
                  hintText: "Search lead",
                  elevation: WidgetStateProperty.all(0),
                ),
              ),
            ),
          IconButton(
            onPressed: () {
              Provider.of<ThemeProvider>(
                context,
                listen: false,
              ).toggleTheme(!isDark);
            },
            icon: Icon(isDark ? Icons.wb_sunny_outlined : Icons.sunny),
          ),
          const SizedBox(width: 10),
          const Text("User Profile"),
          const SizedBox(width: 10),
          ClipOval(
            child: Image.asset(
              "lib/assets/testjdj.png",
              height: 45,
              width: 45,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Material(
            elevation: 4,

            child: Container(
              width: screenWidth * 0.10,
              height: MediaQuery.of(context).size.height,
              color: const Color.fromARGB(255, 233, 241, 255),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: drawerContentWeb.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 8),
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 10,
                      ),
                      decoration: BoxDecoration(
                        color:
                            selectedIndex == index
                                ? myColors.tertiaryContainer
                                : Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              drawerContentWeb[index],
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF5C5C5C),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Builder(
                builder: (context) {
                  switch (selectedIndex) {
                    case 0:
                      return DashboardScreen();
                    case 1:
                      return LeadScreen();
                    case 2:
                      return const Text("Opportunity Leads");
                    case 3:
                      return const Text("Candidates");
                    case 4:
                      return FinalCandidateScreen();
                    case 5:
                      return const Text("Customers");
                    case 6:
                      return const Text("Payment Link");
                    case 7:
                      return const Text("New Vacancy");
                    case 8:
                      return const Text("Replacements");
                    case 9:
                      return const Text("Tasks");
                    case 10:
                      return const Text("Dispute");
                    default:
                      return const Text("Unknown Page");
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
