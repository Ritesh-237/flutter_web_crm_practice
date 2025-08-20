import 'package:flutter/material.dart';
import 'package:practice_app/auth/logout_timer_provider.dart';
import 'package:practice_app/test.dart';
import 'package:practice_app/theme/theme_provider.dart';
import 'package:practice_app/utils/extensions.dart';
import 'package:provider/provider.dart';
import '../auth/user_manager.dart';
import 'menu_config.dart';
import 'menu_item.dart';
import 'sidebar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;
  bool isSidebarExpanded = true;

  late final List<MenuItemModel> menuItems;
  String _format(Duration d) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    final hours = twoDigits(d.inHours);
    final minutes = twoDigits(d.inMinutes.remainder(60));
    final seconds = twoDigits(d.inSeconds.remainder(60));
    return "$hours:$minutes:$seconds";
  }

  @override
  void initState() {
    super.initState();
    final userManager = UserManager();
    menuItems =
        userManager.isCustomer()
            ? MenuConfig.getCustomerMenu()
            : MenuConfig.getAdminMenu();
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme myColors = context.themeRef.colorScheme;
    final screenWidth = context.media.width;
    final isWeb = screenWidth > 600;
    final isDark = Provider.of<ThemeProvider>(context).isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        // backgroundColor: myColors.primaryContainer,
        backgroundColor: myColors.inversePrimary,
        title:
            isWeb
                ? Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        isSidebarExpanded ? Icons.arrow_back : Icons.menu,
                      ),
                      onPressed: () {
                        setState(() => isSidebarExpanded = !isSidebarExpanded);
                      },
                    ),

                    const SizedBox(width: 50),

                    GestureDetector(
                      onTap:
                          () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Test(),
                            ),
                          ),
                      child: const Text("PRACTICE APP CRM"),
                    ),
                  ],
                )
                : SizedBox(
                  width: screenWidth * 0.50,
                  height: context.media.height * 0.045,
                  child: SearchBar(
                    trailing: [Icon(Icons.search)],
                    hintText: "Search lead",
                    elevation: WidgetStateProperty.all(0),
                  ),
                ),
        actions: [
          Center(
            child: Consumer<LogoutTimerProvider>(
              builder: (context, countdown, child) {
                return Text(
                  "Session ends in: ${_format(countdown.remaining)}",
                  style: const TextStyle(
                    // fontSize: 20,
                    // fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
          ),
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
      drawer:
          isWeb
              ? null
              : Drawer(
                child: Sidebar(
                  myColors: myColors,
                  items: menuItems,
                  selectedIndex: selectedIndex,
                  isExpanded: true,
                  onItemSelected: (i) {
                    setState(() => selectedIndex = i);
                    Navigator.pop(context);
                  },
                ),
              ),
      body: Row(
        children: [
          if (isWeb)
            Sidebar(
              items: menuItems,
              selectedIndex: selectedIndex,
              isExpanded: isSidebarExpanded,
              myColors: myColors,
              onItemSelected: (i) => setState(() => selectedIndex = i),
            ),
          Expanded(
            child: IndexedStack(
              index: selectedIndex,
              children: menuItems.map((e) => e.page).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
