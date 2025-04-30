import 'package:flutter/material.dart';

class RewardsCenter extends StatefulWidget {
  @override
  _RewardsCenterState createState() => _RewardsCenterState();
}

class _RewardsCenterState extends State<RewardsCenter> {
  int totalPoints = 130;

  final List<Map<String, String>> achievements = [
    {
      'badge': 'First Report',
      'points': '10 pts',
      'desc': 'Submitted your very first report!'
    },
    {
      'badge': 'Top Contributor',
      'points': '50 pts',
      'desc': 'Reported issues consistently for 7 days.'
    },
    {
      'badge': 'Accuracy Pro',
      'points': '30 pts',
      'desc': 'Submitted highly accurate issue classifications.'
    },
  ];

  final List<Map<String, dynamic>> redeemables = [
    {
      'item': 'NTUC \$2 Voucher',
      'cost': 100,
      'vendor': 'NTUC',
      'icon': Icons.store,
    },
    {
      'item': '7-Eleven Free Drink',
      'cost': 75,
      'vendor': '7-Eleven',
      'icon': Icons.local_drink,
    },
    {
      'item': 'Kopitiam \$1 Off',
      'cost': 50,
      'vendor': 'Kopitiam',
      'icon': Icons.local_cafe,
    },
  ];

  void _redeemReward(BuildContext context, Map<String, dynamic> reward) async {
    bool confirm = await showDialog(
      context: context,
      builder: (BuildContext ctx) => AlertDialog(
        title: Text("Confirm Redemption"),
        content: Text(
          "Are you sure you want to redeem your points for ${reward['item']} from ${reward['vendor']}?",
        ),
        actions: [
          TextButton(
            child: Text("Cancel"),
            onPressed: () => Navigator.pop(ctx, false),
          ),
          TextButton(
            child: Text("Confirm"),
            onPressed: () => Navigator.pop(ctx, true),
          ),
        ],
      ),
    );

    if (confirm && totalPoints >= reward['cost']) {
      setState(() {
        totalPoints -= reward['cost'] as int;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("🎉 You’ve redeemed ${reward['item']}!")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rewards Center"),
        backgroundColor: Color(0xFF0066CC),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: [
            Text(
              "💰 Total Points: $totalPoints pts",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 24),
            Text(
              "🏅 Your Badges",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            ...achievements.map((badge) => Card(
                  elevation: 2,
                  margin: EdgeInsets.symmetric(vertical: 6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.amber[100],
                      child: Icon(Icons.emoji_events, color: Colors.amber[800]),
                    ),
                    title: Text(
                      badge['badge'] ?? '',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(badge['desc'] ?? ''),
                    trailing: Text(
                      badge['points'] ?? '',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                  ),
                )),
            SizedBox(height: 24),
            Text(
              "🎁 Redeemable Rewards",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            ...redeemables.map((reward) {
              final isEligible = totalPoints >= reward['cost'];
              return Card(
                elevation: 2,
                margin: EdgeInsets.symmetric(vertical: 6),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  leading: Icon(reward['icon'], size: 30),
                  title: Text(reward['item']),
                  subtitle: Text("From ${reward['vendor']}"),
                  trailing: ElevatedButton(
                    onPressed: isEligible
                        ? () => _redeemReward(context, reward)
                        : null,
                    child: Text("Redeem (${reward['cost']} pts)"),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
