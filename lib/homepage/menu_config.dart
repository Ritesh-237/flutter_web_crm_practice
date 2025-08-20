import 'package:flutter/material.dart';
import 'menu_item.dart';
import '../drawer_widget/dashboard.dart';
import '../drawer_widget/leads.dart';
import '../drawer_widget/final_candidate.dart';

class MenuConfig {
  static List<MenuItemModel> getCustomerMenu() => [
    MenuItemModel(
      title: "Dashboard",
      icon: Icons.dashboard,
      page: DashboardScreen(),
    ),
    MenuItemModel(title: "Leads", icon: Icons.people, page: LeadScreen()),
    MenuItemModel(
      title: "Opportunity Leads",
      icon: Icons.trending_up,
      page: const Text("Opportunity Leads"),
    ),
    MenuItemModel(
      title: "Candidates",
      icon: Icons.work,
      page: const Text("Candidates"),
    ),
    MenuItemModel(
      title: "Final Candidate",
      icon: Icons.check_circle,
      page: FinalCandidateScreen(),
    ),
    MenuItemModel(
      title: "Customers",
      icon: Icons.person,
      page: const Text("Customers"),
    ),
    MenuItemModel(
      title: "Payment Links",
      icon: Icons.payment,
      page: const Text("Payment Links"),
    ),
    MenuItemModel(
      title: "New Vacancy",
      icon: Icons.add,
      page: const Text("New Vacancy"),
    ),
    MenuItemModel(
      title: "Replacements",
      icon: Icons.swap_horiz,
      page: const Text("Replacements"),
    ),
    MenuItemModel(title: "Tasks", icon: Icons.task, page: const Text("Tasks")),
    MenuItemModel(
      title: "Dispute",
      icon: Icons.warning,
      page: const Text("Dispute"),
    ),
  ];

  static List<MenuItemModel> getAdminMenu() => [
    MenuItemModel(
      title: "Dashboard",
      icon: Icons.dashboard,
      page: DashboardScreen(),
    ),
    MenuItemModel(
      title: "Available Candidates",
      icon: Icons.people_alt,
      page: const Text("Available Candidates"),
    ),
    MenuItemModel(
      title: "Working Candidates",
      icon: Icons.work,
      page: const Text("Working Candidates"),
    ),
    MenuItemModel(
      title: "Job Left Maids",
      icon: Icons.exit_to_app,
      page: const Text("Job Left Maids"),
    ),
    MenuItemModel(
      title: "Replacements",
      icon: Icons.group_remove,
      page: const Text("Replacement Needed Customers"),
    ),
    MenuItemModel(title: "Tasks", icon: Icons.task, page: const Text("Tasks")),
    MenuItemModel(
      title: "Dispute",
      icon: Icons.warning_amber_rounded,
      page: const Text("Dispute"),
    ),
  ];
}
