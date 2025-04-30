import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final String userName = "Esther Rompas";
  final String nric = "SXXXX123D";
  final String location = "Yishun (S768839)";
  final String authMethod = "Singpass";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        backgroundColor: Color(0xFF0066CC),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Text("👤 Account Information", style: _sectionHeader),
            Card(
              margin: EdgeInsets.symmetric(vertical: 12),
              child: ListTile(
                leading: Icon(Icons.lock),
                title: Text("Logged in with $authMethod"),
                subtitle: Text("NRIC: $nric\nName: $userName"),
              ),
            ),
            SizedBox(height: 20),
            Text("📍 Residential Area", style: _sectionHeader),
            Card(
              margin: EdgeInsets.symmetric(vertical: 12),
              child: ListTile(
                leading: Icon(Icons.home),
                title: Text("Registered Location"),
                subtitle: Text(location),
              ),
            ),
            SizedBox(height: 20),
            Text("⚙️ App Settings", style: _sectionHeader),
            Card(
              margin: EdgeInsets.symmetric(vertical: 12),
              child: ListTile(
                leading: Icon(Icons.logout, color: Colors.red),
                title: Text("Log Out", style: TextStyle(color: Colors.red)),
                onTap: () {
                  // Mock behavior: close the profile screen
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("You have been logged out.")),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  final TextStyle _sectionHeader = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
}
