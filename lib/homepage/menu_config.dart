import 'package:flutter/material.dart';
import 'package:practice_app/drawer_widget/jobleft_cand.dart';
import 'package:practice_app/drawer_widget/working_cand.dart';
import '../drawer_widget/available_cand.dart';
import 'menu_item.dart';
import '../drawer_widget/dashboard.dart';
import '../drawer_widget/leads.dart';
import '../drawer_widget/final_candidate.dart';

class MenuConfig {
  static List<MenuItemModel> commonMenu() => [
    MenuItemModel(
      title: "Dashboard",
      icon: Icons.dashboard,
      page: DashboardScreen(),
    ),
    MenuItemModel(
      title: "Available Candidates",
      icon: Icons.work,
      page: AvailableCandidates(),
    ),
    MenuItemModel(
      title: "Working Candidate",
      icon: Icons.check_circle,
      page: WorkingCandidates(),
    ),
    MenuItemModel(
      title: "Customers",
      icon: Icons.person,
      page: const Text("Customers"),
    ),
    MenuItemModel(
      title: "Dispute",
      icon: Icons.warning,
      page: FinalCandidateScreen(),
    ),
    MenuItemModel(title: "Tasks", icon: Icons.task, page: const Text("Tasks")),
  ];

  static List<MenuItemModel> customerMenu() => [
    MenuItemModel(title: "Leads", icon: Icons.people, page: LeadScreen()),
    MenuItemModel(
      title: "Opportunity Leads",
      icon: Icons.trending_up,
      page: LeadScreen(),
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
  ];

  static List<MenuItemModel> candidatesMenu() => [
    MenuItemModel(
      title: "Job Left Maids",
      icon: Icons.exit_to_app,
      page: JobleftCandidates(),
    ),
    MenuItemModel(
      title: "Replacements",
      icon: Icons.group_remove,
      page: const Text("Replacement Needed Customers"),
    ),
  ];

  static List<MenuItemModel> getAdminMenu() =>
      commonMenu() + customerMenu() + candidatesMenu();

  static List<MenuItemModel> getCustomerMenu() => commonMenu() + customerMenu();

  static List<MenuItemModel> getCandidatesMenu() =>
      commonMenu() + candidatesMenu();
}
