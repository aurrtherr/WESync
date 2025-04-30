import 'package:flutter/material.dart';

class CommunityInsights extends StatefulWidget {
  @override
  _CommunityInsightsState createState() => _CommunityInsightsState();
}

class _CommunityInsightsState extends State<CommunityInsights> {
  final List<Map<String, String>> keyInsights = [
    {'title': 'Top Reported Area', 'data': 'Yishun'},
    {'title': 'Most Common Issue', 'data': 'Illegal Dumping'},
    {'title': 'Avg. Resolution Time', 'data': '2.4 days'},
  ];

  final List<Map<String, dynamic>> topIssues = [
    {'issue': 'Illegal Dumping', 'icon': '🗑️', 'count': 34},
    {'issue': 'Noise Complaint', 'icon': '🔊', 'count': 21},
    {'issue': 'Street Light Outage', 'icon': '💡', 'count': 15},
  ];

  final List<Map<String, dynamic>> trends = [
    {'category': 'Illegal Dumping', 'change': '+20%', 'direction': 'up'},
    {'category': 'Noise Complaint', 'change': '-10%', 'direction': 'down'},
    {'category': 'Street Lighting', 'change': '-35%', 'direction': 'down'},
  ];

  final List<Map<String, String>> volunteerEvents = [
    {
      'title': 'Yishun Clean-up Drive',
      'time': '21 Apr, 10AM',
      'location': 'Block 123 Yishun'
    },
    {
      'title': 'Community Recycling',
      'time': '25 Apr, 3PM',
      'location': 'Jurong West CC'
    },
  ];

  final Set<String> _signedUpEvents = {};

  void _toggleVolunteer(BuildContext context, String eventTitle) async {
    if (_signedUpEvents.contains(eventTitle)) {
      setState(() {
        _signedUpEvents.remove(eventTitle);
      });
    } else {
      bool confirm = await showDialog(
        context: context,
        builder: (BuildContext ctx) => AlertDialog(
          title: Text("Confirm Participation"),
          content: Text("Are you sure you want to help out at \"$eventTitle\"?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx, false),
              child: Text("No"),
            ),
            TextButton(
              onPressed: () => Navigator.pop(ctx, true),
              child: Text("Yes"),
            ),
          ],
        ),
      );

      if (confirm) {
        setState(() {
          _signedUpEvents.add(eventTitle);
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("✅ You're scheduled for $eventTitle!")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Community Insights")),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Text("📊 Key Stats", style: _sectionHeaderStyle),
          ...keyInsights.map((item) => Card(
                margin: EdgeInsets.symmetric(vertical: 6),
                child: ListTile(
                  leading: Icon(Icons.insights, color: Colors.blue),
                  title: Text(item['title'] ?? ''),
                  subtitle: Text(item['data'] ?? ''),
                ),
              )),
          SizedBox(height: 20),
          Text("🔥 Top 3 Reported Issues", style: _sectionHeaderStyle),
          ...topIssues.map((issue) => ListTile(
                leading: Text(issue['icon'], style: TextStyle(fontSize: 24)),
                title: Text(issue['issue']),
                trailing: Text("\${issue['count']} reports"),
              )),
          SizedBox(height: 20),
          Text("📈 Weekly Trends", style: _sectionHeaderStyle),
          ...trends.map((trend) {
            final isUp = trend['direction'] == 'up';
            return ListTile(
              leading: Icon(
                isUp ? Icons.arrow_upward : Icons.arrow_downward,
                color: isUp ? Colors.red : Colors.green,
              ),
              title: Text(trend['category']),
              trailing: Text(
                trend['change'],
                style: TextStyle(
                    color: isUp ? Colors.red : Colors.green,
                    fontWeight: FontWeight.bold),
              ),
            );
          }),
          SizedBox(height: 20),
          Text("💡 Recommended Action", style: _sectionHeaderStyle),
          Card(
            color: Colors.lightBlue[50],
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                "Your neighborhood has a high rate of illegal dumping. 🧹 Join the Yishun Clean-Up this Sunday at 10AM!",
                style: TextStyle(fontSize: 15),
              ),
            ),
          ),
          SizedBox(height: 20),
          Text("🙋‍♂️ Volunteer Opportunities", style: _sectionHeaderStyle),
          ...volunteerEvents.map((event) {
            final isScheduled = _signedUpEvents.contains(event['title']);
            return Card(
              color: isScheduled ? Colors.orange[50] : Colors.green[50],
              margin: EdgeInsets.symmetric(vertical: 6),
              child: ListTile(
                leading: Icon(Icons.volunteer_activism,
                    color: isScheduled ? Colors.orange : Colors.green),
                title: Text(event['title'] ?? ''),
                subtitle: Text("\${event['time']} • \${event['location']}"),
                trailing: ElevatedButton(
                  onPressed: () => _toggleVolunteer(context, event['title'] ?? ''),
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        isScheduled ? Colors.redAccent : Colors.green,
                  ),
                  child: Text(isScheduled ? "Cancel" : "Help Out"),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }

  final TextStyle _sectionHeaderStyle =
      TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
}

