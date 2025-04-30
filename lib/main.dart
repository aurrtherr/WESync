import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/report_chatbot.dart';
import 'screens/report_timeline.dart';
import 'screens/community_insights.dart';
import 'screens/rewards_center.dart';
import 'screens/profile_screen.dart'; 

void main() {
  runApp(WESyncApp());
}

class WESyncApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WESync',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF0066CC),
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Poppins',
      ),
      home: HomeScreen(),
      routes: {
        '/chatbot': (context) => ReportChatbot(),
        '/timeline': (context) => ReportTimeline(),
        '/insights': (context) => CommunityInsights(),
        '/rewards': (context) => RewardsCenter(),
        '/profile': (context) => ProfileScreen(),
      },
    );
  }
}
