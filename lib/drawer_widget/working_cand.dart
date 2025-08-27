import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:practice_app/models/candidates.dart';
import 'package:practice_app/utils/extensions.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'summarycard.dart';

class WorkingCandidates extends StatefulWidget {
  const WorkingCandidates({super.key});

  @override
  State<WorkingCandidates> createState() => _WorkingCandidatesState();
}

class _WorkingCandidatesState extends State<WorkingCandidates> {
  List<Candidate> candidates = [];
  List<Candidate> filteredCandidates = [];
  late CandidateDataSource _dataSource;
  Widget columnTitle(String text, ColorScheme mycolor) {
    return Center(
      child: Text(
        text,
        style: TextStyle(color: mycolor.tertiary, fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _loadCandidates();
  }

  Future<void> _loadCandidates() async {
    final String response = await rootBundle.loadString(
      'lib/json_data/candidates.json',
    );
    final List<dynamic> data = json.decode(response);
    candidates = data.map((e) => Candidate.fromJson(e)).toList();
    setState(() {
      filteredCandidates = candidates;
      _dataSource = CandidateDataSource(filteredCandidates);
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.media.width;
    final isWeb = screenWidth > 600;
    ColorScheme myColors = context.themeRef.colorScheme;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(14),
        width: screenWidth,
        height: context.media.height,
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                // height: context.media.height,
                width: screenWidth,
                padding: EdgeInsets.all(15),
                margin: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
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
                child: Row(
                  children: [
                    SummaryCard(
                      title: "Working Candidates",
                      count: "0",
                      percent: "+ 0 %",
                      color: Colors.blue,
                      icon: Icons.card_travel,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: screenWidth * 0.8,
                height: context.media.height * 0.7,
                child: SfDataGrid(
                  source: _dataSource,
                  showCheckboxColumn: true,
                  allowColumnsResizing: true,
                  gridLinesVisibility:
                      GridLinesVisibility
                          .both, // Show lines in rows and columns
                  headerGridLinesVisibility:
                      GridLinesVisibility.both, // Show lines in header too
                  allowFiltering: true,
                  allowColumnsDragging: true,
                  defaultColumnWidth: screenWidth * 0.1,
                  allowSorting: true,
                  selectionMode: SelectionMode.multiple,
                  columns: [
                    GridColumn(
                      columnName: 'name',
                      label: columnTitle("Name", myColors),
                    ),
                    GridColumn(
                      columnName: 'age',
                      label: columnTitle("Age", myColors),
                    ),
                    GridColumn(
                      columnName: 'mobile',
                      label: columnTitle("Mobile", myColors),
                    ),
                    GridColumn(
                      columnName: 'category',
                      label: columnTitle("Category", myColors),
                    ),
                    GridColumn(
                      columnName: 'experience',
                      label: columnTitle("Experience", myColors),
                    ),
                    GridColumn(
                      columnName: 'hours',
                      label: columnTitle("Hours", myColors),
                    ),
                    GridColumn(
                      columnName: 'addedBy',
                      label: columnTitle("Added By", myColors),
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

class CandidateDataSource extends DataGridSource {
  CandidateDataSource(this._candidates) {
    buildDataGridRows();
  }

  List<DataGridRow> _dataGridRows = [];
  List<Candidate> _candidates;

  void buildDataGridRows() {
    _dataGridRows =
        _candidates.map((c) {
          return DataGridRow(
            cells: [
              DataGridCell(columnName: 'name', value: c.name),
              DataGridCell(columnName: 'age', value: c.age),
              DataGridCell(columnName: 'mobile', value: c.mobile),
              DataGridCell(columnName: 'category', value: c.category),
              DataGridCell(columnName: 'experience', value: c.experience),
              DataGridCell(columnName: 'hours', value: c.hours),
              DataGridCell(columnName: 'addedBy', value: c.addedBy),
            ],
          );
        }).toList();
  }

  @override
  List<DataGridRow> get rows => _dataGridRows;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells:
          row.getCells().map((cell) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(cell.value.toString()),
            );
          }).toList(),
    );
  }
}
