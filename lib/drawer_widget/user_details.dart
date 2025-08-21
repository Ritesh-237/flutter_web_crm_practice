import 'package:flutter/material.dart';
import 'package:practice_app/utils/extensions.dart';
import 'package:provider/provider.dart';

import '../theme/theme_provider.dart';

// Assume ThemeProvider and extensions are defined elsewhere
class UserDetailsPage extends StatelessWidget {
  const UserDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme myColors = Theme.of(context).colorScheme;
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isWeb = screenWidth > 600;
    final bool isDark = Provider.of<ThemeProvider>(context).isDarkMode(context);

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: myColors.surfaceContainerLow,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: myColors.shadow.withAlpha(30),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(5, 5),
            ),
          ],
        ),
        height: context.media.height,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              ListTile(
                style: ListTileStyle.drawer,
                dense: true,
                leading: ClipOval(
                  child: Image.asset(
                    "lib/assets/man.png",
                    height: 80,
                    width: 80,
                    // fit: BoxFit.fill,
                  ),
                ),
                title: const Text(
                  "User Name",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 14),
                ),
                trailing: ElevatedButton.icon(
                  icon: const Icon(Icons.logout),
                  label: const Text('Logout'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: myColors.error,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                  ),
                  onPressed: () => _confirmLogout(context),
                ),
              ),
              SizedBox(height: 20),
              Wrap(
                spacing: 20,
                runSpacing: 20,
                children: [
                  _buildField('Name', 'John Doe'),
                  _buildField('Age', '29'),
                  _buildField('Date of Birth', '1996-07-15'),
                  _buildField('Address', '1234 Main Street, Springfield, IL'),
                  _buildField('Office Address', '456 Corporate Ave, NY'),
                  _buildField('Designation', 'Senior Developer'),
                  _buildField('Employee ID', 'EMP98765'),
                  _buildField('Email', 'john.doe@example.com'),
                  _buildField('Phone Number', '+1 234 567 8901'),
                ],
              ),

              // const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildField(String title, String value) {
    return SizedBox(
      width: 350,
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 4),
              Text(value, style: const TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }

  void _confirmLogout(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (ctx) => AlertDialog(
            title: const Text('Confirm Logout'),
            content: const Text('Are you sure you want to logout?'),
            actions: [
              TextButton(
                child: const Text('Cancel'),
                onPressed: () => Navigator.of(ctx).pop(),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: const Text('Logout'),
                onPressed: () {
                  Navigator.of(ctx).pop();
                  _logoutUser(context);
                },
              ),
            ],
          ),
    );
  }

  void _logoutUser(BuildContext context) {
    // Replace this with your logout logic (e.g., AuthProvider logout)
    Navigator.of(context).pushReplacementNamed('/login');
  }
}
