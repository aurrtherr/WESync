
import 'package:flutter/material.dart';
import 'report_chatbot.dart';
import 'report_timeline.dart';
import 'community_insights.dart';
import 'rewards_center.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WESync'),
        backgroundColor: Color(0xFF0066CC),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "👋 Welcome back! What would you like to do today?",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              children: [
                _buildCard(
                  context,
                  Icons.chat,
                  'Report an Issue',
                  'Chat with the bot to submit a civic report.',
                  ReportChatbot(),
                  Colors.blue[100]!,
                ),
                _buildCard(
                  context,
                  Icons.timeline,
                  'Track Reports',
                  'View progress on submitted cases.',
                  ReportTimeline(),
                  Colors.orange[100]!,
                ),
                _buildCard(
                  context,
                  Icons.public,
                  'Community Insights',
                  'See trends and activity in your area.',
                  CommunityInsights(),
                  Colors.green[100]!,
                ),
                _buildCard(
                  context,
                  Icons.star,
                  'Rewards Center',
                  'View your points and achievements.',
                  RewardsCenter(),
                  Colors.purple[100]!,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(BuildContext context, IconData icon, String title, String subtitle, Widget screen, Color bgColor) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: InkWell(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => screen)),
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: bgColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: Colors.black87),
              SizedBox(height: 10),
              Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              SizedBox(height: 6),
              Text(subtitle, style: TextStyle(fontSize: 12), textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }
}
