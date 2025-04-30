import 'package:flutter/material.dart';

class ReportTimeline extends StatelessWidget {
  final List<Map<String, dynamic>> reportList = [
    {
      'title': 'Illegal Dumping',
      'status': 'In Progress',
      'stages': [
        {'stage': 'Submitted', 'date': 'Apr 30'},
      ],
    },
    {
      'title': 'Street Light Outage',
      'status': 'Resolved',
      'stages': [
        {'stage': 'Submitted', 'date': 'Apr 1'},
        {'stage': 'Reviewed', 'date': 'Apr 2'},
        {'stage': 'Forwarded to NEA', 'date': 'Apr 3'},
        {'stage': 'In Progress', 'date': 'Apr 4'},
        {'stage': 'Resolved', 'date': 'Apr 6'},
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Track My Report")),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: reportList.length,
        itemBuilder: (context, index) {
          final report = reportList[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ExpansionTile(
              title: Text(
                report['title'],
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              subtitle: Text("Status: ${report['status']}"),
              children: List.generate(
                report['stages'].length,
                (i) => ListTile(
                  leading: Icon(Icons.check_circle, color: Colors.green),
                  title: Text(report['stages'][i]['stage']),
                  subtitle: Text("Date: ${report['stages'][i]['date']}"),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
